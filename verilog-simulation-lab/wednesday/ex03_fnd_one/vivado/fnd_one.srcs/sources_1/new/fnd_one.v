`timescale 1ns / 1ps

module fnd_one(
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

// ------------------------------------------------------------
// 1초 = 5,000,000 클럭(5MHz 기준)
// ------------------------------------------------------------
localparam integer SEC_TICKS = 5_000_000;
reg [22:0] cnt = 23'd0;      // 0..4,999,999

reg [3:0] digit = 4'd0;      // 0..9

// 7-seg 디코더 (Basys3: common anode, active-low)
// seg = {a,b,c,d,e,f,g}  (seg[6]=a ... seg[0]=g)
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
        default: seg7 = 7'b1111111; // 모두 끔
    endcase
end
endfunction

// an: 4자리 모두 켜서 같은 숫자 표시 (active-low)
always @(*) begin
    an  = 4'b0000;         // AN3..AN0 모두 enable
    seg = seg7(digit);
end

// 1초마다 digit 증가
always @(posedge clk_5Mhz) begin
    if (cnt == SEC_TICKS-1) begin
        cnt <= 23'd0;

        if (digit == 4'd9) digit <= 4'd0;
        else               digit <= digit + 4'd1;

    end else begin
        cnt <= cnt + 23'd1;
    end
end

endmodule