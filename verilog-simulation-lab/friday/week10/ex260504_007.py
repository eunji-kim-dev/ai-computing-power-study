import numpy as np
import cupy as cp
import time
 
np.random.seed(0)
cp.random.seed(0)

def compare_dot(dtype=np.float32, N=1024):
    print(f"\n=== dtype={dtype.__name__}, N={N} ===")

    # 1) 같은 입력을 CPU에서 생성
    A_cpu = np.random.rand(N, N).astype(dtype)
    B_cpu = np.random.rand(N, N).astype(dtype)

    # 2) CPU 내적 (시간 측정)
    t0 = time.perf_counter()
    C_cpu = A_cpu @ B_cpu
    t1 = time.perf_counter()
    cpu_time = t1 - t0

    # 3) CPU->GPU 전송
    t0 = time.perf_counter()
    A_gpu = cp.asarray(A_cpu)
    B_gpu = cp.asarray(B_cpu)
    cp.cuda.Stream.null.synchronize()
    t1 = time.perf_counter()
    to_gpu_time = t1 - t0

    # (선택) 간단 워밍업 (정확도 위해 1회 실행)
    _ = A_gpu @ B_gpu
    cp.cuda.Stream.null.synchronize()

    # 4) GPU 내적 (전송 제외 순수 연산 시간)
    t0 = time.perf_counter()
    C_gpu = A_gpu @ B_gpu
    cp.cuda.Stream.null.synchronize()
    t1 = time.perf_counter()
    gpu_compute_time = t1 - t0

    # 5) GPU->CPU 전송
    t0 = time.perf_counter()
    C_gpu_cpu = cp.asnumpy(C_gpu)
    t1 = time.perf_counter()
    to_cpu_time = t1 - t0

    # 6) 요소별 오차(절대값) 통계
    abs_err = np.abs(C_cpu - C_gpu_cpu)
    print(f"오차(|CPU-GPU|)  max:  {abs_err.max():.6e}")
    print(f"오차(|CPU-GPU|)  min:  {abs_err.min():.6e}")
    print(f"오차(|CPU-GPU|) mean: {abs_err.mean():.6e}")

    # 7) 시간 요약
    e2e_gpu_time = to_gpu_time + gpu_compute_time + to_cpu_time
    print(f"\n[시간]")
    print(f"CPU  연산:         {cpu_time:.4f} s")
    print(f"GPU  전송→연산→회수: {e2e_gpu_time:.4f} s  (전송포함)")
    print(f" └ GPU 순수 연산:    {gpu_compute_time:.4f} s  (전송제외)")
    print(f"    CPU→GPU 전송:    {to_gpu_time:.4f} s")
    print(f"    GPU→CPU 전송:    {to_cpu_time:.4f} s")

    # 8) 간단 속도비(참고)
    if gpu_compute_time > 0:
        print(f"\n[속도비] 순수 연산 기준 CPU/GPU: {cpu_time / gpu_compute_time:.2f}x")
    if e2e_gpu_time > 0:
        print(f"[속도비] 전송 포함 기준 CPU/GPU: {cpu_time / e2e_gpu_time:.2f}x")

# FP32와 FP64 각각 비교 (FP64는 크기 축소 권장)
compare_dot(dtype=np.float32, N=1024)
compare_dot(dtype=np.float64, N=512)
