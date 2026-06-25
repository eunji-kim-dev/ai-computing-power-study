`timescale 1ns / 1ps

module fnd_dynammic(
  input  wire       clk,   // 100MHz
  output reg  [6:0] seg,
  output reg  [3:0] an
);

wire clk_5Mhz;

clk_wiz_0 u0
(
    .clk_out1(clk_5Mhz),  // 5MHz
    .clk_in1(clk)         // 100MHz
);

// ============================================================
// 1) 1초 카운터 (5MHz 기준)
// ============================================================
localparam integer SEC_TICKS = 5_000_000; // 1s @ 5MHz
reg [22:0] sec_cnt = 23'd0;

// 표시할 0~9999 값
reg [13:0] value = 14'd0; // 0..9999 (2^14=16384)

// 1초마다 value 증가 (9999 -> 0)
always @(posedge clk_5Mhz) begin
    if (sec_cnt == SEC_TICKS-1) begin
        sec_cnt <= 23'd0;

        if (value == 14'd9999) value <= 14'd0;
        else                   value <= value + 14'd1;

    end else begin
        sec_cnt <= sec_cnt + 23'd1;
    end
end

// ============================================================
// 2) 다이나믹 스캔 (5MHz -> 스캔 주파수 생성)
//    너무 빠를 필요 없음. 자리당 ~1kHz 정도면 충분.
//    5MHz / 1250 = 4kHz (전체 프레임 4kHz), 자리당 1kHz
// ============================================================
localparam integer SCAN_DIV = 1250;     // 5_000_000 / 1250 = 4000 Hz
reg [10:0] scan_cnt = 11'd0;           // 0..1249 (2^11=2048)
reg [1:0]  scan_sel = 2'd0;            // 0..3

always @(posedge clk_5Mhz) begin
    if (scan_cnt == SCAN_DIV-1) begin
        scan_cnt <= 11'd0;
        scan_sel <= scan_sel + 2'd1;
    end else begin
        scan_cnt <= scan_cnt + 11'd1;
    end
end

// ============================================================
// 3) 7-seg 디코더 (Basys3: common anode, active-low)
//    seg = {a,b,c,d,e,f,g}  (seg[6]=a ... seg[0]=g)
// ============================================================
function automatic [6:0] seg7(input [3:0] d);
begin
    case (d)
        4'd0: seg7 = 7'b1000000;
        4'd1: seg7 = 7'b1111001;
        4'd2: seg7 = 7'b0100100;
        4'd3: seg7 = 7'b0110000;
        4'd4: seg7 = 7'b0011001;
        4'd5: seg7 = 7'b0010010;
        4'd6: seg7 = 7'b0000010;
        4'd7: seg7 = 7'b1111000;
        4'd8: seg7 = 7'b0000000;
        4'd9: seg7 = 7'b0010000;
        default: seg7 = 7'b1111111;
    endcase
end
endfunction

// ============================================================
// 4) value를 4자리(천/백/십/일)로 분해해서 스캔 출력
//    (쉬운 방식: /와 % 사용. FPGA에서도 합성 가능)
// ============================================================
wire [3:0] d0 =  value        % 10;          // 1의 자리
wire [3:0] d1 = (value / 10)  % 10;          // 10의 자리
wire [3:0] d2 = (value / 100) % 10;          // 100의 자리
wire [3:0] d3 = (value / 1000) % 10;         // 1000의 자리

reg [3:0] cur_digit;

always @(*) begin
    // 기본값
    an = 4'b1111;      // 모두 끔 (active-low)
    cur_digit = 4'd0;

    case (scan_sel)
        2'd0: begin an = 4'b1110; cur_digit = d0; end // AN0 (1의 자리)
        2'd1: begin an = 4'b1101; cur_digit = d1; end // AN1 (10의 자리)
        2'd2: begin an = 4'b1011; cur_digit = d2; end // AN2 (100의 자리)
        2'd3: begin an = 4'b0111; cur_digit = d3; end // AN3 (1000의 자리)
        default: begin an = 4'b1111; cur_digit = 4'd0; end
    endcase

    seg = seg7(cur_digit);
end

endmodule

