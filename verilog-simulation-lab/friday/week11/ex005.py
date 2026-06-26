import time
import numpy as np
from numba import njit, prange, cuda

# =====================
# 0) Numba CPU 병렬 버전
# =====================
def mc_pi_cpu(N):
    count = 0
    for i in prange(N):
        x = np.random.rand()
        y = np.random.rand()
        if x*x + y*y <= 1.0:
            count += 1
    return 4.0 * count / N


# =====================
# 1) Numba CPU 병렬 버전
# =====================
@njit(parallel=True)
def mc_pi_numba_cpu(N):
    count = 0
    for i in prange(N):
        x = np.random.rand()
        y = np.random.rand()
        if x*x + y*y <= 1.0:
            count += 1
    return 4.0 * count / N

# =====================
# 2) Numba CUDA 버전
# =====================
@cuda.jit
def mc_pi_kernel(xs, ys, counts):
    i = cuda.grid(1)
    if i < xs.size:
        x = xs[i]
        y = ys[i]
        if x*x + y*y <= 1.0:
            counts[i] = 1
        else:
            counts[i] = 0

def mc_pi_numba_cuda(N):
    # 호스트에서 난수 생성
    xs = np.random.rand(N).astype(np.float32)
    ys = np.random.rand(N).astype(np.float32)

    # 디바이스로 전송
    d_xs = cuda.to_device(xs)
    d_ys = cuda.to_device(ys)
    d_counts = cuda.device_array(N, dtype=np.int32)

    threads_per_block = 256
    blocks_per_grid = (N + threads_per_block - 1) // threads_per_block

    # 커널 실행
    mc_pi_kernel[blocks_per_grid, threads_per_block](d_xs, d_ys, d_counts)

    # 결과 회수 및 π 추정
    counts = d_counts.copy_to_host()
    inside = counts.sum()
    return 4.0 * inside / N


N = 100_000_000  # 필요시 10^7 이상으로 확장

# --- CPU  ---
t0 = time.time()
pi_cpu = mc_pi_cpu(N)
t1 = time.time()
print(f"CPU π = {pi_cpu:.6f}, time = {t1 - t0:.4f} s")


# --- CPU 병렬 ---
t0 = time.time()
pi_cpu = mc_pi_numba_cpu(N)
t1 = time.time()
print(f"Numba CPU parallel π = {pi_cpu:.6f}, time = {t1 - t0:.4f} s")

# --- CUDA ---
t0 = time.time()
pi_gpu = mc_pi_numba_cuda(N)
t1 = time.time()
print(f"Numba CUDA π         = {pi_gpu:.6f}, time = {t1 - t0:.4f} s")
