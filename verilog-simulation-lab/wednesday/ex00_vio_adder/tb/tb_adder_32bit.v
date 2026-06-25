`timescale 1ns / 1ps

module tb_adder32;

    reg  [31:0] a;
    reg  [31:0] b;
    wire [32:0] result;

    adder32 uut (
        .a(a),
        .b(b),
        .result(result)
    );

    initial begin
        // 초기값
        a = 32'd0;
        b = 32'd0;
        #10;

        // 0 + 0 = 0
        a = 32'd0;
        b = 32'd0;
        #10;

        // 10 + 20 = 30
        a = 32'd10;
        b = 32'd20;
        #10;

        // 1000 + 2000 = 3000
        a = 32'd1000;
        b = 32'd2000;
        #10;

        // 최대값 + 1
        // 32'hFFFF_FFFF + 1 = 33'h1_0000_0000
        a = 32'hFFFF_FFFF;
        b = 32'd1;
        #10;

        // 최대값 + 최대값
        // 32'hFFFF_FFFF + 32'hFFFF_FFFF = 33'h1_FFFF_FFFE
        a = 32'hFFFF_FFFF;
        b = 32'hFFFF_FFFF;
        #10;

        // 임의의 값
        a = 32'h1234_5678;
        b = 32'h1111_1111;
        #10;

        $stop;
    end

endmodule