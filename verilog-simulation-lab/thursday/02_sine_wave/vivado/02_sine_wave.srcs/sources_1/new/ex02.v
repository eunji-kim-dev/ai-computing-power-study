`timescale 1ns / 1ps
`default_nettype none

module ex02(
    input  wire       clk,   // 100 MHz
    input  wire       rst,
    input  wire [4:0] freq_sel,   // <-- 추가: 0..31
    output wire       led,
    output wire [3:0] JA
);

    localparam integer CLK_HZ = 100_000_000;

    // ------------------------------------------------------------
    // 5비트 값 -> 100..320 Hz 매핑 (끝점 정확)
    // fout = 100 + round(220*sel/31)
    // round용으로 +15 (31의 절반 근사) 사용
    // ------------------------------------------------------------
    wire [15:0] fout_hz =
        16'd100 + ( (16'd220 * freq_sel + 16'd15) / 16'd31 );

    // 256포인트 LUT이므로 update_hz = 256 * fout_hz
    wire [31:0] update_hz = {fout_hz, 8'd0};  // *256 == <<8

    // ============================================================
    // 1) 가변 update_hz 기반 tick 생성 (누산기 방식)
    // ============================================================
    reg  [31:0] acc = 32'd0;
    reg         upd_tick = 1'b0;

    always @(posedge clk) begin
        if (rst) begin
            acc      <= 32'd0;
            upd_tick <= 1'b0;
        end else begin
            upd_tick <= 1'b0;

            if (acc + update_hz >= CLK_HZ) begin
                acc      <= (acc + update_hz) - CLK_HZ;
                upd_tick <= 1'b1;   // 1클록 펄스
            end else begin
                acc <= acc + update_hz;
            end
        end
    end

    // ============================================================
    // 2) Phase (0..255) and BRAM output
    //    BRAM은 보통 1클록 지연 read
    // ============================================================
    reg  [7:0]  phase = 8'd0;
    wire [11:0] dac_code;     // <-- 상수로 구동하지 말고 BRAM만 구동하게!

    // ============================================================
    // 3) start 생성 (BRAM 출력 안정 후 start)
    // ============================================================
    wire busy;
    reg  pending_start = 1'b0;
    reg  start = 1'b0;

    always @(posedge clk) begin
        if (rst) begin
            phase         <= 8'd0;
            pending_start <= 1'b0;
            start         <= 1'b0;
        end else begin
            start <= 1'b0;

            // tick에서 주소만 증가 (다음 클록에 dac_code가 유효해짐)
            if (upd_tick && !busy && !pending_start) begin
                phase         <= phase + 8'd1;
                pending_start <= 1'b1;   // 다음 클록에 start 발생
            end

            // 다음 클록에 start 1펄스
            if (pending_start && !busy) begin
                start         <= 1'b1;
                pending_start <= 1'b0;
            end
        end
    end

    // ============================================================
    // 4) DA2 serializer
    // ============================================================
    da2_refcomp_like u_da2 (
        .clk100 (clk),
        .rst    (rst),

        .start  (start),
        .data1  (dac_code),
        .data2  (dac_code),

        .nSYNC  (JA[0]),
        .D1     (JA[1]),
        .D2     (JA[2]),
        .SCLK   (JA[3]),

        .busy   (busy),
        .done   (led)
    );

    // ============================================================
    // 5) BRAM IP (blk_mem_gen)
    //    - Width: 12
    //    - Depth: 256
    //    - Read: synchronous (권장)
    // ============================================================
    blk_mem_gen_0 u_bram (
        .clka (clk),
        .addra(phase),
        .douta(dac_code)
    );

endmodule

`default_nettype wire


`default_nettype wire


// ============================================================
// DA2RefComp-like serializer (unchanged)
// ============================================================
module da2_refcomp_like(
    input  wire       clk100,
    input  wire       rst,

    input  wire       start,
    input  wire [11:0] data1,
    input  wire [11:0] data2,

    output wire       nSYNC,
    output wire       D1,
    output wire       D2,
    output wire       SCLK,

    output wire       busy,
    output reg        done
);

    // 100MHz -> 5MHz SCLK
    reg [3:0] div_cnt = 4'd0;
    reg       sclk_r  = 1'b0;

    always @(posedge clk100) begin
        if (rst) begin
            div_cnt <= 4'd0;
            sclk_r  <= 1'b0;
        end else begin
            if (div_cnt == 4'd9) begin
                div_cnt <= 4'd0;
                sclk_r  <= ~sclk_r;
            end else begin
                div_cnt <= div_cnt + 4'd1;
            end
        end
    end
    assign SCLK = sclk_r;

    // SCLK rising detect
    reg sclk_d;
    always @(posedge clk100) begin
        if (rst) sclk_d <= 1'b0;
        else     sclk_d <= sclk_r;
    end
    wire sclk_rise = (sclk_r == 1'b1) && (sclk_d == 1'b0);

    // shift regs
    reg [15:0] shA = 16'h0000;
    reg [15:0] shB = 16'h0000;

    reg [4:0] cnt = 5'd16;
    wire idle = (cnt == 5'd16);

    assign nSYNC = idle;     // idle=1 -> nSYNC high, active->low
    assign busy  = ~idle;

    assign D1 = shA[15];
    assign D2 = shB[15];

    always @(posedge clk100) begin
        if (rst) begin
            shA  <= 16'h0000;
            shB  <= 16'h0000;
            cnt  <= 5'd16;
            done <= 1'b0;
        end else begin
            done <= 1'b0;

            if (start && idle) begin
                shA <= {4'b0000, data1};
                shB <= {4'b0000, data2};
                cnt <= 5'd0;
            end

            if (!idle && sclk_rise) begin
                shA <= {shA[14:0], shA[15]};
                shB <= {shB[14:0], shB[15]};

                if (cnt == 5'd15) begin
                    cnt  <= 5'd16;
                    done <= 1'b1;
                end else begin
                    cnt <= cnt + 5'd1;
                end
            end
        end
    end

endmodule

`default_nettype wire
