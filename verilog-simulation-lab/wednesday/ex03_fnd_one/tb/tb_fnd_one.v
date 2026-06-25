`timescale 1ns/1ps

module tb_fnd_one;

  reg        clk;
  wire [6:0] seg;
  wire [3:0] an;  


fnd_one dut (
    .clk(clk),
	.seg(seg),
    .an(an)
  );

  initial begin
    clk = 1'b0;
	#1000000 $stop;
  end
  
  always 
    #20 clk <= ~clk;

endmodule
