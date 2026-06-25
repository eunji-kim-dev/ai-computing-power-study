`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/02/04 21:33:19
// Design Name: 
// Module Name: led_shift
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
module led_shift(
  input  clk,   // 100MHz
  output reg [15:0] led
);


wire clk_5Mhz;

/*
clk_wiz_0 u0
(
    .clk_out1(clk_5Mhz),  // 5MHz
    .clk_in1(clk)         // 100MHz
);
*/
//fixme 
assign clk_5Mhz = clk; 
// ------------------------------------------------------------
// 1초 = 5,000,000 클럭(5MHz 기준)
// ------------------------------------------------------------
localparam integer SEC_TICKS = 50;

reg [22:0] cnt = 23'd0;      // 0..49

initial begin
  led <= 16'h0001;
end

always @(posedge clk_5Mhz) begin
    // 1초 카운트
    if (cnt == SEC_TICKS-1) begin
        cnt <= 23'd0;

        // LED shift + wrap
        if (led == 16'h8000)
            led <= 16'h0001;
        else
            led <= (led << 1);

    end else begin
        cnt <= cnt + 23'd1;
    end
end

endmodule

