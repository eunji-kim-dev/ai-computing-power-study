import numpy as np
import cupy as cp
import time
 
# ----------------------------------------------------
# 1) CPU에서 데이터 생성 (NumPy)
# ----------------------------------------------------
a_cpu = np.random.rand(3000, 3000).astype(np.float32)
b_cpu = np.random.rand(3000, 3000).astype(np.float32)

# ----------------------------------------------------
# 2) CPU → GPU 데이터 전달
# ----------------------------------------------------
start = time.time()
a_gpu = cp.asarray(a_cpu)   # CPU → GPU 복사
b_gpu = cp.asarray(b_cpu)
cp.cuda.Stream.null.synchronize()
end = time.time()
print(f"CPU → GPU 전송 시간: {end - start:.5f} 초")

# ----------------------------------------------------
# 3) GPU에서 연산 수행 (행렬 곱)
# ----------------------------------------------------
start = time.time()
c_gpu = a_gpu.dot(b_gpu)    # GPU 연산
cp.cuda.Stream.null.synchronize()
end = time.time()
print(f"GPU 연산 시간: {end - start:.5f} 초")

# ----------------------------------------------------
# 4) GPU → CPU 로 결과 회수
# ----------------------------------------------------
start = time.time()
c_cpu_result = cp.asnumpy(c_gpu)   # GPU → CPU 복사
end = time.time()
print(f"GPU → CPU 전송 시간: {end - start:.5f} 초")

print("\n완료 ✅")
print(f"결과 shape: {c_cpu_result.shape}")
