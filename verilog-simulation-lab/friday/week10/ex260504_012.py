import cupy as cp
import numpy as np
import matplotlib.pyplot as plt
 
fs = 20000                      # 샘플링 주파수
N  = 2_000_000                  # 표본 수 (2M → GPU 효과↑)
t  = cp.arange(N, dtype=cp.float32) / fs

# GPU에서 바로 신호 생성 (두 개의 사인 + 노이즈)
sig = (cp.sin(2*cp.pi*440*t) +       # 440Hz 음(라 / tuning A)
       0.6*cp.sin(2*cp.pi*1200*t) +  # 1200Hz 부조파
       0.3*cp.random.standard_normal(N, dtype=cp.float32))  # 잡음

# ----------------------------
# (1) 시간 영역 표시 (일부 구간만 보기)
# ----------------------------
# 너무 길기 때문에 0.02초 구간(= 20ms)만 시각화
duration_show = 0.02  # 20ms
num_samples_show = int(fs * duration_show)

t_np   = cp.asnumpy(t[:num_samples_show])
sig_np = cp.asnumpy(sig[:num_samples_show])

plt.figure(figsize=(10,4))
plt.plot(t_np, sig_np)
plt.xlabel("Time (sec)")
plt.ylabel("Amplitude")
plt.title("Time Domain Signal (First 20 ms)")
plt.grid(True)
plt.tight_layout()
plt.show()

# ----------------------------
# (2) 주파수 영역 (FFT) 표시
# ----------------------------
spec = cp.fft.rfft(sig)
freq = cp.fft.rfftfreq(N, d=1/fs)
mag  = cp.abs(spec) / N

freq_np = cp.asnumpy(freq)
mag_np  = cp.asnumpy(mag)

plt.figure(figsize=(10,4))
plt.plot(freq_np, mag_np)
plt.xlim(0, 3000)    # 3kHz 이하만 확대
plt.xlabel("Frequency (Hz)")
plt.ylabel("Amplitude")
plt.title("FFT Spectrum (CuPy GPU, FP32)")
plt.grid(True)
plt.tight_layout()
plt.show()
