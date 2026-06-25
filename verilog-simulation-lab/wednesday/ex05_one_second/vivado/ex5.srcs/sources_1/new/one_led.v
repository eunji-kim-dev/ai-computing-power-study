module one_led(
    input  wire clk,          // 100MHz 입력
    output reg [15:0] led = 16'h0001
);

    wire clk_5mhz;

    // 5MHz에서 500ms = 2,500,000 카운트
    localparam COUNT_MAX = 2_500_000;

    reg [22:0] counter = 0;  // 2,500,000 < 2^23

    always @(posedge clk_5mhz) begin
        if (counter == COUNT_MAX - 1) begin
            counter <= 0;

            // LED 이동: 0001 → 0002 → ... → 8000 → 다시 0001
            if (led == 16'h8000)
                led <= 16'h0001;
            else
                led <= led << 1;

        end else begin
            counter <= counter + 1;
        end
    end

    // Clock Wizard 인스턴스
    clk_wiz_0 ut1 (
        .clk_out1(clk_5mhz),  // 5MHz 출력
        .clk_in1(clk)         // 100MHz 입력
    );

endmodule
