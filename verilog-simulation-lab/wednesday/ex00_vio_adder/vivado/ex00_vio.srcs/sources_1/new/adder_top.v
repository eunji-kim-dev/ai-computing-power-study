`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/06/23 22:16:08
// Design Name: 
// Module Name: adder_top
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


module adder_top(
   input wire clk
    );
   
  wire [31:0] a;
  wire [31:0] b;
  wire [32:0] result;    

adder32 uut1(
     a,
     b,
     result
);
 
vio_0 uut0 (
  .clk(clk),                // input wire clk
  .probe_in0(result),    // input wire [32 : 0] probe_in0
  .probe_out0(a),  // output wire [31 : 0] probe_out0
  .probe_out1(b)  // output wire [31 : 0] probe_out1
);    
    
endmodule



