import time, numpy as np, cupy as cp
N = 500_000_000  # 숫자 커질수록 GPU 차이 ↑ (VRAM 여유시 더 키워도 됨)
 
# CPU (NumPy)
t0 = time.perf_counter()
x = np.random.rand(N).astype(np.float32)
y = np.random.rand(N).astype(np.float32)
inside_C = (x*x + y*y) <= 1.0
pi_cpu = 4.0 * np.mean(inside_C)
t1 = time.perf_counter()

# GPU (CuPy) - GPU 메모리에서 바로 난수 생성
t2 = time.perf_counter()
xg = cp.random.rand(N, dtype=cp.float32)
yg = cp.random.rand(N, dtype=cp.float32)
inside_G = (xg*xg + yg*yg) <= 1.0
pi_gpu = 4.0 * cp.mean(inside_G)
cp.cuda.Stream.null.synchronize()
t3 = time.perf_counter()

print(f"[Monte Carlo π] CPU: {pi_cpu:.6f}, time={t1-t0:.3f}s")
print(f"[Monte Carlo π] GPU: {float(pi_gpu):.6f}, time={t3-t2:.3f}s")
