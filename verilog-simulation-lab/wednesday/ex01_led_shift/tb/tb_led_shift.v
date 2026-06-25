`timescale 1ns/1ps

module tb_led_shift;

  reg         clk;
  wire [15:0] led;


  led_shift dut (
    .clk(clk),
    .led(led)
  );

  initial begin
    clk = 1'b0;
    #1000000 $stop;
  end
  
  always 
    #20 clk <= ~clk;

endmodule
