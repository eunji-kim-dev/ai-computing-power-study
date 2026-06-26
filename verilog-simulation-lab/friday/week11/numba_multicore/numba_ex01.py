import time
import numpy as np
from numba import cuda


# ------------------------------------------------------------
# CUDA 커널: 기본 행렬곱
# C = A @ B
#
# A: N x K
# B: K x M
# C: N x M
# ------------------------------------------------------------
@cuda.jit
def matmul_basic_kernel(A, B, C):
    col, row = cuda.grid(2)

    if row < C.shape[0] and col < C.shape[1]:
        tmp = 0.0

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
    N = 1024*8
    K = 1024*8
    M = 1024*8

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

    print(f"\n[CPU NumPy]")
    print(f"계산 시간: {cpu_time:.6f}초")

    # --------------------------------------------------------
    # 4. GPU 메모리로 데이터 복사
    # --------------------------------------------------------
    d_A = cuda.to_device(A)
    d_B = cuda.to_device(B)
    d_C = cuda.device_array((N, M), dtype=np.float32)

    # --------------------------------------------------------
    # 5. CUDA 실행 설정
    # --------------------------------------------------------
    threads_per_block = (16, 16)

    blocks_per_grid_x = (M + threads_per_block[0] - 1) // threads_per_block[0]
    blocks_per_grid_y = (N + threads_per_block[1] - 1) // threads_per_block[1]

    blocks_per_grid = (blocks_per_grid_x, blocks_per_grid_y)

    print(f"\nCUDA 설정:")
    print(f"threads_per_block = {threads_per_block}")
    print(f"blocks_per_grid   = {blocks_per_grid}")

    # --------------------------------------------------------
    # 6. 최초 1회 실행
    #    Numba JIT 컴파일 시간이 포함되므로 성능 측정에서 제외
    # --------------------------------------------------------
    matmul_basic_kernel[blocks_per_grid, threads_per_block](d_A, d_B, d_C)
    cuda.synchronize()

    # --------------------------------------------------------
    # 7. GPU 커널 실행 시간 측정
    # --------------------------------------------------------
    start = time.perf_counter()
    matmul_basic_kernel[blocks_per_grid, threads_per_block](d_A, d_B, d_C)
    cuda.synchronize()
    gpu_kernel_time = time.perf_counter() - start

    # --------------------------------------------------------
    # 8. 결과를 CPU로 복사
    # --------------------------------------------------------
    start = time.perf_counter()
    C_gpu = d_C.copy_to_host()
    copy_back_time = time.perf_counter() - start

    print(f"\n[GPU CUDA 기본 커널]")
    print(f"커널 계산 시간: {gpu_kernel_time:.6f}초")
    print(f"GPU → CPU 복사 시간: {copy_back_time:.6f}초")

    # --------------------------------------------------------
    # 9. 결과 검증
    # --------------------------------------------------------
    max_error = np.max(np.abs(C_cpu - C_gpu))

    print(f"\n[결과 검증]")
    print(f"CPU와 GPU 결과 최대 오차: {max_error:.6f}")

    # --------------------------------------------------------
    # 10. 성능 비교
    # --------------------------------------------------------
    print(f"\n[성능 비교]")
    print(f"CPU NumPy 시간       : {cpu_time:.6f}초")
    print(f"GPU 커널 계산 시간   : {gpu_kernel_time:.6f}초")
    print(f"CPU / GPU 커널 비율  : {cpu_time / gpu_kernel_time:.2f}배")


if __name__ == "__main__":
    main()
