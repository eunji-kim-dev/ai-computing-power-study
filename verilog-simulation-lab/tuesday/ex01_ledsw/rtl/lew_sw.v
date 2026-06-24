

module led_sw_top(
	input wire [15:0] sw,
	output wire [15:0] led
);
// 스위치 값을 led에 그대로 출력
assign led = sw;

endmodule