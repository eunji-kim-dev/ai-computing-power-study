`timescale 1ns / 1ps
`default_nettype none

module ex06_adc_uart #(
    parameter integer CLK_HZ     = 100_000_000,
    parameter integer BAUD        = 115_200,
    parameter integer SAMPLE_HZ   = 1_000,
    parameter integer SCK_HZ      = 10_000_000
)(
    input  wire clk,          // Basys3 100MHz

    // Basys3 USB-UART
    output wire tx,           // to A18 (RsTx)

    // Pmod AD1 on JA (윗줄 JA1~JA4 사용)
    output wire ad_cs,
    output wire ad_sck,
    input  wire ad_d0,
    input  wire ad_d1,

    output wire [15:0] led
);

    // ------------------------------------------------------------
    // 1) 샘플 트리거 (SAMPLE_HZ)
    // ------------------------------------------------------------
    localparam integer SAMPLE_DIV = (CLK_HZ / SAMPLE_HZ);
    reg [$clog2(SAMPLE_DIV):0] sample_cnt = 0;
    reg sample_tick = 1'b0;

    always @(posedge clk) begin
        sample_tick <= 1'b0;
        if (sample_cnt == SAMPLE_DIV-1) begin
            sample_cnt  <= 0;
            sample_tick <= 1'b1;
        end else begin
            sample_cnt <= sample_cnt + 1;
        end
    end

    // ------------------------------------------------------------
    // 2) Pmod AD1 SPI reader
    // ------------------------------------------------------------
    wire        ad_valid;
    wire [11:0] ch0;
    wire [11:0] ch1;
    wire        ad_busy;

    pmod_ad1_reader #(
        .CLK_HZ(CLK_HZ),
        .SCK_HZ(SCK_HZ)
    ) u_ad1 (
        .clk(clk),
        .start(sample_tick && !ad_busy),
        .cs(ad_cs),
        .sck(ad_sck),
        .d0(ad_d0),
        .d1(ad_d1),
        .valid(ad_valid),
        .ch0(ch0),
        .ch1(ch1),
        .busy(ad_busy)
    );

    // ------------------------------------------------------------
    // 3) UART: 6B frame = AA 55 0H 0L 1H 1L
    // ------------------------------------------------------------
    reg [2:0]  tx_state = 0;
    reg        tx_start = 1'b0;
    wire       tx_busy;

    reg [11:0] ch0_r = 12'd0, ch1_r = 12'd0;

    wire [7:0] tx_byte =
        (tx_state == 3'd1) ? 8'hAA :
        (tx_state == 3'd2) ? 8'h55 :
        (tx_state == 3'd3) ? {4'b0000, ch0_r[11:8]} :
        (tx_state == 3'd4) ? ch0_r[7:0] :
        (tx_state == 3'd5) ? {4'b0000, ch1_r[11:8]} :
        (tx_state == 3'd6) ? ch1_r[7:0] :
                             8'h00;

    uart_tx_dds #(
        .CLK_HZ(CLK_HZ),
        .BAUD(BAUD)
    ) u_uart (
        .clk(clk),
        .tx_start(tx_start),
        .tx_data(tx_byte),
        .tx(tx),
        .tx_busy(tx_busy)
    );

    always @(posedge clk) begin
        tx_start <= 1'b0;

        if (ad_valid) begin
            ch0_r <= ch0;
            ch1_r <= ch1;

            if (tx_state == 0 && !tx_busy) begin
                tx_state <= 1;
            end
        end

        if (!tx_busy && (tx_state != 0)) begin
            tx_start <= 1'b1;

            if (tx_state == 3'd6) begin
                tx_state <= 0;
            end else begin
                tx_state <= tx_state + 1;
            end
        end
    end

    // ------------------------------------------------------------
    // 4) 디버그 LED
    // ------------------------------------------------------------
    assign led[0] = ad_busy;
    assign led[1] = ad_valid;
    assign led[2] = tx_busy;
    assign led[15:3] = 13'd0;

endmodule


// ============================================================
// Pmod AD1 reader (AD7476A): 16 SCK cycles, D0/D1 in parallel
// - sample on SCK rising edge (ADC updates on falling edge)
// - output 12-bit data (lower 12 bits of 16-bit word)
// ============================================================
module pmod_ad1_reader #(
    parameter integer CLK_HZ = 100_000_000,
    parameter integer SCK_HZ = 10_000_000
)(
    input  wire clk,
    input  wire start,

    output reg  cs  = 1'b1,
    output reg  sck = 1'b0,
    input  wire d0,
    input  wire d1,

    output reg        valid = 1'b0,
    output reg [11:0] ch0   = 12'd0,
    output reg [11:0] ch1   = 12'd0,
    output reg        busy  = 1'b0
);

    localparam integer HALF_DIV = (CLK_HZ / (2*SCK_HZ));
    reg [$clog2(HALF_DIV):0] div_cnt = 0;

    reg [4:0]  bit_cnt = 0;     // 0..15
    reg [15:0] sh0 = 16'd0;
    reg [15:0] sh1 = 16'd0;

    reg running = 1'b0;

    // Vivado 호환: 표현식 슬라이스 대신 next wire 사용
    wire [15:0] sh0_next = {sh0[14:0], d0};
    wire [15:0] sh1_next = {sh1[14:0], d1};

    always @(posedge clk) begin
        valid <= 1'b0;

        if (!running) begin
            sck     <= 1'b0;
            cs      <= 1'b1;
            busy    <= 1'b0;
            div_cnt <= 0;
            bit_cnt <= 0;

            if (start) begin
                cs      <= 1'b0;
                sck     <= 1'b0;
                sh0     <= 16'd0;
                sh1     <= 16'd0;
                running <= 1'b1;
                busy    <= 1'b1;
                div_cnt <= 0;
                bit_cnt <= 0;
            end
        end else begin
            if (div_cnt == HALF_DIV-1) begin
                div_cnt <= 0;
                sck <= ~sck;

                // sample on rising edge (0->1)
                if (sck == 1'b0) begin
                    // 16번째 비트에서 next를 반영한 값을 캡처
                    if (bit_cnt == 5'd15) begin
                        sh0 <= sh0_next;
                        sh1 <= sh1_next;

                        ch0 <= sh0_next[11:0];
                        ch1 <= sh1_next[11:0];

                        cs      <= 1'b1;
                        sck     <= 1'b0;
                        running <= 1'b0;
                        valid   <= 1'b1;
                        busy    <= 1'b0;
                        bit_cnt <= 0;
                    end else begin
                        sh0 <= sh0_next;
                        sh1 <= sh1_next;
                        bit_cnt <= bit_cnt + 1;
                    end
                end
            end else begin
                div_cnt <= div_cnt + 1;
            end
        end
    end

endmodule


// ============================================================
// UART TX (DDS baud tick) 8N1
// ============================================================
module uart_tx_dds #(
    parameter integer CLK_HZ = 100_000_000,
    parameter integer BAUD   = 115_200
)(
    input  wire clk,
    input  wire tx_start,
    input  wire [7:0] tx_data,
    output reg  tx = 1'b1,
    output reg  tx_busy = 1'b0
);

    reg [47:0] acc = 0;
    reg baud_tick = 1'b0;

    always @(posedge clk) begin
        baud_tick <= 1'b0;
        acc <= acc + BAUD;
        if (acc >= CLK_HZ) begin
            acc <= acc - CLK_HZ;
            baud_tick <= 1'b1;
        end
    end

    reg [9:0] shifter = 10'b1111111111;
    reg [3:0] bit_cnt = 0;

    always @(posedge clk) begin
        if (!tx_busy) begin
            tx <= 1'b1;
            if (tx_start) begin
                shifter <= {1'b1, tx_data, 1'b0};
                bit_cnt <= 0;
                tx_busy <= 1'b1;
            end
        end else begin
            if (baud_tick) begin
                tx <= shifter[0];
                shifter <= {1'b1, shifter[9:1]};
                bit_cnt <= bit_cnt + 1;

                if (bit_cnt == 4'd9) begin
                    tx_busy <= 1'b0;
                end
            end
        end
    end

endmodule

`default_nettype wire
