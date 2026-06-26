import serial
import time

PORT = "COM7"      # 본인 COM으로 변경
BAUD = 115200
SYNC = b"\xAA\x55"
FRAME_LEN = 6

def main():
    ser = serial.Serial(PORT, BAUD, timeout=0.2)
    time.sleep(0.2)
    ser.reset_input_buffer()

    buf = bytearray()
    t0 = time.time()
    last = t0

    total_bytes = 0
    sync_hits = 0
    frames = 0

    print("Reading... (Ctrl+C to stop)")
    try:
        while True:
            data = ser.read(ser.in_waiting or 1)
            if data:
                total_bytes += len(data)
                buf.extend(data)

            # SYNC/FRAME 파싱
            while True:
                idx = buf.find(SYNC)
                if idx < 0:
                    # 버퍼 과대 방지: AA가 잘릴 수 있으니 1바이트만 유지
                    if len(buf) > 1:
                        del buf[:-1]
                    break

                if idx > 0:
                    del buf[:idx]  # SYNC 이전 제거

                if len(buf) < FRAME_LEN:
                    break

                # 프레임 6바이트 확보됨
                sync_hits += 1
                c0_hi = buf[2]
                c0_lo = buf[3]
                c1_hi = buf[4]
                c1_lo = buf[5]
                ch0 = ((c0_hi & 0x0F) << 8) | c0_lo
                ch1 = ((c1_hi & 0x0F) << 8) | c1_lo
                frames += 1

                # 가끔 값 출력
                if frames % 200 == 0:
                    print(f"Frame#{frames}  CH0={ch0:4d}  CH1={ch1:4d}  (buf={len(buf)} bytes)")

                del buf[:FRAME_LEN]

            now = time.time()
            if now - last >= 1.0:
                dt = now - last
                bps = (total_bytes) / (now - t0)
                print(f"[1s] total={total_bytes} bytes, avg={bps:.1f} B/s, sync_hits={sync_hits}, frames={frames}, buf={len(buf)}")
                last = now

    except KeyboardInterrupt:
        print("\nStopped.")
    finally:
        ser.close()

if __name__ == "__main__":
    main()
