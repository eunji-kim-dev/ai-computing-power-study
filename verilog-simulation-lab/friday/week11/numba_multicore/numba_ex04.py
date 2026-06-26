import math
import time
import numpy as np
from numba import cuda


# ------------------------------------------------------------
# 1. CPU 순차 처리 함수
# ------------------------------------------------------------
def cpu_compute(x, y):
    """
    CPU에서 Python for문으로 하나씩 계산
    """
    for i in range(x.size):
        v = x[i]

        # 계산량을 조금 늘리기 위해 여러 연산을 반복
        for _ in range(20):
            v = math.sin(v) + math.cos(v) + math.sqrt(v + 1.0)

        y[i] = v


# ------------------------------------------------------------
# 2. CUDA GPU 커널
# ------------------------------------------------------------
@cuda.jit
def gpu_compute(x, y):
    """
    GPU에서 각 스레드가 배열의 원소 하나를 담당
    """
    i = cuda.grid(1)

    if i < x.size:
        v = x[i]

        for _ in range(20):
            v = math.sin(v) + math.cos(v) + math.sqrt(v + 1.0)

        y[i] = v


# ------------------------------------------------------------
# 3. 실행 코드
# ------------------------------------------------------------
def main():
    if not cuda.is_available():
        raise RuntimeError("CUDA GPU를 사용할 수 없습니다. NVIDIA GPU와 CUDA 드라이버를 확인하세요.")

    n = 10_000_000

    x = np.random.random(n).astype(np.float32)
    y_cpu = np.zeros_like(x)
    y_gpu = np.zeros_like(x)

    print(f"데이터 개수: {n:,}")

    device = cuda.get_current_device()
    gpu_name = device.name

    if isinstance(gpu_name, bytes):
        gpu_name = gpu_name.decode()

    print("사용 GPU:", gpu_name)

    # --------------------------------------------------------
    # CPU 실행 시간 측정
    # --------------------------------------------------------
    start = time.perf_counter()
    cpu_compute(x, y_cpu)
    cpu_time = time.perf_counter() - start

    print(f"CPU 순차 처리 시간: {cpu_time:.4f}초")

    # --------------------------------------------------------
    # GPU 실행 준비
    # --------------------------------------------------------
    threads_per_block = 256
    blocks_per_grid = (n + threads_per_block - 1) // threads_per_block

    # 데이터를 GPU 메모리로 복사
    d_x = cuda.to_device(x)
    d_y = cuda.device_array_like(x)

    # --------------------------------------------------------
    # GPU 커널 최초 실행
    # 최초 실행에는 JIT 컴파일 시간이 포함될 수 있음
    # --------------------------------------------------------
    gpu_compute[blocks_per_grid, threads_per_block](d_x, d_y)
    cuda.synchronize()

    # --------------------------------------------------------
    # GPU 커널 실행 시간 측정
    # --------------------------------------------------------
    start = time.perf_counter()
    gpu_compute[blocks_per_grid, threads_per_block](d_x, d_y)
    cuda.synchronize()
    gpu_kernel_time = time.perf_counter() - start

    # 결과를 CPU 메모리로 복사
    y_gpu = d_y.copy_to_host()

    print(f"GPU 커널 실행 시간: {gpu_kernel_time:.4f}초")
    print(f"속도 향상 비율: {cpu_time / gpu_kernel_time:.2f}배")

    # --------------------------------------------------------
    # 결과 검증
    # --------------------------------------------------------
    max_error = np.max(np.abs(y_cpu - y_gpu))
    print(f"CPU와 GPU 결과 최대 오차: {max_error:.6f}")


if __name__ == "__main__":
    main()
