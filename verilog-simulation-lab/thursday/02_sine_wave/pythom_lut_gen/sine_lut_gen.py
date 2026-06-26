import math

N = 256          # LUT points
MAX_CODE = 4095  # 12-bit DAC full scale
MID = MAX_CODE / 2.0

def clamp(x, lo, hi):
    return max(lo, min(hi, x))

mem_lines = []
vals = []

for i in range(N):
    # sine in [-1, +1]
    s = math.sin(2.0 * math.pi * i / N)

    # map to [0, 4095] with rounding
    code = int(round((s + 1.0) * MID))
    code = clamp(code, 0, MAX_CODE)

    vals.append(code)
    mem_lines.append(f"{code:04X}")

# 1) Write MEM (one hex word per line)
with open("sine256.mem", "w", encoding="utf-8") as f:
    f.write("\n".join(mem_lines) + "\n")

print("Generated sine256.mem (256 lines)")

# 2) (Optional) Write COE for Vivado Block Memory Generator
#    16-bit words; if you want pure 12-bit data packed into [11:0], just keep it as 4-hex digits.
with open("sine256.coe", "w", encoding="utf-8") as f:
    f.write("memory_initialization_radix=16;\n")
    f.write("memory_initialization_vector=\n")
    f.write(",\n".join(mem_lines))
    f.write(";\n")

print("Generated sine256.coe")

# Sanity check
print("min =", min(vals), "max =", max(vals), "count =", len(vals))
