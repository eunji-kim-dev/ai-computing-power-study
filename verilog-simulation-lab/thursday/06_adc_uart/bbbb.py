import serial
import time
from collections import deque

import matplotlib.pyplot as plt
import matplotlib.animation as animation


# ==========================
# 사용자 설정
# ==========================
PORT = "COM7"          # 예: Windows "COM5", Linux "/dev/ttyUSB0"
BAUD = 115200          # Verilog와 동일해야 함
SAMPLE_HZ = 1000       # Verilog의 SAMPLE_HZ와 동일(프레임/초)
VREF = 3.3             # AD1 기준전압(보통 3.3V)

WINDOW_SEC = 2.0       # 표시할 시간(초)
PLOT_INTERVAL_MS = 30  # 그래프 갱신 주기


# ==========================
# 프로토콜 설정 (FPGA 프레임)
# 프레임(6 bytes): AA 55 c0_hi c0_lo c1_hi c1_lo
# ==========================
SYNC = bytes([0xAA, 0x55])
FRAME_LEN = 6


class FrameParser:
    """
    UART 바이트 스트림에서 프레임을 안정적으로 추출하기 위한 파서.
    - 내부에 bytearray 버퍼를 유지
    - SYNC(0xAA 0x55)를 찾아 프레임(6바이트)을 추출
    """
    def __init__(self):
        self.buf = bytearray()

    def push(self, data: bytes):
        if data:
            self.buf.extend(data)

    def pop_frames(self, max_frames: int = 300):
        frames = []
        b = self.buf

        while len(frames) < max_frames:
            # 동기 패턴 찾기
            idx = b.find(SYNC)
            if idx < 0:
                # SYNC가 없으면 버퍼가 너무 커지지 않게 마지막 1바이트만 남김(AA가 잘릴 수 있으니)
                if len(b) > 1:
                    del b[:-1]
                break

            # SYNC 이전 쓰레기 제거
            if idx > 0:
                del b[:idx]

            # 이제 버퍼 시작이 SYNC
            if len(b) < FRAME_LEN:
                break

            # 프레임 추출
            # b[0:2] = SYNC, b[2:6] = payload
            c0_hi = b[2]
            c0_lo = b[3]
            c1_hi = b[4]
            c1_lo = b[5]

            ch0 = ((c0_hi & 0x0F) << 8) | c0_lo
            ch1 = ((c1_hi & 0x0F) << 8) | c1_lo

            frames.append((ch0, ch1))

            # 사용한 프레임 제거
            del b[:FRAME_LEN]

        return frames


def adc_to_voltage(code12: int, vref: float) -> float:
    # 12-bit unsigned [0..4095]
    return (code12 / 4095.0) * vref


def main():
    # -------- Serial open --------
    ser = serial.Serial(PORT, BAUD, timeout=0.0)  # non-blocking
    time.sleep(0.2)
    ser.reset_input_buffer()

    parser = FrameParser()

    # -------- Plot buffer --------
    N = int(SAMPLE_HZ * WINDOW_SEC)
    if N < 100:
        N = 100

    buf0 = deque([0.0] * N, maxlen=N)
    buf1 = deque([0.0] * N, maxlen=N)
    x = list(range(N))

    # -------- Matplotlib setup --------
    fig, ax = plt.subplots()
    ax.set_title("Pmod AD1 Realtime Plot (CH0/CH1) - UART 115200")
    ax.set_xlabel("samples (latest on right)")
    ax.set_ylabel("Voltage (V)")
    ax.set_ylim(0, VREF)
    ax.grid(True)

    line0, = ax.plot(x, list(buf0), label="CH0")
    line1, = ax.plot(x, list(buf1), label="CH1")
    ax.legend(loc="upper right")

    # 간단한 상태 표시 텍스트(수신 프레임율 확인용)
    text = ax.text(0.02, 0.95, "", transform=ax.transAxes, va="top")

    last_t = time.time()
    frame_counter = 0

    def update(_):
        nonlocal last_t, frame_counter

        # 가능한 만큼 한 번에 읽기
        n = ser.in_waiting
        data = ser.read(n if n > 0 else 1)

        parser.push(data)

        # 여러 프레임을 한 번에 꺼내서 버퍼에 반영
        frames = parser.pop_frames(max_frames=600)
        for ch0, ch1 in frames:
            buf0.append(adc_to_voltage(ch0, VREF))
            buf1.append(adc_to_voltage(ch1, VREF))

        # 라인 업데이트
        y0 = list(buf0)
        y1 = list(buf1)
        line0.set_ydata(y0)
        line1.set_ydata(y1)

        # 프레임율 표시
        frame_counter += len(frames)
        now = time.time()
        dt = now - last_t
        if dt >= 0.5:
            fps = frame_counter / dt
            text.set_text(f"RX: {fps:6.1f} frames/s   buffer: {len(parser.buf)} bytes")
            last_t = now
            frame_counter = 0

        return (line0, line1, text)

    # 경고 제거: cache_frame_data=False (실시간 스트리밍에 권장)
    ani = animation.FuncAnimation(
        fig,
        update,
        interval=PLOT_INTERVAL_MS,
        blit=False,               # 환경에 따라 True도 가능. 문제 있으면 False 권장
        cache_frame_data=False
    )

    try:
        plt.show()
    finally:
        ser.close()


if __name__ == "__main__":
    main()
