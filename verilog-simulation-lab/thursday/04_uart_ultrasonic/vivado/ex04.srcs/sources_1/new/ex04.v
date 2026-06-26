`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/01/03 23:51:12
// Design Name: 
// Module Name: ex04
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

// ============================================================
// TOP: HC-SR04 거리 측정 값을 UART로 패킷 송신
//  - clk: 100MHz
//  - uart: 115200, 8N1
//  - 프로토콜: 0x02, 0x01, distH, distL, xor, 0x03
// ============================================================
module ex04(
    input  wire        clk,        // 100 MHz
    input  wire        echo,       // HC-SR04 ECHO (레벨시프터 필요 가능)
    output wire        trig,       // HC-SR04 TRIG

    input  wire        uart_rx,    // PC -> FPGA (선택)
    output wire        uart_tx     // FPGA -> PC
);

    // ------------------------------------------------------------
    // Power-On Reset (외부 rst 핀이 없을 때 안전하게 초기화)
    // 약 2^20 / 100MHz ~= 10.5ms
    // ------------------------------------------------------------
    reg [19:0] por_cnt = 20'd0;
    reg        rst     = 1'b1;
    always @(posedge clk) begin
        if (por_cnt == 20'hFFFFF) begin
            rst <= 1'b0;
        end else begin
            por_cnt <= por_cnt + 20'd1;
            rst     <= 1'b1;
        end
    end

    // ------------------------------------------------------------
    // HC-SR04 (5MHz 도메인) -> 100MHz 도메인으로 거리값 동기화
    // ------------------------------------------------------------
    wire [15:0] distance_5m;
    wire        distance_stb_5m;   // 5MHz에서 측정 완료 1틱 펄스

    hc_sr04 u_hc (
        .clk_100m(clk),
        .rst(rst),
        .echo(echo),
        .trig(trig),
        .distance(distance_5m),
        .distance_stb(distance_stb_5m)
    );

    // 5MHz -> 100MHz 이벤트 동기화: toggle 방식
    reg        tog_5m = 1'b0;
    always @(posedge u_hc.clk_5mhz) begin
        if (rst) tog_5m <= 1'b0;
        else if (distance_stb_5m) tog_5m <= ~tog_5m;
    end

    // toggle sync (100MHz)
    reg tog_ff1 = 1'b0, tog_ff2 = 1'b0, tog_ff3 = 1'b0;
    always @(posedge clk) begin
        if (rst) begin
            tog_ff1 <= 1'b0;
            tog_ff2 <= 1'b0;
            tog_ff3 <= 1'b0;
        end else begin
            tog_ff1 <= tog_5m;
            tog_ff2 <= tog_ff1;
            tog_ff3 <= tog_ff2;
        end
    end
    wire new_sample_100m = (tog_ff2 ^ tog_ff3); // 토글 변화 감지

    // 거리 버스(16bit)는 값이 60ms 동안 안정적으로 유지되므로 2FF로 샘플링
    reg [15:0] dist_ff1 = 16'd0, dist_ff2 = 16'd0;
    always @(posedge clk) begin
        if (rst) begin
            dist_ff1 <= 16'd0;
            dist_ff2 <= 16'd0;
        end else begin
            dist_ff1 <= distance_5m;
            dist_ff2 <= dist_ff1;
        end
    end

// -----------------------------
// UART TX 연결
// -----------------------------
wire       tx_busy;
wire       tx_done;


uart_tx_8n1 #(
    .CLK_HZ(100_000_000),
    .BAUD  (115_200)
) u_tx (
    .clk    (clk),
    .rst    (rst),
    .data_in(tx_byte),     // <-- reg가 아니라 wire
    .start  (tx_start),
    .tx     (uart_tx),
    .busy   (tx_busy),
    .done   (tx_done)
);

// -----------------------------
// 패킷 바이트 구성
// -----------------------------
reg [15:0] dist_latched = 16'd0;
wire [7:0] TYPE   = 8'h01;
wire [7:0] DIST_H = dist_latched[15:8];
wire [7:0] DIST_L = dist_latched[7:0];
wire [7:0] CHK    = TYPE ^ DIST_H ^ DIST_L;

// idx: 0..5 (총 6바이트)
reg [2:0] idx = 3'd0;
reg       sending = 1'b0;

wire tx_start;

wire [7:0] tx_byte =
    (idx == 3'd0) ? 8'h02 :
    (idx == 3'd1) ? TYPE  :
    (idx == 3'd2) ? DIST_H:
    (idx == 3'd3) ? DIST_L:
    (idx == 3'd4) ? CHK   :
                    8'h03;

// ------------------------------------------------------------
// TX 제어 FSM: tx_start는 "상태(FIRE)"에서 1 사이클 유지
// idx는 tx_done 이후에만 증가
// ------------------------------------------------------------
localparam [1:0]
    TX_IDLE     = 2'd0,
    TX_FIRE     = 2'd1,
    TX_WAITBUSY = 2'd2,
    TX_WAITDONE = 2'd3;

reg [1:0] txst = TX_IDLE;

// tx_start는 상태로부터 조합 출력 (한 사이클 전체 동안 안정)
assign tx_start = (txst == TX_FIRE);

always @(posedge clk) begin
    if (rst) begin
        txst         <= TX_IDLE;
        idx          <= 3'd0;
        dist_latched <= 16'd0;
    end else begin
        case (txst)
            TX_IDLE: begin
                if (new_sample_100m) begin
                    dist_latched <= dist_ff2; // 새 거리 래치
                    idx          <= 3'd0;     // STX부터
                    txst         <= TX_FIRE;  // 다음 posedge에 TX가 start를 보게 됨
                end
            end

            // 이 상태의 "한 사이클 동안" tx_start=1이 유지됨
            TX_FIRE: begin
                txst <= TX_WAITBUSY;
            end

            // 실제로 TX가 시작되면 busy가 1이 됨
            TX_WAITBUSY: begin
                if (tx_busy) txst <= TX_WAITDONE;
            end

            // 한 바이트 전송 완료(done) 후 다음 바이트로
            TX_WAITDONE: begin
                if (tx_done) begin
                    if (idx == 3'd5) begin
                        txst <= TX_IDLE;      // 6바이트 완료
                    end else begin
                        idx  <= idx + 3'd1;   // 다음 바이트
                        txst <= TX_FIRE;      // 다음 바이트 start
                    end
                end
            end

            default: txst <= TX_IDLE;
        endcase
    end
end




    // ------------------------------------------------------------
    // UART RX + 패킷 파서(수신) : PC가 동일 프로토콜로 보내면 해석 가능(선택)
    // ------------------------------------------------------------
    wire       rx_valid;
    wire [7:0] rx_data;

    uart_rx_8n1 #(
        .CLK_HZ(100_000_000),
        .BAUD  (115_200)
    ) u_rx (
        .clk     (clk),
        .rst     (rst),
        .rx      (uart_rx),
        .data_out(rx_data),
        .valid   (rx_valid)
    );

    // 수신 패킷 파서 (동일 6바이트 프로토콜)
    wire        pkt_ok;
    wire        pkt_err;
    wire [15:0] pkt_distance;

    packet_rx_parser u_parser (
        .clk        (clk),
        .rst        (rst),
        .rx_valid   (rx_valid),
        .rx_byte    (rx_data),
        .pkt_ok     (pkt_ok),
        .pkt_err    (pkt_err),
        .distance_cm(pkt_distance)
    );

    // 필요하다면 pkt_ok/pkt_err/pkt_distance를 ILA/VIO로 확인하거나
    // 내부 제어에 사용할 수 있습니다.

endmodule

// ============================================================
// HC-SR04 (원 코드 기반 + 측정완료 strobe 추가)
//  - 내부에 clk_wiz_0로 5MHz 생성
//  - distance_stb: 거리 업데이트 순간 1틱 펄스 (5MHz 도메인)
// ============================================================
module hc_sr04(
    input  wire        clk_100m,
    input  wire        rst,
    input  wire        echo,
    output reg         trig,
    output reg [15:0]  distance,
    output reg         distance_stb
);
    // 100MHz -> 5MHz
    wire clk_5mhz;
    clk_wiz_0 u0 (
        .clk_out1(clk_5mhz),
        .clk_in1 (clk_100m)
    );

    // (TOP에서 동기화용으로 참조하기 위해 공개)
    // synthesis translate_off
    // verilator lint_off UNUSED
    // synthesis translate_on
    // NOTE: 상위에서 u_hc.clk_5mhz로 참조하는 형태를 사용했으므로,
    //       툴/스타일에 따라 아래처럼 별도 output으로 빼는 것이 더 정석입니다.
    //       필요 시 output wire clk_5mhz_out 추가 권장.
    // ------------------------------------------------------------
    // constants @ 5MHz tick = 0.2us
    localparam integer TRIG_TICKS    = 50;         // 10us
    localparam integer PERIOD_TICKS  = 300_000;    // 60ms
    localparam integer TIMEOUT_TICKS = 150_000;    // 30ms
    localparam integer CM_DIV        = 290;

    // echo sync (5MHz)
    reg echo_ff1 = 1'b0, echo_ff2 = 1'b0;
    always @(posedge clk_5mhz) begin
        echo_ff1 <= echo;
        echo_ff2 <= echo_ff1;
    end
    wire echo_s = echo_ff2;

    // states
    localparam [2:0]
        S_WAIT  = 3'd0,
        S_TRIG  = 3'd1,
        S_WAITE = 3'd2,
        S_ECHO  = 3'd3;

    reg [2:0]  state = S_WAIT;
    reg [18:0] period_cnt  = 19'd0;
    reg [15:0] trig_cnt    = 16'd0;
    reg [17:0] echo_cnt    = 18'd0;
    reg [17:0] timeout_cnt = 18'd0;

    always @(posedge clk_5mhz) begin
        if (rst) begin
            trig         <= 1'b0;
            distance     <= 16'd0;
            distance_stb <= 1'b0;
            state        <= S_WAIT;
            period_cnt   <= 19'd0;
            trig_cnt     <= 16'd0;
            echo_cnt     <= 18'd0;
            timeout_cnt  <= 18'd0;
        end else begin
            distance_stb <= 1'b0; // 기본 0, 업데이트 순간만 1

            case (state)
                S_WAIT: begin
                    trig        <= 1'b0;
                    timeout_cnt <= 18'd0;
                    echo_cnt    <= 18'd0;

                    if (period_cnt == PERIOD_TICKS - 1) begin
                        period_cnt <= 19'd0;
                        trig_cnt   <= 16'd0;
                        trig       <= 1'b1;
                        state      <= S_TRIG;
                    end else begin
                        period_cnt <= period_cnt + 19'd1;
                    end
                end

                S_TRIG: begin
                    if (trig_cnt == TRIG_TICKS - 1) begin
                        trig        <= 1'b0;
                        trig_cnt    <= 16'd0;
                        timeout_cnt <= 18'd0;
                        state       <= S_WAITE;
                    end else begin
                        trig_cnt <= trig_cnt + 16'd1;
                    end
                end

                S_WAITE: begin
                    if (echo_s) begin
                        echo_cnt    <= 18'd0;
                        timeout_cnt <= 18'd0;
                        state       <= S_ECHO;
                    end else begin
                        if (timeout_cnt == TIMEOUT_TICKS - 1) begin
                            distance     <= 16'd0;
                            distance_stb <= 1'b1;
                            state        <= S_WAIT;
                        end else begin
                            timeout_cnt <= timeout_cnt + 18'd1;
                        end
                    end
                end

                S_ECHO: begin
                    if (echo_s) begin
                        if (echo_cnt != 18'h3FFFF)
                            echo_cnt <= echo_cnt + 18'd1;

                        if (timeout_cnt == TIMEOUT_TICKS - 1) begin
                            distance     <= 16'd0;
                            distance_stb <= 1'b1;
                            state        <= S_WAIT;
                        end else begin
                            timeout_cnt <= timeout_cnt + 18'd1;
                        end
                    end else begin
                        distance     <= echo_cnt / CM_DIV;
                        distance_stb <= 1'b1;
                        state        <= S_WAIT;
                    end
                end

                default: state <= S_WAIT;
            endcase
        end
    end

    // TOP에서 u_hc.clk_5mhz로 참조하는 것을 허용하기 위한 꼼수 방지:
    // 실제로는 output으로 빼는 편이 좋습니다.
    // 여기서는 모듈 내부 신호를 계층 참조하는 형태를 썼으므로,
    // 툴 정책에 따라 에러가 날 수 있습니다.
    // 필요하면 아래처럼 output을 추가하세요:
    // output wire clk_5mhz_out; assign clk_5mhz_out = clk_5mhz;

endmodule

// ============================================================
// UART TX 8N1
//  - start 펄스(1clk)로 data_in 송신 시작
//  - busy 동안 새로운 start 무시
// ============================================================
module uart_tx_8n1 #(
    parameter integer CLK_HZ = 100_000_000,
    parameter integer BAUD   = 115_200
)(
    input  wire       clk,
    input  wire       rst,
    input  wire [7:0] data_in,
    input  wire       start,
    output reg        tx,
    output reg        busy,
    output reg        done
);
    localparam integer CLKS_PER_BIT = (CLK_HZ + (BAUD/2)) / BAUD; // 반올림

    localparam [2:0]
        T_IDLE  = 3'd0,
        T_START = 3'd1,
        T_DATA  = 3'd2,
        T_STOP  = 3'd3,
        T_DONE  = 3'd4;

    reg [2:0]  state = T_IDLE;
    reg [12:0] clk_cnt = 13'd0;   // 868 정도면 13비트 충분
    reg [2:0]  bit_idx = 3'd0;
    reg [7:0]  shreg   = 8'd0;

    always @(posedge clk) begin
        if (rst) begin
            tx      <= 1'b1; // idle high
            busy    <= 1'b0;
            done    <= 1'b0;
            state   <= T_IDLE;
            clk_cnt <= 13'd0;
            bit_idx <= 3'd0;
            shreg   <= 8'd0;
        end else begin
            done <= 1'b0;

            case (state)
                T_IDLE: begin
                    tx   <= 1'b1;
                    busy <= 1'b0;
                    if (start) begin
                        busy    <= 1'b1;
                        shreg   <= data_in;
                        clk_cnt <= 13'd0;
                        state   <= T_START;
                        tx      <= 1'b0; // start bit
                    end
                end

                T_START: begin
                    if (clk_cnt == CLKS_PER_BIT-1) begin
                        clk_cnt <= 13'd0;
                        bit_idx <= 3'd0;
                        state   <= T_DATA;
                        tx      <= shreg[0];
                    end else begin
                        clk_cnt <= clk_cnt + 13'd1;
                    end
                end

                T_DATA: begin
                    if (clk_cnt == CLKS_PER_BIT-1) begin
                        clk_cnt <= 13'd0;
                        if (bit_idx == 3'd7) begin
                            state <= T_STOP;
                            tx    <= 1'b1; // stop bit
                        end else begin
                            bit_idx <= bit_idx + 3'd1;
                            tx      <= shreg[bit_idx+1];
                        end
                    end else begin
                        clk_cnt <= clk_cnt + 13'd1;
                    end
                end

                T_STOP: begin
                    if (clk_cnt == CLKS_PER_BIT-1) begin
                        clk_cnt <= 13'd0;
                        state   <= T_DONE;
                    end else begin
                        clk_cnt <= clk_cnt + 13'd1;
                    end
                end

                T_DONE: begin
                    done  <= 1'b1;
                    state <= T_IDLE;
                end

                default: state <= T_IDLE;
            endcase
        end
    end

endmodule

// ============================================================
// UART RX 8N1 (간단형)
//  - valid 1클럭 펄스로 data_out 제공
// ============================================================
module uart_rx_8n1 #(
    parameter integer CLK_HZ = 100_000_000,
    parameter integer BAUD   = 115_200
)(
    input  wire       clk,
    input  wire       rst,
    input  wire       rx,
    output reg [7:0]  data_out,
    output reg        valid
);
    localparam integer CLKS_PER_BIT = (CLK_HZ + (BAUD/2)) / BAUD;
    localparam integer HALF_BIT     = CLKS_PER_BIT / 2;

    localparam [2:0]
        R_IDLE  = 3'd0,
        R_START = 3'd1,
        R_DATA  = 3'd2,
        R_STOP  = 3'd3,
        R_DONE  = 3'd4;

    reg [2:0]  state = R_IDLE;
    reg [12:0] clk_cnt = 13'd0;
    reg [2:0]  bit_idx = 3'd0;
    reg [7:0]  shreg   = 8'd0;

    // RX sync
    reg rx_ff1 = 1'b1, rx_ff2 = 1'b1;
    always @(posedge clk) begin
        rx_ff1 <= rx;
        rx_ff2 <= rx_ff1;
    end
    wire rx_s = rx_ff2;

    always @(posedge clk) begin
        if (rst) begin
            data_out <= 8'd0;
            valid    <= 1'b0;
            state    <= R_IDLE;
            clk_cnt  <= 13'd0;
            bit_idx  <= 3'd0;
            shreg    <= 8'd0;
        end else begin
            valid <= 1'b0;

            case (state)
                R_IDLE: begin
                    clk_cnt <= 13'd0;
                    bit_idx <= 3'd0;
                    if (rx_s == 1'b0) begin
                        state <= R_START;
                    end
                end

                // start bit 중앙 샘플링
                R_START: begin
                    if (clk_cnt == HALF_BIT) begin
                        if (rx_s == 1'b0) begin
                            clk_cnt <= 13'd0;
                            state   <= R_DATA;
                        end else begin
                            state <= R_IDLE; // false start
                        end
                    end else begin
                        clk_cnt <= clk_cnt + 13'd1;
                    end
                end

                R_DATA: begin
                    if (clk_cnt == CLKS_PER_BIT-1) begin
                        clk_cnt <= 13'd0;
                        shreg[bit_idx] <= rx_s;
                        if (bit_idx == 3'd7) begin
                            state <= R_STOP;
                        end else begin
                            bit_idx <= bit_idx + 3'd1;
                        end
                    end else begin
                        clk_cnt <= clk_cnt + 13'd1;
                    end
                end

                R_STOP: begin
                    if (clk_cnt == CLKS_PER_BIT-1) begin
                        clk_cnt <= 13'd0;
                        // stop bit 검사(선택)
                        if (rx_s == 1'b1) begin
                            data_out <= shreg;
                            state    <= R_DONE;
                        end else begin
                            state <= R_IDLE; // framing error
                        end
                    end else begin
                        clk_cnt <= clk_cnt + 13'd1;
                    end
                end

                R_DONE: begin
                    valid <= 1'b1;
                    state <= R_IDLE;
                end

                default: state <= R_IDLE;
            endcase
        end
    end

endmodule

// ============================================================
// 수신 패킷 파서: 0x02 ... 0x03 6바이트 고정
//  - pkt_ok: 정상 패킷 수신 1클럭 펄스
//  - pkt_err: 체크/프레임 오류 발생 1클럭 펄스
// ============================================================
module packet_rx_parser(
    input  wire        clk,
    input  wire        rst,
    input  wire        rx_valid,
    input  wire [7:0]  rx_byte,
    output reg         pkt_ok,
    output reg         pkt_err,
    output reg [15:0]  distance_cm
);
    localparam [2:0]
        W_STX  = 3'd0,
        W_TYP  = 3'd1,
        W_HI   = 3'd2,
        W_LO   = 3'd3,
        W_CHK  = 3'd4,
        W_ETX  = 3'd5;

    reg [2:0] st = W_STX;
    reg [7:0] typ, hi, lo, chk;

    wire [7:0] chk_calc = typ ^ hi ^ lo;

    always @(posedge clk) begin
        if (rst) begin
            st          <= W_STX;
            pkt_ok      <= 1'b0;
            pkt_err     <= 1'b0;
            distance_cm <= 16'd0;
            typ         <= 8'd0;
            hi          <= 8'd0;
            lo          <= 8'd0;
            chk         <= 8'd0;
        end else begin
            pkt_ok  <= 1'b0;
            pkt_err <= 1'b0;

            if (rx_valid) begin
                case (st)
                    W_STX: begin
                        if (rx_byte == 8'h02) st <= W_TYP;
                        else st <= W_STX;
                    end

                    W_TYP: begin
                        typ <= rx_byte;
                        st  <= W_HI;
                    end

                    W_HI: begin
                        hi <= rx_byte;
                        st <= W_LO;
                    end

                    W_LO: begin
                        lo <= rx_byte;
                        st <= W_CHK;
                    end

                    W_CHK: begin
                        chk <= rx_byte;
                        st  <= W_ETX;
                    end

                    W_ETX: begin
                        if (rx_byte != 8'h03) begin
                            pkt_err <= 1'b1;
                        end else if (chk != chk_calc) begin
                            pkt_err <= 1'b1;
                        end else begin
                            // (선택) typ==8'h01 확인을 넣고 싶으면 아래 조건 추가
                            // if (typ != 8'h01) pkt_err <= 1'b1; else ...
                            distance_cm <= {hi, lo};
                            pkt_ok      <= 1'b1;
                        end
                        st <= W_STX;
                    end

                    default: st <= W_STX;
                endcase
            end
        end
    end

endmodule

