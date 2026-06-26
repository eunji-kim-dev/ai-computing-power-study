import numpy as np
from numba import cuda
import time

# CUDA 커널 (GPU에서 실행)
@cuda.jit
def vec_add(a, b, c):
    # 1차원 글로벌 인덱스
    i = cuda.grid(1)
    if i < a.size:
        c[i] = a[i] + b[i]

N = 500_000_000  # 좀 크게 잡아야 차이가 잘 보입니다
a = np.random.rand(N).astype(np.float32)
b = np.random.rand(N).astype(np.float32)
c = np.zeros_like(a)

# 디바이스 메모리로 복사
d_a = cuda.to_device(a)
d_b = cuda.to_device(b)
d_c = cuda.to_device(c)

# 여러 가지 설정을 돌려보기
candidates = [32, 64, 128, 256, 512, 1024]  # threads_per_block 후보들

# 워밍업 (JIT 컴파일 시간 제거)
blocks = (N + 256 - 1) // 256
vec_add[blocks, 256](d_a, d_b, d_c)
cuda.synchronize()

print("=== threads_per_block 변화에 따른 실행 시간 측정 ===")
for threads_per_block in candidates:
    blocks_per_grid = (N + threads_per_block - 1) // threads_per_block

    # 측정 시작
    t0 = time.time()
    vec_add[blocks_per_grid, threads_per_block](d_a, d_b, d_c)
    cuda.synchronize()  # 커널 완료까지 기다림
    t1 = time.time()

    # 검증 (원하는 경우)
    # d_c.copy_to_host(c)
    # assert np.allclose(c, a + b)

    print(
        f"threads_per_block = {threads_per_block:4d}, "
        f"blocks_per_grid = {blocks_per_grid:6d}, "
        f"time = {t1 - t0:.6f} s"
    )
