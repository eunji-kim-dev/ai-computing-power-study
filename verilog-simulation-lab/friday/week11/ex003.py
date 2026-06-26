import numpy as np
from numba import cuda

# CUDA 커널 (GPU에서 실행)
@cuda.jit
def vec_add(a, b, c):
    # 1차원 글로벌 인덱스
    i = cuda.grid(1)
    if i < a.size:
        c[i] = a[i] + b[i]


N = 1_000_000
a = np.random.rand(N).astype(np.float32)
b = np.random.rand(N).astype(np.float32)
c = np.zeros_like(a)

# 디바이스 메모리로 복사
d_a = cuda.to_device(a)
d_b = cuda.to_device(b)
d_c = cuda.to_device(c)

threads_per_block = 256
blocks_per_grid = (N + threads_per_block - 1) // threads_per_block

# 커널 실행: vec_add[gridDim, blockDim](...)
vec_add[blocks_per_grid, threads_per_block](d_a, d_b, d_c)

# 결과를 호스트로 복사
d_c.copy_to_host(c)

# 검증
print("max error:", np.max(np.abs(c - (a + b))))
