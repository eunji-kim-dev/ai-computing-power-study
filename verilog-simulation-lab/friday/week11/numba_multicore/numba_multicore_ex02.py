import time
import numpy as np
from numba import njit


@njit
def matmul_numba(A, B):
    N = A.shape[0]
    K = A.shape[1]
    M = B.shape[1]

    C = np.zeros((N, M), dtype=np.float64)

    for i in range(N):
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

    # --------------------------------------------------------
    # Numba 최초 실행
    # 최초 실행에는 컴파일 시간이 포함되므로 미리 한 번 실행
    # --------------------------------------------------------
    C_numba = matmul_numba(A, B)

    # --------------------------------------------------------
    # Numba 실행 시간 측정
    # --------------------------------------------------------
    start = time.perf_counter()
    C_numba = matmul_numba(A, B)
    numba_time = time.perf_counter() - start

    # --------------------------------------------------------
    # NumPy 행렬곱 시간 측정
    # --------------------------------------------------------
    start = time.perf_counter()
    C_numpy = A @ B
    numpy_time = time.perf_counter() - start

    # --------------------------------------------------------
    # 결과 비교
    # --------------------------------------------------------
    error = np.max(np.abs(C_numpy - C_numba))

    print("행렬 크기")
    print(f"A: {N} x {K}")
    print(f"B: {K} x {M}")
    print(f"C: {N} x {M}")

    print("\n성능 비교")
    print(f"Numba 행렬곱 시간: {numba_time:.6f}초")
    print(f"NumPy A @ B 시간 : {numpy_time:.6f}초")

    print("\n결과 검증")
    print(f"최대 오차: {error:.12f}")


if __name__ == "__main__":
    main()
