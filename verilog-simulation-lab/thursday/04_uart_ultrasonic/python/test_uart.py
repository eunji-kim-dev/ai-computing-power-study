import serial, time

PORT = "COM7"
BAUD = 115200

ser = serial.Serial(PORT, BAUD, timeout=0.2)
time.sleep(0.3)

print("RAW HEX dump (no decoding)")
try:
    while True:
        data = ser.read(64)
        if data:
            print(" ".join(f"{b:02X}" for b in data))
except KeyboardInterrupt:
    pass
finally:
    ser.close()
