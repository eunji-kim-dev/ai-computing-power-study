import time
import numpy as np
from numba import cuda, float32


# ------------------------------------------------------------
# CUDA 커널: 기본 행렬곱
# C = A @ B
# ------------------------------------------------------------
@cuda.jit
def matmul_basic_kernel(A, B, C):
    col, row = cuda.grid(2)

    if row < C.shape[0] and col < C.shape[1]:
        tmp = float32(0.0)

        for k in range(A.shape[1]):
            tmp += A[row, k] * B[k, col]

        C[row, col] = tmp


def get_gpu_name():
    device = cuda.get_current_device()
    gpu_name = device.name

    if isinstance(gpu_name, bytes):
        gpu_name = gpu_name.decode()

    return gpu_name


def main():
    if not cuda.is_available():
        raise RuntimeError("CUDA GPU를 사용할 수 없습니다. NVIDIA GPU와 CUDA 드라이버를 확인하세요.")

    print("사용 GPU:", get_gpu_name())

    # --------------------------------------------------------
    # 1. 행렬 크기 설정
    # --------------------------------------------------------
    # 처음 테스트할 때는 1024 또는 2048 권장
    # 8192는 GPU 메모리와 실행 시간이 많이 필요함
    N = 1024 * 4
    K = 1024 * 4
    M = 1024 * 4

    print(f"\n행렬 크기:")
    print(f"A: {N} x {K}")
    print(f"B: {K} x {M}")
    print(f"C: {N} x {M}")

    # --------------------------------------------------------
    # 2. 입력 데이터 생성
    # --------------------------------------------------------
    np.random.seed(0)

    A = np.random.rand(N, K).astype(np.float32)
    B = np.random.rand(K, M).astype(np.float32)

    # --------------------------------------------------------
    # 3. CPU NumPy 행렬곱 성능 측정
    # --------------------------------------------------------
    start = time.perf_counter()
    C_cpu = A @ B
    cpu_time = time.perf_counter() - start

    print(f"\n[CPU NumPy A @ B]")
    print(f"계산 시간: {cpu_time:.6f}초")

    # --------------------------------------------------------
    # 4. Numba CUDA naive kernel
    # --------------------------------------------------------
    d_A = cuda.to_device(A)
    d_B = cuda.to_device(B)
    d_C = cuda.device_array((N, M), dtype=np.float32)

    threads_per_block = (16, 16)

    blocks_per_grid_x = (M + threads_per_block[0] - 1) // threads_per_block[0]
    blocks_per_grid_y = (N + threads_per_block[1] - 1) // threads_per_block[1]

    blocks_per_grid = (blocks_per_grid_x, blocks_per_grid_y)

    print(f"\nCUDA 설정:")
    print(f"threads_per_block = {threads_per_block}")
    print(f"blocks_per_grid   = {blocks_per_grid}")

    # 최초 실행: JIT 컴파일 포함, 측정 제외
    matmul_basic_kernel[blocks_per_grid, threads_per_block](d_A, d_B, d_C)
    cuda.synchronize()

    start = time.perf_counter()
    matmul_basic_kernel[blocks_per_grid, threads_per_block](d_A, d_B, d_C)
    cuda.synchronize()
    numba_kernel_time = time.perf_counter() - start

    start = time.perf_counter()
    C_numba = d_C.copy_to_host()
    numba_copy_back_time = time.perf_counter() - start

    numba_error = np.max(np.abs(C_cpu - C_numba))

    print(f"\n[Numba CUDA naive kernel]")
    print(f"커널 계산 시간: {numba_kernel_time:.6f}초")
    print(f"GPU → CPU 복사 시간: {numba_copy_back_time:.6f}초")
    print(f"CPU NumPy 결과와 최대 오차: {numba_error:.6f}")

    # --------------------------------------------------------
    # 5. CuPy A @ B
    #    실제로는 GPU의 최적화된 행렬곱 라이브러리를 활용
    # --------------------------------------------------------
    try:
        import cupy as cp

        print(f"\n[CuPy A @ B, GPU 행렬곱]")

        # CPU -> GPU 복사
        start = time.perf_counter()
        A_cp = cp.asarray(A)
        B_cp = cp.asarray(B)
        cp.cuda.Stream.null.synchronize()
        cupy_copy_to_gpu_time = time.perf_counter() - start

        # 워밍업
        C_cp = A_cp @ B_cp
        cp.cuda.Stream.null.synchronize()

        # GPU 계산 시간 측정
        start = time.perf_counter()
        C_cp = A_cp @ B_cp
        cp.cuda.Stream.null.synchronize()
        cupy_compute_time = time.perf_counter() - start

        # GPU -> CPU 복사
        start = time.perf_counter()
        C_cupy = cp.asnumpy(C_cp)
        cp.cuda.Stream.null.synchronize()
        cupy_copy_back_time = time.perf_counter() - start

        cupy_total_time = (
            cupy_copy_to_gpu_time
            + cupy_compute_time
            + cupy_copy_back_time
        )

        cupy_error = np.max(np.abs(C_cpu - C_cupy))

        print(f"CPU → GPU 복사 시간: {cupy_copy_to_gpu_time:.6f}초")
        print(f"GPU 계산 시간     : {cupy_compute_time:.6f}초")
        print(f"GPU → CPU 복사 시간: {cupy_copy_back_time:.6f}초")
        print(f"전체 시간         : {cupy_total_time:.6f}초")
        print(f"CPU NumPy 결과와 최대 오차: {cupy_error:.6f}")

    except ImportError:
        print("\n[CuPy 비교 생략]")
        print("CuPy가 설치되어 있지 않습니다.")
        print("CUDA 12 계열 예: pip install cupy-cuda12x")

        cupy_compute_time = None
        cupy_total_time = None

    # --------------------------------------------------------
    # 6. 성능 비교 요약
    # --------------------------------------------------------
    print(f"\n[성능 비교 요약]")
    print(f"CPU NumPy A @ B              : {cpu_time:.6f}초")
    print(f"Numba CUDA naive kernel      : {numba_kernel_time:.6f}초")

    if 'cupy_compute_time' in locals() and cupy_compute_time is not None:
        print(f"CuPy GPU A @ B 계산 시간     : {cupy_compute_time:.6f}초")
        print(f"CuPy GPU A @ B 전체 시간     : {cupy_total_time:.6f}초")

        print(f"\n[비율]")
        print(f"Numba naive / CuPy 계산 시간 : {numba_kernel_time / cupy_compute_time:.2f}배")
        print(f"CPU NumPy / CuPy 계산 시간   : {cpu_time / cupy_compute_time:.2f}배")


if __name__ == "__main__":
    main()
