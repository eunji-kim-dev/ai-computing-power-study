import time
import numpy as np
from numba import cuda, float32


# ============================================================
# 설정
# ============================================================
TPB = 16  # threads per block, 16 x 16 = 256 threads


# ============================================================
# 1단계: CPU Python for문 행렬곱
# C = A @ B
# ============================================================
def matmul_cpu_python(A, B):
    N = A.shape[0]
    K = A.shape[1]
    M = B.shape[1]

    C = np.zeros((N, M), dtype=np.float32)

    for i in range(N):
        for j in range(M):
            s = 0.0
            for k in range(K):
                s += A[i, k] * B[k, j]
            C[i, j] = s

    return C


# ============================================================
# 2단계: Numba CUDA naive 행렬곱
#
# 각 CUDA thread가 C[row, col] 원소 하나를 계산
# ============================================================
@cuda.jit
def matmul_cuda_naive(A, B, C):
    col, row = cuda.grid(2)

    if row < C.shape[0] and col < C.shape[1]:
        tmp = float32(0.0)

        for k in range(A.shape[1]):
            tmp += A[row, k] * B[k, col]

        C[row, col] = tmp


# ============================================================
# 3단계: Numba CUDA shared memory 행렬곱
#
# A와 B의 일부 타일을 shared memory에 올린 뒤 재사용
# ============================================================
@cuda.jit
def matmul_cuda_shared(A, B, C):
    sA = cuda.shared.array(shape=(TPB, TPB), dtype=float32)
    sB = cuda.shared.array(shape=(TPB, TPB), dtype=float32)

    col, row = cuda.grid(2)

    tx = cuda.threadIdx.x
    ty = cuda.threadIdx.y

    N = A.shape[0]
    K = A.shape[1]
    M = B.shape[1]

    tmp = float32(0.0)

    # K 방향으로 타일 단위 계산
    for tile in range((K + TPB - 1) // TPB):
        a_col = tile * TPB + tx
        b_row = tile * TPB + ty

        # A 타일을 shared memory로 복사
        if row < N and a_col < K:
            sA[ty, tx] = A[row, a_col]
        else:
            sA[ty, tx] = 0.0

        # B 타일을 shared memory로 복사
        if b_row < K and col < M:
            sB[ty, tx] = B[b_row, col]
        else:
            sB[ty, tx] = 0.0

        # 블록 내 모든 thread가 shared memory 복사를 끝낼 때까지 대기
        cuda.syncthreads()

        # shared memory에 있는 타일끼리 부분 내적
        for j in range(TPB):
            tmp += sA[ty, j] * sB[j, tx]

        # 다음 tile로 넘어가기 전에 동기화
        cuda.syncthreads()

    if row < C.shape[0] and col < C.shape[1]:
        C[row, col] = tmp


# ============================================================
# 유틸리티 함수
# ============================================================
def get_gpu_name():
    device = cuda.get_current_device()
    name = device.name

    if isinstance(name, bytes):
        name = name.decode()

    return name


def measure_time(func, *args):
    start = time.perf_counter()
    result = func(*args)
    elapsed = time.perf_counter() - start
    return result, elapsed


def run_cuda_kernel(kernel, d_A, d_B, d_C, blocks_per_grid, threads_per_block):
    # Numba JIT 컴파일 및 GPU 워밍업
    kernel[blocks_per_grid, threads_per_block](d_A, d_B, d_C)
    cuda.synchronize()

    # 실제 커널 시간 측정
    start = time.perf_counter()
    kernel[blocks_per_grid, threads_per_block](d_A, d_B, d_C)
    cuda.synchronize()
    elapsed = time.perf_counter() - start

    return elapsed


def max_abs_error(reference, target):
    return np.max(np.abs(reference - target))


# ============================================================
# 메인 실행 함수
# ============================================================
def main():
    if not cuda.is_available():
        raise RuntimeError("CUDA GPU를 사용할 수 없습니다. NVIDIA GPU와 CUDA 드라이버를 확인하세요.")

    print("사용 GPU:", get_gpu_name())

    # --------------------------------------------------------
    # 행렬 크기 설정
    # --------------------------------------------------------
    # CPU Python for문까지 비교하려면 256 또는 512 권장
    # 1024 이상은 CPU Python for문이 매우 오래 걸릴 수 있음
    N = 512
    K = 512
    M = 512

    print("\n행렬 크기")
    print(f"A: {N} x {K}")
    print(f"B: {K} x {M}")
    print(f"C: {N} x {M}")

    np.random.seed(0)
    A = np.random.rand(N, K).astype(np.float32)
    B = np.random.rand(K, M).astype(np.float32)

    # --------------------------------------------------------
    # 1단계: CPU Python for문 행렬곱
    # --------------------------------------------------------
    print("\n[1단계] CPU Python for문 행렬곱 실행 중...")
    C_cpu_python, cpu_python_time = measure_time(matmul_cpu_python, A, B)
    print(f"CPU Python for문 시간: {cpu_python_time:.6f}초")

    # --------------------------------------------------------
    # 2단계, 3단계 준비: GPU 메모리 복사
    # --------------------------------------------------------
    d_A = cuda.to_device(A)
    d_B = cuda.to_device(B)

    d_C_naive = cuda.device_array((N, M), dtype=np.float32)
    d_C_shared = cuda.device_array((N, M), dtype=np.float32)

    threads_per_block = (TPB, TPB)
    blocks_per_grid_x = (M + TPB - 1) // TPB
    blocks_per_grid_y = (N + TPB - 1) // TPB
    blocks_per_grid = (blocks_per_grid_x, blocks_per_grid_y)

    print("\nCUDA 실행 설정")
    print(f"threads_per_block = {threads_per_block}")
    print(f"blocks_per_grid   = {blocks_per_grid}")

    # --------------------------------------------------------
    # 2단계: Numba CUDA naive 행렬곱
    # --------------------------------------------------------
    print("\n[2단계] Numba CUDA naive 행렬곱 실행 중...")
    cuda_naive_time = run_cuda_kernel(
        matmul_cuda_naive,
        d_A,
        d_B,
        d_C_naive,
        blocks_per_grid,
        threads_per_block
    )

    C_cuda_naive = d_C_naive.copy_to_host()
    naive_error = max_abs_error(C_cpu_python, C_cuda_naive)

    print(f"CUDA naive 커널 시간: {cuda_naive_time:.6f}초")
    print(f"CPU Python 결과와 최대 오차: {naive_error:.6f}")

    # --------------------------------------------------------
    # 3단계: Numba CUDA shared memory 행렬곱
    # --------------------------------------------------------
    print("\n[3단계] Numba CUDA shared memory 행렬곱 실행 중...")
    cuda_shared_time = run_cuda_kernel(
        matmul_cuda_shared,
        d_A,
        d_B,
        d_C_shared,
        blocks_per_grid,
        threads_per_block
    )

    C_cuda_shared = d_C_shared.copy_to_host()
    shared_error = max_abs_error(C_cpu_python, C_cuda_shared)

    print(f"CUDA shared memory 커널 시간: {cuda_shared_time:.6f}초")
    print(f"CPU Python 결과와 최대 오차: {shared_error:.6f}")

    # --------------------------------------------------------
    # 4단계-1: NumPy A @ B
    # --------------------------------------------------------
    print("\n[4단계-1] NumPy A @ B 실행 중...")
    start = time.perf_counter()
    C_numpy = A @ B
    numpy_time = time.perf_counter() - start

    numpy_error = max_abs_error(C_cpu_python, C_numpy)

    print(f"NumPy A @ B 시간: {numpy_time:.6f}초")
    print(f"CPU Python 결과와 최대 오차: {numpy_error:.6f}")

    # --------------------------------------------------------
    # 4단계-2: CuPy A @ B
    # CuPy가 설치된 경우에만 실행
    # --------------------------------------------------------
    cupy_time = None
    cupy_total_time = None

    try:
        import cupy as cp

        print("\n[4단계-2] CuPy A @ B 실행 중...")

        # CPU -> GPU 복사
        start = time.perf_counter()
        A_cp = cp.asarray(A)
        B_cp = cp.asarray(B)
        cp.cuda.Stream.null.synchronize()
        cupy_copy_to_gpu_time = time.perf_counter() - start

        # 워밍업
        C_cp = A_cp @ B_cp
        cp.cuda.Stream.null.synchronize()

        # GPU 계산 시간
        start = time.perf_counter()
        C_cp = A_cp @ B_cp
        cp.cuda.Stream.null.synchronize()
        cupy_time = time.perf_counter() - start

        # GPU -> CPU 복사
        start = time.perf_counter()
        C_cupy = cp.asnumpy(C_cp)
        cp.cuda.Stream.null.synchronize()
        cupy_copy_to_cpu_time = time.perf_counter() - start

        cupy_total_time = (
            cupy_copy_to_gpu_time
            + cupy_time
            + cupy_copy_to_cpu_time
        )

        cupy_error = max_abs_error(C_cpu_python, C_cupy)

        print(f"CuPy CPU → GPU 복사 시간: {cupy_copy_to_gpu_time:.6f}초")
        print(f"CuPy GPU 계산 시간     : {cupy_time:.6f}초")
        print(f"CuPy GPU → CPU 복사 시간: {cupy_copy_to_cpu_time:.6f}초")
        print(f"CuPy 전체 시간         : {cupy_total_time:.6f}초")
        print(f"CPU Python 결과와 최대 오차: {cupy_error:.6f}")

    except ImportError:
        print("\n[4단계-2] CuPy가 설치되어 있지 않아 CuPy 비교는 건너뜁니다.")
        print("설치 예: pip install cupy-cuda12x")
    except Exception as e:
        print("\n[4단계-2] CuPy 실행 중 문제가 발생하여 CuPy 비교는 건너뜁니다.")
        print("오류 내용:", e)

    # --------------------------------------------------------
    # 최종 성능 요약
    # --------------------------------------------------------
    print("\n============================================================")
    print("성능 비교 요약")
    print("============================================================")
    print(f"1. CPU Python for문             : {cpu_python_time:.6f}초")
    print(f"2. Numba CUDA naive 커널        : {cuda_naive_time:.6f}초")
    print(f"3. Numba CUDA shared 커널       : {cuda_shared_time:.6f}초")
    print(f"4-1. NumPy A @ B                : {numpy_time:.6f}초")

    if cupy_time is not None:
        print(f"4-2. CuPy A @ B GPU 계산        : {cupy_time:.6f}초")
        print(f"4-2. CuPy A @ B 전체            : {cupy_total_time:.6f}초")

    print("\n속도 향상 비율")
    print(f"CPU Python / CUDA naive         : {cpu_python_time / cuda_naive_time:.2f}배")
    print(f"CPU Python / CUDA shared        : {cpu_python_time / cuda_shared_time:.2f}배")
    print(f"CUDA naive / CUDA shared        : {cuda_naive_time / cuda_shared_time:.2f}배")
    print(f"CPU Python / NumPy A @ B        : {cpu_python_time / numpy_time:.2f}배")

    if cupy_time is not None:
        print(f"CPU Python / CuPy GPU 계산      : {cpu_python_time / cupy_time:.2f}배")


if __name__ == "__main__":
    main()
