import time
import numpy as np
import numba
from numba import njit, prange


@njit(parallel=True)
def matmul_numba_parallel(A, B):
    N = A.shape[0]
    K = A.shape[1]
    M = B.shape[1]

    C = np.zeros((N, M), dtype=np.float64)

    for i in prange(N):
        for j in range(M):
            s = 0.0
            for k in range(K):
                s += A[i, k] * B[k, j]
            C[i, j] = s

    return C


def main():
    N = 512
    K = 512
    M = 512

    np.random.seed(0)

    A = np.random.rand(N, K)
    B = np.random.rand(K, M)

    # JIT 컴파일
    numba.set_num_threads(1)
    _ = matmul_numba_parallel(A, B)

    # thread 1개
    numba.set_num_threads(1)

    start = time.perf_counter()
    C1 = matmul_numba_parallel(A, B)
    t1 = time.perf_counter() - start

    # thread 2개
    numba.set_num_threads(2)

    start = time.perf_counter()
    C2 = matmul_numba_parallel(A, B)
    t2 = time.perf_counter() - start

    # NumPy 결과
    C_numpy = A @ B

    error1 = np.max(np.abs(C_numpy - C1))
    error2 = np.max(np.abs(C_numpy - C2))

    print("Numba thread 수 비교")
    print(f"thread 1개 시간: {t1:.6f}초")
    print(f"thread 2개 시간: {t2:.6f}초")
    print(f"속도 향상       : {t1 / t2:.2f}배")

    print("\n결과 검증")
    print(f"thread 1개 최대 오차: {error1:.12f}")
    print(f"thread 2개 최대 오차: {error2:.12f}")


if __name__ == "__main__":
    main()
