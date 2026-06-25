`timescale 1ns / 1ps

module adder32_top (
 input wire clk
);

wire [31:0] a;
wire [31:0] b;
wire [32:0] result;
adder32 utl (a, b, result);

vio_0 your_instance_name (
  .clk(clk),                // input wire clk
  .probe_in0(result),    // input wire [32 : 0] probe_in0
  .probe_out0(a),  // output wire [31 : 0] probe_out0
  .probe_out1(b)  // output wire [31 : 0] probe_out1
);

endmodule 

module adder32 (
    input  wire [31:0] a,
    input  wire [31:0] b,
    output wire [32:0] result
);

    assign result = {1'b0, a} + {1'b0, b};

endmodule