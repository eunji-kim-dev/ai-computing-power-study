import serial
import time
from collections import deque

import matplotlib.pyplot as plt
import matplotlib.animation as animation


# ==========================
# 사용자 설정
# ==========================
PORT = "COM7"
BAUD = 115200
VREF = 3.3              # AD1 기준전압(보통 3.3V)
ADC_BITS = 12           # AD1은 12-bit
WINDOW_SEC = 2.0
PLOT_INTERVAL_MS = 30

SYNC = 0xAA
FRAME_LEN = 3           # [AA][LSB][MSB] 가정


class AAU16Parser:
    """
    바이트 스트림에서 [0xAA][LSB][MSB] 프레임을 추출.
    """
    def __init__(self):
        self.buf = bytearray()

    def push(self, data: bytes):
        if data:
            self.buf.extend(data)

    def pop_values(self, max_frames: int = 600):
        vals = []
        b = self.buf

        while len(vals) < max_frames:
            idx = b.find(bytes([SYNC]))
            if idx < 0:
                # SYNC 없으면 버퍼 너무 커지지 않게 정리
                b.clear()
                break

            if idx > 0:
                del b[:idx]

            if len(b) < FRAME_LEN:
                break

            # b[0] == 0xAA
            lsb = b[1]
            msb = b[2]
            value16 = (msb << 8) | lsb

            # AD1이면 보통 상위 4비트가 0이고 하위 12비트가 유효
            code12 = value16 & 0x0FFF

            vals.append(code12)
            del b[:FRAME_LEN]

        return vals


def code_to_voltage(code12: int, vref: float) -> float:
    return (code12 / ((1 << ADC_BITS) - 1)) * vref


def main():
    ser = serial.Serial(PORT, BAUD, timeout=0.0)  # non-blocking
    time.sleep(0.2)
    ser.reset_input_buffer()

    parser = AAU16Parser()

    # 표시 버퍼
    # 샘플레이트를 정확히 모르므로 적당히 4000포인트 정도로 고정(2초 분량 느낌)
    N = 4000
    buf = deque([0.0] * N, maxlen=N)
    x = list(range(N))

    fig, ax = plt.subplots()
    ax.set_title("Realtime Plot (Format: AA + U16) @115200")
    ax.set_xlabel("samples (latest on right)")
    ax.set_ylabel("Voltage (V)")
    ax.set_ylim(0, VREF)
    ax.grid(True)

    line, = ax.plot(x, list(buf), label="CH?")
    ax.legend(loc="upper right")
    text = ax.text(0.02, 0.95, "", transform=ax.transAxes, va="top")

    last_t = time.time()
    sample_counter = 0

    def update(_):
        nonlocal last_t, sample_counter

        data = ser.read(ser.in_waiting or 1)
        parser.push(data)

        codes = parser.pop_values(max_frames=1200)
        for c in codes:
            buf.append(code_to_voltage(c, VREF))

        line.set_ydata(list(buf))

        sample_counter += len(codes)
        now = time.time()
        dt = now - last_t
        if dt >= 0.5:
            rate = sample_counter / dt
            text.set_text(f"RX: {rate:6.1f} samples/s   parser_buf: {len(parser.buf)} bytes")
            last_t = now
            sample_counter = 0

        return (line, text)

    ani = animation.FuncAnimation(
        fig,
        update,
        interval=PLOT_INTERVAL_MS,
        blit=False,
        cache_frame_data=False
    )

    try:
        plt.show()
    finally:
        ser.close()


if __name__ == "__main__":
    main()
