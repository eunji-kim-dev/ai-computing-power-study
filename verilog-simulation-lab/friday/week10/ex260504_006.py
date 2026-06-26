import numpy as np
import cupy as cp
 
np.random.seed(0)
cp.random.seed(0)

def compare_dot(dtype=np.dtype, N=1024):
    print(f"\n=== dtype={dtype.__name__}, N={N} ===")

    # 1) 같은 입력을 CPU에서 생성
    A_cpu = np.random.rand(N, N).astype(dtype)
    B_cpu = np.random.rand(N, N).astype(dtype)

    # 2) CPU 내적
    C_cpu = A_cpu @ B_cpu

    # 3) GPU 내적 (CPU에서 만든 동일 데이터를 GPU로 복사)
    A_gpu = cp.asarray(A_cpu)
    B_gpu = cp.asarray(B_cpu)
    C_gpu = A_gpu @ B_gpu
    C_gpu_cpu = cp.asnumpy(C_gpu)   # GPU 결과를 CPU로 가져옴

    # 4) 요소별 오차(절대값) 통계
    abs_err = np.abs(C_cpu - C_gpu_cpu)
    print(f"오차(|CPU-GPU|)  max: {abs_err.max():.6e}")
    print(f"오차(|CPU-GPU|)  min: {abs_err.min():.6e}")
    print(f"오차(|CPU-GPU|) mean: {abs_err.mean():.6e}")

# FP32와 FP64 각각 비교
compare_dot(dtype=np.float32, N=1024)
compare_dot(dtype=np.float64, N=512)   # FP64는 보통 더 작게 (메모리/속도 고려)
