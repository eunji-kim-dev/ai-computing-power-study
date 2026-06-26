import numpy as np
import cupy as cp
import time
 
N = 1_000_000_000   # 10억명 데이터 (큰 데이터일수록 GPU가 유리)

# ---------------------------
# CPU (NumPy)
# ---------------------------
start = time.time()
data_cpu = np.random.rand(N).astype(np.float32)   # 행복 지수 0~1
mean_cpu = data_cpu.mean()
end = time.time()
cpu_time = end - start

print(f"CPU 평균값: {mean_cpu:.6f}, 시간: {cpu_time:.4f}초")

# ---------------------------
# GPU (CuPy)
# ---------------------------
start = time.time()
data_gpu = cp.random.rand(N, dtype=cp.float32)   # GPU 메모리에서 바로 생성
cp.cuda.Stream.null.synchronize()
mean_gpu = data_gpu.mean()
cp.cuda.Stream.null.synchronize()
end = time.time()
gpu_time = end - start

print(f"GPU 평균값: {float(mean_gpu):.6f}, 시간: {gpu_time:.4f}초")
