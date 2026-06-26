`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/01/04 20:12:18
// Design Name: 
// Module Name: 05_vga_pic
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps
`default_nettype none

module vga_image_1080p_basys3 (
    input  wire        clk,        // 100 MHz
    output wire        hsync,
    output wire        vsync,
    output wire [3:0]  vgaRed,
    output wire [3:0]  vgaGreen,
    output wire [3:0]  vgaBlue
);

    wire resetn = 1'b1;

    // =========================================================
    // 1) Pixel clock: 148.5 MHz for 1920x1080@60
    //    -> Clocking Wizard IP required (clk_wiz_0)
    // =========================================================
    wire pclk;
    wire locked;

    // Clocking Wizard 설정:
    //  - clk_in1  = 100 MHz
    //  - clk_out1 = 148.5 MHz
    clk_wiz_0 u_clk1080 (
        .clk_in1 (clk),
        .clk_out1(pclk),
        .reset   (~resetn),
        .locked  (locked)
    );

    wire run = resetn & locked;

    // =========================================================
    // 2) 1080p timing (CEA-861 / 60Hz)
    //    H: 1920 + 88 + 44 + 148 = 2200
    //    V: 1080 + 4  + 5  + 36  = 1125
    //    Sync polarity: +/+
    // =========================================================
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

    reg [11:0] h_cnt = 12'd0; // 0..2199
    reg [10:0] v_cnt = 11'd0; // 0..1124

    // =========================================================
    // 3) BRAM 이미지(480x270, RGB444) -> 1080p로 4배 확대
    //    x_small = x / 4, y_small = y / 4  (정확히 4배 스케일)
    //    addr = y_small*480 + x_small
    //         = y_small*(512-32) + x_small
    //         = (y_small<<9) - (y_small<<5) + x_small
    // =========================================================
    localparam integer IMG_W = 480;
    localparam integer IMG_H = 270;
    localparam integer IMG_DEPTH = IMG_W * IMG_H; // 129600

    reg  [16:0] bram_addr = 17'd0;   // 2^17=131072 >= 129600
    wire [11:0] bram_dout;

    // Block Memory Generator IP (ROM)
    // - Data width  = 12
    // - Depth       = 129600
    // - Init file   = zakynthos_480x270_rgb444.coe
    blk_mem_gen_0 u_imgrom (
        .clka (pclk),
        .addra(bram_addr),
        .douta(bram_dout)
    );

    // BRAM read와 sync/active 정렬을 위해 1클록 지연
    reg hsync_d = 1'b0;
    reg vsync_d = 1'b0;
    reg active_d = 1'b0;

    // "현재 카운터(이 클록 사이클에 해당)"의 sync/active
    wire hsync_now = ((h_cnt >= (H_ACTIVE + H_FP)) &&
                      (h_cnt <  (H_ACTIVE + H_FP + H_SYNC)));

    wire vsync_now = ((v_cnt >= (V_ACTIVE + V_FP)) &&
                      (v_cnt <  (V_ACTIVE + V_FP + V_SYNC)));

    wire active_now = (h_cnt < H_ACTIVE) && (v_cnt < V_ACTIVE);

    // /4 스케일 (정확히 4배 확대이므로 비트 쉬프트)
    wire [9:0]  x_small = h_cnt[11:2]; // 0..479 (active일 때)
    wire [8:0]  y_small = v_cnt[10:2]; // 0..269 (active일 때)

    // y*480 = (y<<9) - (y<<5)
    wire [16:0] addr_calc = (({8'd0,y_small} << 9) - ({8'd0,y_small} << 5)) + x_small;

    always @(posedge pclk) begin
        if (!run) begin
            h_cnt    <= 12'd0;
            v_cnt    <= 11'd0;
            bram_addr<= 17'd0;
            hsync_d  <= 1'b0;
            vsync_d  <= 1'b0;
            active_d <= 1'b0;
        end else begin
            // 1) sync/active를 1클록 지연 (BRAM 출력과 정렬)
            hsync_d  <= hsync_now;
            vsync_d  <= vsync_now;
            active_d <= active_now;

            // 2) BRAM 주소도 "현재 픽셀" 기준으로 래치
            if (active_now) begin
                // 안전: active 영역에서만 유효 주소
                bram_addr <= addr_calc; // 0..129599
            end else begin
                bram_addr <= 17'd0;
            end

            // 3) 카운터 업데이트
            if (h_cnt == H_TOTAL-1) begin
                h_cnt <= 12'd0;
                if (v_cnt == V_TOTAL-1) v_cnt <= 11'd0;
                else                    v_cnt <= v_cnt + 11'd1;
            end else begin
                h_cnt <= h_cnt + 12'd1;
            end
        end
    end

    // =========================================================
    // 4) RGB 출력 (RGB444)
    // =========================================================
    assign hsync = hsync_d;
    assign vsync = vsync_d;

    assign vgaRed   = active_d ? bram_dout[11:8] : 4'h0;
    assign vgaGreen = active_d ? bram_dout[7:4]  : 4'h0;
    assign vgaBlue  = active_d ? bram_dout[3:0]  : 4'h0;

endmodule

`default_nettype wire
