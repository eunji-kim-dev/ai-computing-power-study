import cupy as cp
import numpy as np
import matplotlib.pyplot as plt
 
# ---- 파라미터 ----
W, H = 2000, 1500        # 해상도 (크면 GPU 효과 ↑)
max_iter = 200           # 반복 횟수
x_min, x_max = -2.0, 1.0
y_min, y_max = -1.2, 1.2

# ---- 그리드 생성 (GPU) ----
x = cp.linspace(x_min, x_max, W, dtype=cp.float32)
y = cp.linspace(y_min, y_max, H, dtype=cp.float32)
X, Y = cp.meshgrid(x, y)
C = X + 1j * Y

# ---- 망델브로 반복 (GPU) ----
Z = cp.zeros_like(C, dtype=cp.complex64)  # FP32 복소
iters = cp.zeros((H, W), dtype=cp.int32)

for k in range(max_iter):
    mask = cp.abs(Z) <= 2.0
    Z[mask] = Z[mask] * Z[mask] + C[mask]
    iters[mask] = k

# ---- CPU로 가져와 시각화 ----
img = cp.asnumpy(iters)  # matplotlib은 NumPy 필요
plt.figure(figsize=(9, 6))
plt.imshow(img, cmap="magma", origin="lower",
           extent=[x_min, x_max, y_min, y_max])
plt.colorbar(label="iterations")
plt.title("Mandelbrot (CuPy GPU, FP32)")
plt.xlabel("Re")
plt.ylabel("Im")
plt.tight_layout()
plt.show()
