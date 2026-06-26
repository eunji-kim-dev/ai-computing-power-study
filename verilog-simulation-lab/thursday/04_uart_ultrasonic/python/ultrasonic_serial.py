import serial
import time

STX = 0x02
ETX = 0x03

def open_serial(port: str, baud: int = 115200) -> serial.Serial:
    return serial.Serial(
        port=port,
        baudrate=baud,
        bytesize=serial.EIGHTBITS,
        parity=serial.PARITY_NONE,
        stopbits=serial.STOPBITS_ONE,
        timeout=0.2
    )

def parse_stream_and_print(ser: serial.Serial):
    buf = []

    while True:
        b = ser.read(1)
        if not b:
            continue
        v = b[0]

        if not buf:
            if v == STX:
                buf = [v]
            continue

        buf.append(v)

        if len(buf) == 6:
            stx, typ, hi, lo, chk, etx = buf
            buf = []

            calc = typ ^ hi ^ lo

            if etx != ETX:
                print("[ERR] ETX mismatch:",
                      "frame =", " ".join(f"0x{x:02X}" for x in [stx, typ, hi, lo, chk, etx]))
                continue

            if chk != calc:
                print("[ERR] CHK mismatch:",
                      f"got 0x{chk:02X}, calc 0x{calc:02X}",
                      "frame =", " ".join(f"0x{x:02X}" for x in [stx, typ, hi, lo, chk, etx]))
                continue

            dist = (hi << 8) | lo
            print(f"[OK] distance = {dist} cm  frame = " +
                  " ".join(f"0x{x:02X}" for x in [stx, typ, hi, lo, chk, etx]))

def main():
    PORT = "COM7"
    BAUD = 115200

    ser = open_serial(PORT, BAUD)
    time.sleep(0.5)
    print(f"Listening on {PORT} @ {BAUD} ... (Ctrl+C to quit)")
    try:
        parse_stream_and_print(ser)
    except KeyboardInterrupt:
        print("\nStopped.")
    finally:
        ser.close()

if __name__ == "__main__":
    main()
