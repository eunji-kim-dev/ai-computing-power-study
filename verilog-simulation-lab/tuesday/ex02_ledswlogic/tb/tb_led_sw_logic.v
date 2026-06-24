`timescale 1ns / 1ps

module tb_logic_sw_led_top;

    reg  [15:0] sw;
    wire [15:0] led;

    logic_sw_led_top uut (
        .sw(sw),
        .led(led)
    );

    initial begin
        // 초기값
        sw = 16'b0000_0000_0000_0000;
        #10;

        // A = 0000, B = 0000
        // AND = 0000, OR = 0000, XOR = 0000, NOT A = 1111
        sw = 16'b0000_0000_0000_0000;
        #10;

        // A = 1111, B = 0000
        // AND = 0000, OR = 1111, XOR = 1111, NOT A = 0000
        sw = 16'b0000_0000_0000_1111;
        #10;

        // A = 0000, B = 1111
        // AND = 0000, OR = 1111, XOR = 1111, NOT A = 1111
        sw = 16'b0000_0000_1111_0000;
        #10;

        // A = 1010, B = 1100
        // AND = 1000, OR = 1110, XOR = 0110, NOT A = 0101
        sw = 16'b0000_0000_1100_1010;
        #10;

        // A = 0101, B = 0011
        // AND = 0001, OR = 0111, XOR = 0110, NOT A = 1010
        sw = 16'b0000_0000_0011_0101;
        #10;

        // A = 1111, B = 1111
        // AND = 1111, OR = 1111, XOR = 0000, NOT A = 0000
        sw = 16'b0000_0000_1111_1111;
        #10;

        $stop;
    end

endmodule