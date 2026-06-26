import time
import numpy as np
from numba import njit

# 순수 Python 버전 (일부러 파이썬 리스트 사용)
def py_sum(xs):
    s = 0.0
    for x in xs:
        s += x
    return s

# Numba JIT 버전 (nopython 모드)
@njit
def nb_sum(xs):
    s = 0.0
    for x in xs:
        s += x
    return s


N = 10_000_000
xs = np.random.rand(N).astype(np.float64)

# 1) 순수 파이썬
t0 = time.time()
s1 = py_sum(xs)
t1 = time.time()
print(f"Python sum = {s1:.4f}, time = {t1 - t0:.4f} s")

# 2) Numba JIT (첫 호출: 컴파일 + 실행)
t0 = time.time()
s2 = nb_sum(xs)
t1 = time.time()
print(f"Numba (1st) sum = {s2:.4f}, time = {t1 - t0:.4f} s")

# 3) 두 번째 호출: 이미 컴파일된 함수 호출만
t0 = time.time()
s3 = nb_sum(xs)
t1 = time.time()
print(f"Numba (2nd) sum = {s3:.4f}, time = {t1 - t0:.4f} s")
