`timescale 1ns / 1ps
`default_nettype none

module vga_colorbar_1080p_basys3 (
    input  wire        clk,        // 100 MHz (Basys3)
    output wire        hsync,
    output wire        vsync,
    output wire [3:0]  vgaRed,
    output wire [3:0]  vgaGreen,
    output wire [3:0]  vgaBlue
);

    wire resetn = 1'b1;

    // --------------------------------------------------------
    // 1) Pixel clock: 148.5 MHz for 1920x1080@60
    //    -> generate using Clocking Wizard (MMCM/PLL)
    // --------------------------------------------------------
    wire pclk;
    wire locked;

    // Create "Clocking Wizard" IP named clk_wiz_0
    // clk_in1  = 100 MHz
    // clk_out1 = 148.5 MHz
    clk_wiz_0 u_clk1080 (
        .clk_in1 (clk),
        .clk_out1(pclk),
        .locked  (locked),
        .reset   (~resetn)
    );

    // 내부 동작 reset (클록 안정화까지 대기)
    wire run = resetn & locked;

    // --------------------------------------------------------
    // 2) VGA/HD timing 1920x1080 (1080p60 standard)
    // --------------------------------------------------------
    localparam integer H_ACTIVE = 1920;
    localparam integer H_FP     = 88;
    localparam integer H_SYNC   = 44;
    localparam integer H_BP     = 148;
    localparam integer H_TOTAL  = H_ACTIVE + H_FP + H_SYNC + H_BP; // 2200

    localparam integer V_ACTIVE = 1080;
    localparam integer V_FP     = 4;
    localparam integer V_SYNC   = 5;
    localparam integer V_BP     = 36;
    localparam integer V_TOTAL  = V_ACTIVE + V_FP + V_SYNC + V_BP; // 1125

    // counter width: H up to 2199 -> 12 bits, V up to 1124 -> 11 bits
    reg [11:0] h_cnt = 12'd0;
    reg [10:0] v_cnt = 11'd0;

    always @(posedge pclk) begin
        if (!run) begin
            h_cnt <= 12'd0;
            v_cnt <= 11'd0;
        end else begin
            if (h_cnt == H_TOTAL-1) begin
                h_cnt <= 12'd0;
                if (v_cnt == V_TOTAL-1) v_cnt <= 11'd0;
                else                    v_cnt <= v_cnt + 11'd1;
            end else begin
                h_cnt <= h_cnt + 12'd1;
            end
        end
    end

    // 1080p sync polarity is positive (+/+)
    assign hsync = ((h_cnt >= (H_ACTIVE + H_FP)) &&
                    (h_cnt <  (H_ACTIVE + H_FP + H_SYNC)));

    assign vsync = ((v_cnt >= (V_ACTIVE + V_FP)) &&
                    (v_cnt <  (V_ACTIVE + V_FP + V_SYNC)));

    wire active_video = (h_cnt < H_ACTIVE) && (v_cnt < V_ACTIVE);
    wire [11:0] x = h_cnt;

    // 8 bars, each 1920/8 = 240 px
    wire [2:0] bar_idx = (x / 12'd240);

    // --------------------------------------------------------
    // 3) Color generation
    // --------------------------------------------------------
    reg [3:0] r, g, b;

    always @(*) begin
        r = 4'h0; g = 4'h0; b = 4'h0;

        if (active_video) begin
            case (bar_idx)
                3'd0: begin r=4'hF; g=4'hF; b=4'hF; end // White
                3'd1: begin r=4'hF; g=4'hF; b=4'h0; end // Yellow
                3'd2: begin r=4'h0; g=4'hF; b=4'hF; end // Cyan
                3'd3: begin r=4'h0; g=4'hF; b=4'h0; end // Green
                3'd4: begin r=4'hF; g=4'h0; b=4'hF; end // Magenta
                3'd5: begin r=4'hF; g=4'h0; b=4'h0; end // Red
                3'd6: begin r=4'h0; g=4'h0; b=4'hF; end // Blue
                3'd7: begin r=4'h0; g=4'h0; b=4'h0; end // Black
                default: begin r=4'h0; g=4'h0; b=4'h0; end
            endcase
        end
    end

    assign vgaRed   = r;
    assign vgaGreen = g;
    assign vgaBlue  = b;

endmodule

`default_nettype wire
