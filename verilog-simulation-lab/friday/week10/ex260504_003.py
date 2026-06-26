import os, time
import numpy as np
import cupy as cp
 
N = 6000                # VRAM/메모리에 맞춰 조절 (float32 권장)
dtype = np.float32      # ★ GPU 유리: float32
repeats = 3

# ----- CPU 준비 -----
a_np = np.random.rand(N, N).astype(dtype)
# 워밍업
_ = a_np @ a_np

# ----- GPU 준비 -----
a_cp = cp.random.random((N, N), dtype=dtype)
# 워밍업 (컨텍스트/핸들 초기화)
_ = a_cp @ a_cp
cp.cuda.Stream.null.synchronize()  #GPU의 기본 스트림 작업이 끝날때까지 대기

# ----- 측정 함수 -----
def bench_cpu(A, reps=3):
    times = []
    for _ in range(reps):
        t0 = time.time()
        B = A @ A
        t1 = time.time()
        times.append(t1 - t0)
    return np.mean(times), B

def bench_gpu(A, reps=3):
    times = []
    B = None
    for _ in range(reps):
        cp.cuda.Stream.null.synchronize()
        t0 = time.time()
        B = A @ A
        cp.cuda.Stream.null.synchronize()
        t1 = time.time()
        times.append(t1 - t0)
    return float(np.mean(times)), B

cpu_time, _ = bench_cpu(a_np, repeats)
gpu_time, _ = bench_gpu(a_cp, repeats)

print(f"CPU (dtype={dtype}, N={N}) 평균: {cpu_time:.3f}s")
print(f"GPU (dtype={dtype}, N={N}) 평균: {gpu_time:.3f}s")
