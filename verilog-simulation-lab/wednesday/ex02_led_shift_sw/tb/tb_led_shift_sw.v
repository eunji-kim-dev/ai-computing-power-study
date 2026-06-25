`timescale 1ns/1ps

module tb_led_shift;

  reg         clk;
  reg         sw;
  wire [15:0] led;


  led_shift_sw dut (
    .clk(clk),
	.sw(sw),
    .led(led)
  );

  initial begin
    clk = 1'b0;
	sw = 1'b0;
    #1000000
	sw = 1'b1;
	#1000000 $stop;
  end
  
  always 
    #20 clk <= ~clk;

endmodule
