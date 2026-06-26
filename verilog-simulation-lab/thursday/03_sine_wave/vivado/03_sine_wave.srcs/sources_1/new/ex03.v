`timescale 1ns / 1ps
`default_nettype none

module ex03(
    input  wire       clk,      // 100 MHz
    input  wire       rst,
    output wire       led,
    output wire [3:0] JA        // JA[0]=nSYNC, JA[1]=D1, JA[2]=D2, JA[3]=SCLK
);

wire [4:0] freq_sel; // 0..31  -> 100..320 Hz

vio_1 u1 (
  .clk(clk),                // input wire clk
  .probe_out0(freq_sel)  // output wire [4 : 0] probe_out0
);

sine_gen u0(
    .clk(clk),      // 100 MHz
    .rst(rst),
    .freq_sel(freq_sel), // 0..31  -> 100..320 Hz
    .led(led),
    .JA(JA)        // JA[0]=nSYNC, JA[1]=D1, JA[2]=D2, JA[3]=SCLK
);



endmodule

module sine_gen(
    input  wire       clk,      // 100 MHz
    input  wire       rst,
    input  wire [4:0] freq_sel, // 0..31  -> 100..320 Hz
    output wire       led,
    output wire [3:0] JA        // JA[0]=nSYNC, JA[1]=D1, JA[2]=D2, JA[3]=SCLK
);


    // ============================================================
    // 0) 고정 샘플링(업데이트) 속도: 256 kS/s
    // ============================================================
    localparam integer CLK_HZ = 100_000_000;
    localparam integer FS_HZ  = 256_000;

    // acc 방식 tick 생성: 매 clk마다 acc+=FS_HZ; acc>=CLK_HZ면 tick
    reg  [31:0] acc = 32'd0;
    reg         samp_tick = 1'b0;

    always @(posedge clk) begin
        if (rst) begin
            acc       <= 32'd0;
            samp_tick <= 1'b0;
        end else begin
            samp_tick <= 1'b0;
            if (acc + FS_HZ >= CLK_HZ) begin
                acc       <= (acc + FS_HZ) - CLK_HZ;
                samp_tick <= 1'b1; // 1클록 펄스
            end else begin
                acc <= acc + FS_HZ;
            end
        end
    end

    // ============================================================
    // 1) 5비트 입력 -> 100..320 Hz 매핑 (끝점 정확)
    //    fout = 100 + round(220*sel/31)
    // ============================================================
    wire [15:0] fout_hz =
        16'd100 + ((16'd220 * freq_sel + 16'd15) / 16'd31);

    // ============================================================
    // 2) DDS: phase_acc += phase_inc (매 샘플)
    //    addr = phase_acc[31:24]  (256포인트)
    //    phase_inc = round(fout * 2^32 / Fs)
    // ============================================================
    localparam [63:0] TWO_POW_32 = 64'd4294967296;

    wire [31:0] phase_inc =
        ((fout_hz * TWO_POW_32) + (FS_HZ/2)) / FS_HZ;

    reg  [31:0] phase_acc = 32'd0;
    wire [7:0]  addr      = phase_acc[31:24];

    // ============================================================
    // 3) BRAM(ROM) 출력 + start 펄스
    //    - BRAM이 동기 read(1클록 지연)라고 가정
    //    - samp_tick에서 phase_acc 갱신(=addr 변함)
    //    - 다음 클록에 BRAM douta가 안정 -> 그때 start 1펄스
    // ============================================================
    wire busy;
    reg  pending_start = 1'b0;
    reg  start = 1'b0;

    always @(posedge clk) begin
        if (rst) begin
            phase_acc      <= 32'd0;
            pending_start  <= 1'b0;
            start          <= 1'b0;
        end else begin
            start <= 1'b0;

            // 샘플 타이밍: busy가 아니고 pending이 없을 때만 진행
            if (samp_tick && !busy && !pending_start) begin
                phase_acc     <= phase_acc + phase_inc;
                pending_start <= 1'b1;   // 다음 클록에 start
            end

            // BRAM 출력이 유효해진 다음 클록에 start 1펄스
            if (pending_start && !busy) begin
                start         <= 1'b1;
                pending_start <= 1'b0;
            end
        end
    end

    // ============================================================
    // 4) 256x12 ROM (blk_mem_gen_0)
    //    - addra: addr (DDS에서 나온 8비트)
    //    - douta: dac_code (12비트)
    // ============================================================
    wire [11:0] dac_code;

    blk_mem_gen_0 u_bram (
        .clka (clk),
        .addra(addr),
        .douta(dac_code)
    );

    // ============================================================
    // 5) DA2 직렬화 전송
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

endmodule


// ============================================================
// DA2RefComp-like serializer (기존 유지)
// SCLK=5MHz (100MHz / (2*10))
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
                // DAC121S101 frame: [15:12]=0000, [11:0]=DATA
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
