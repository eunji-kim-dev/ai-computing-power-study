`timescale 1ns / 1ps

// 1비트 Full Adder
module full_adder (
    input  wire a,
    input  wire b,
    input  wire cin,
    output wire sum,
    output wire cout
);

    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);

endmodule


// 4비트 Ripple Carry Adder
module ripple_carry_adder_4bit (
    input  wire [3:0] A,
    input  wire [3:0] B,
    input  wire       Cin,
    output wire [3:0] Sum,
    output wire       Cout
);

    wire c1, c2, c3;

    full_adder FA0 (
        .a(A[0]),
        .b(B[0]),
        .cin(Cin),
        .sum(Sum[0]),
        .cout(c1)
    );

    full_adder FA1 (
        .a(A[1]),
        .b(B[1]),
        .cin(c1),
        .sum(Sum[1]),
        .cout(c2)
    );

    full_adder FA2 (
        .a(A[2]),
        .b(B[2]),
        .cin(c2),
        .sum(Sum[2]),
        .cout(c3)
    );

    full_adder FA3 (
        .a(A[3]),
        .b(B[3]),
        .cin(c3),
        .sum(Sum[3]),
        .cout(Cout)
    );

endmodule


// Top Module
module rca_top (
    input  wire [15:0] sw,
    output wire [15:0] led
);

    wire [3:0] A;
    wire [3:0] B;
    wire       Cin;
    wire [3:0] Sum;
    wire       Cout;

    assign A   = sw[3:0];
    assign B   = sw[7:4];
    assign Cin = sw[8];

    ripple_carry_adder_4bit RCA (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    assign led[3:0] = Sum;
    assign led[4]   = Cout;

    // 사용하지 않는 LED는 꺼둠
    assign led[15:5] = 11'b000_0000_0000;

endmodule