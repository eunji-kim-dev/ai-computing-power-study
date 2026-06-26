import time
import numpy as np
from numba import njit, prange

N = 50_000_000
xs = np.random.rand(N).astype(np.float64)

@njit
def sum_serial(a):
    s = 0.0
    for i in range(a.size):
        s += a[i]
    return s

@njit(parallel=True)   #openmp cpu 병렬처리
def sum_parallel(a):
    s = 0.0
    # prange: 병렬 for (OpenMP 스타일)
    for i in prange(a.size):
        s += a[i]
    return s


# 컴파일용 워밍업
sum_serial(xs[:10])
sum_parallel(xs[:10])

t0 = time.time()
s1 = sum_serial(xs)
t1 = time.time()
print(f"Serial  sum = {s1:.4f}, time = {t1 - t0:.4f} s")

t0 = time.time()
s2 = sum_parallel(xs)
t1 = time.time()
print(f"Parallel sum = {s2:.4f}, time = {t1 - t0:.4f} s")



t0 = time.time()
s2 = sum_parallel(xs)
t1 = time.time()
print(f"Parallel sum = {s2:.4f}, time = {t1 - t0:.4f} s")
