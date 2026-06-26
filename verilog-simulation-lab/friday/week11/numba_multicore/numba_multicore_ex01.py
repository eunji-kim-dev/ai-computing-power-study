import time
import numpy as np
import numba
from numba import njit, prange


# ------------------------------------------------------------
# 1. Numba를 사용하지 않은 순수 Python 행렬곱
#    매우 느리므로 작은 행렬에서만 테스트 권장
# ------------------------------------------------------------
def matmul_python(A, B):
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


# ------------------------------------------------------------
# 2. Numba 단일 코어용 행렬곱
#    일반 range 사용
# ------------------------------------------------------------
@njit
def matmul_numba_single(A, B):
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


# ------------------------------------------------------------
# 3. Numba 멀티코어 행렬곱
#    parallel=True + prange 사용
#
#    i 방향, 즉 행 방향을 여러 CPU thread가 나누어 계산
# ------------------------------------------------------------
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


def measure_time(func, A, B):
    start = time.perf_counter()
    C = func(A, B)
    elapsed = time.perf_counter() - start
    return C, elapsed


def main():
    # --------------------------------------------------------
    # 행렬 크기 설정
    # --------------------------------------------------------
    # 처음에는 400 또는 512 정도 권장
    # 너무 크게 하면 Python 버전이 매우 오래 걸립니다.
    # --------------------------------------------------------
    N = 512
    K = 512
    M = 512

    print("행렬 크기")
    print(f"A: {N} x {K}")
    print(f"B: {K} x {M}")
    print(f"C: {N} x {M}")

    print("\nNumba 정보")
    print("Numba version:", numba.__version__)
    print("사용 가능한 최대 thread 수:", numba.get_num_threads())

    np.random.seed(0)
    A = np.random.rand(N, K)
    B = np.random.rand(K, M)

    # --------------------------------------------------------
    # Numba 최초 실행
    # 최초 실행에는 컴파일 시간이 포함되므로 미리 한 번 실행
    # --------------------------------------------------------
    print("\nNumba JIT 컴파일 준비 중...")

    numba.set_num_threads(1)
    _ = matmul_numba_single(A, B)
    _ = matmul_numba_parallel(A, B)

    print("컴파일 완료")

    # --------------------------------------------------------
    # 1. 순수 Python for문 행렬곱
    # --------------------------------------------------------
    # 512 x 512에서는 시간이 오래 걸릴 수 있습니다.
    # 너무 오래 걸리면 이 부분은 주석 처리해도 됩니다.
    # --------------------------------------------------------
    print("\n[1] 순수 Python for문 행렬곱")

    start = time.perf_counter()
    C_python = matmul_python(A, B)
    python_time = time.perf_counter() - start

    print(f"실행 시간: {python_time:.6f}초")

    # --------------------------------------------------------
    # 2. Numba 단일 코어 행렬곱
    # --------------------------------------------------------
    print("\n[2] Numba 단일 코어 행렬곱")

    C_numba_single, numba_single_time = measure_time(
        matmul_numba_single,
        A,
        B
    )

    print(f"실행 시간: {numba_single_time:.6f}초")
    print(f"Python 대비 속도 향상: {python_time / numba_single_time:.2f}배")

    # --------------------------------------------------------
    # 3. Numba parallel=True, thread 1개 사용
    # --------------------------------------------------------
    print("\n[3] Numba parallel=True, thread 4개 사용")

    numba.set_num_threads(4)
    print("현재 Numba thread 수:", numba.get_num_threads())

    C_parallel_1, parallel_1_time = measure_time(
        matmul_numba_parallel,
        A,
        B
    )

    print(f"실행 시간: {parallel_1_time:.6f}초")

    # --------------------------------------------------------
    # 4. Numba parallel=True, thread 2개 사용
    # --------------------------------------------------------
    print("\n[4] Numba parallel=True, thread 8개 사용")

    numba.set_num_threads(8)
    print("현재 Numba thread 수:", numba.get_num_threads())

    C_parallel_2, parallel_2_time = measure_time(
        matmul_numba_parallel,
        A,
        B
    )

    print(f"실행 시간: {parallel_2_time:.6f}초")

    # --------------------------------------------------------
    # 5. NumPy A @ B 비교
    # --------------------------------------------------------
    # 참고용입니다.
    # NumPy는 내부적으로 BLAS를 사용하므로 이미 매우 빠를 수 있습니다.
    # --------------------------------------------------------
    print("\n[5] NumPy A @ B")

    start = time.perf_counter()
    C_numpy = A @ B
    numpy_time = time.perf_counter() - start

    print(f"실행 시간: {numpy_time:.6f}초")

    # --------------------------------------------------------
    # 6. 결과 검증
    # --------------------------------------------------------
    error_single = np.max(np.abs(C_numpy - C_numba_single))
    error_parallel_1 = np.max(np.abs(C_numpy - C_parallel_1))
    error_parallel_2 = np.max(np.abs(C_numpy - C_parallel_2))

    print("\n결과 검증")
    print(f"NumPy vs Numba single 최대 오차     : {error_single:.12f}")
    print(f"NumPy vs Numba parallel 4 최대 오차 : {error_parallel_1:.12f}")
    print(f"NumPy vs Numba parallel 8 최대 오차 : {error_parallel_2:.12f}")

    # --------------------------------------------------------
    # 7. 성능 비교 요약
    # --------------------------------------------------------
    print("\n성능 비교 요약")
    print(f"순수 Python for문             : {python_time:.6f}초")
    print(f"Numba 단일 코어              : {numba_single_time:.6f}초")
    print(f"Numba parallel thread 4개     : {parallel_1_time:.6f}초")
    print(f"Numba parallel thread 8개     : {parallel_2_time:.6f}초")
    print(f"NumPy A @ B                  : {numpy_time:.6f}초")

    print("\n속도 향상 비율")
    print(f"Python / Numba 단일 코어      : {python_time / numba_single_time:.2f}배")
    print(f"parallel 1개 / parallel 4개   : {parallel_1_time / parallel_2_time:.2f}배")
    print(f"Numba 단일 / parallel 8개     : {numba_single_time / parallel_2_time:.2f}배")


if __name__ == "__main__":
    main()
