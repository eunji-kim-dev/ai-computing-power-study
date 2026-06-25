`timescale 1ns / 1ps

module led_shift_sw(
  input  wire       clk,   // 100MHz
  input  wire       sw,
  output reg [15:0] led
);

wire clk_5Mhz;

assign clk_5Mhz = clk;
// ------------------------------------------------------------
// 1초 = 5,000,000 클럭(5MHz 기준)
// ------------------------------------------------------------
localparam integer SEC_TICKS = 500;
reg [22:0] cnt = 23'd0;      // 0..499

initial begin
  led <= 16'h0001;
end

always @(posedge clk_5Mhz) begin
    if (cnt == SEC_TICKS-1) begin
        cnt <= 23'd0;

        if (sw == 1'b0) begin
            if (led == 16'h8000) led <= 16'h0001;
            else                 led <= (led << 1);
        end else begin
            if (led == 16'h0001) led <= 16'h8000;
            else                 led <= (led >> 1);
        end

    end else begin
        cnt <= cnt + 23'd1;
    end
end

endmodule