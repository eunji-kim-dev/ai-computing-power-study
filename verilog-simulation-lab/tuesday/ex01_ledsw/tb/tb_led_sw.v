`timescale 1ns/1ps; // 시뮬레이션 시간 단위를 정함, 기본 시간 단위/시간 정밀도

module tb_led_sw_top;

reg [15:0] test_sw;
wire [15:0] test_led;

led_sw_top uut(
	.sw(test_sw),
	.led(test_led)
);

initial begin
	test_sw = 16'b0000_0000_0000_0000;
	#10; //10ns 기다려라
	
	test_sw = 16'b0001_0001_0001_0001;
	#10; //10ns 기다려라
	
	test_sw = 16'b0101_0101_0101_0101;
	#10; //10ns 기다려라
	
	test_sw = 16'haaaa;
	#10; //10ns 기다려라
	$stop;
end

endmodule