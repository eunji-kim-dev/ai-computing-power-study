
module hcsr04_driver(
    input  wire clk,          // 100MHz clock
    output reg  trig,         // HC-SR04 TRIG
    input  wire echo         // HC-SR04 ECHO
 );


    reg [15:0] distance; // 측정된 거리 (cm)
    vio_0 u001 (
      .clk(clk),              // input wire clk
      .probe_in0(distance)  // input wire [15 : 0] probe_in0
    );

    // 상태 정의
    localparam IDLE      = 3'd0;
    localparam TRIG_ON   = 3'd1;
    localparam WAIT_ECHO = 3'd2;
    localparam MEASURE   = 3'd3;
    localparam CALC      = 3'd4;

    reg [2:0] state = IDLE;

    reg [31:0] cnt = 0;        // 범용 카운터
    reg [31:0] echo_cnt = 0;   // echo 펄스 길이 카운터

    always @(posedge clk) begin
        case (state)

            // 대기 후 TRIG 펄스 준비
            IDLE: begin
                trig <= 0;
                cnt <= cnt + 1;
                if (cnt >= 100_00000) begin // 100ms 주기
                    cnt <= 0;
                    state <= TRIG_ON;
                end
            end

            // TRIG 10us HIGH
            TRIG_ON: begin
                trig <= 1;
                cnt <= cnt + 1;
                if (cnt >= 1000) begin // 10us = 1000 clocks
                    trig <= 0;
                    cnt <= 0;
                    state <= WAIT_ECHO;
                end
            end

            // ECHO HIGH 기다림
            WAIT_ECHO: begin
                if (echo == 1) begin
                    echo_cnt <= 0;
                    state <= MEASURE;
                end
            end

            // ECHO HIGH 동안 카운트
            MEASURE: begin
                if (echo == 1) begin
                    echo_cnt <= echo_cnt + 1;
                end else begin
                    state <= CALC;
                end
            end

            // 거리 계산
            CALC: begin
                // echo_cnt clocks → echo_cnt * 10ns
                // us 단위 변환: echo_us = echo_cnt / 100
                // distance(cm) = echo_us / 58
                distance <= (echo_cnt / 100) / 58;
                state <= IDLE;
            end

        endcase
    end

endmodule
