import time
import numpy as np
import cupy as cp
 
# ----------------------------
# 파라미터
# ----------------------------
N = 3000              # 행렬 크기 (VRAM/메모리에 맞게 조절)
dtype = np.float32    # GPU 유리: float32 권장
repeats = 3           # 반복 측정 후 평균


# ----------------------------
# 1) 데이터 생성 (CPU)
# ----------------------------
a_cpu = np.random.rand(N, N).astype(dtype)
b_cpu = np.random.rand(N, N).astype(dtype)

# ----------------------------
# 2) CPU 연산 (워밍업 + 측정)
# ----------------------------
_ = a_cpu @ b_cpu  # 워밍업
cpu_times = []
for _ in range(repeats):
    t0 = time.time()
    c_cpu = a_cpu @ b_cpu
    t1 = time.time()
    cpu_times.append(t1 - t0)
cpu_mean = float(np.mean(cpu_times))

# ----------------------------
# 3) CPU->GPU 전송 시간
# ----------------------------
t0 = time.time()
a_gpu = cp.asarray(a_cpu)  # CPU -> GPU
b_gpu = cp.asarray(b_cpu)
cp.cuda.Stream.null.synchronize()
t1 = time.time()
to_gpu_time = t1 - t0

# ----------------------------
# 4) GPU 연산 (워밍업 + 측정)
# ----------------------------
_ = a_gpu @ b_gpu
cp.cuda.Stream.null.synchronize()  # 워밍업 동기화

gpu_times = []
for _ in range(repeats):
    cp.cuda.Stream.null.synchronize()
    t0 = time.time()
    c_gpu = a_gpu @ b_gpu
    cp.cuda.Stream.null.synchronize()
    t1 = time.time()
    gpu_times.append(t1 - t0)
gpu_mean = float(np.mean(gpu_times))

# ----------------------------
# 5) GPU->CPU 전송 시간
# ----------------------------
t0 = time.time()
c_from_gpu = cp.asnumpy(c_gpu)
t1 = time.time()
to_cpu_time = t1 - t0

# ----------------------------
# 6) 정확도 확인
# ----------------------------
max_abs_diff = float(np.max(np.abs(c_cpu - c_from_gpu)))
print(f"[검증] max |CPU - GPU| = {max_abs_diff:.6e}")

# ----------------------------
# 7) 결과 요약
# ----------------------------
print("\n=== 성능 결과 (평균) ===")
print(f"행렬 크기: {N}x{N}, dtype={dtype.__name__}, 반복: {repeats}")
print(f"CPU 연산 시간(평균): {cpu_mean:.4f} s")
print(f"GPU 연산 시간(평균): {gpu_mean:.4f} s")
print(f"전송: CPU -> GPU: {to_gpu_time:.4f} s")
print(f"전송: GPU -> CPU: {to_cpu_time:.4f} s")

# 순수 연산 비교 속도배율
if gpu_mean > 0:
    print(f"순수 연산 기준 속도배율 (CPU/GPU): {cpu_mean / gpu_mean:.2f}x")

# 전송 포함 end-to-end (CPU->GPU + GPU 연산 + GPU->CPU) 대비 CPU
end_to_end_gpu = to_gpu_time + gpu_mean + to_cpu_time
print(f"GPU end-to-end (전송 포함): {end_to_end_gpu:.4f} s")
if end_to_end_gpu > 0:
    print(f"전송 포함 속도배율 (CPU / GPU e2e): {cpu_mean / end_to_end_gpu:.2f}x")
