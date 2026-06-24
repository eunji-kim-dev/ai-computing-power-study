`timescale 1ns / 1ps

module logic_sw_led_top (
    input  wire [15:0] sw,
    output wire [15:0] led
);

    wire [3:0] A;
    wire [3:0] B;

    assign A = sw[3:0];
    assign B = sw[7:4];

    // led[3:0] : AND 연산 결과
    assign led[3:0] = A & B;

    // led[7:4] : OR 연산 결과
    assign led[7:4] = A | B;

    // led[11:8] : XOR 연산 결과
    assign led[11:8] = A ^ B;

    // led[15:12] : NOT A 연산 결과
    assign led[15:12] = ~A;

endmodule