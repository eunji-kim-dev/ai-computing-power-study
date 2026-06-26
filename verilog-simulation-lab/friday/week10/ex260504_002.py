import numpy as np
import cupy as cp
import time
 
# NumPy (CPU)
a_np = np.random.rand(10000, 10000).astype(np.float32)
start = time.time()
b_np = a_np.dot(a_np)
end = time.time()
print("NumPy CPU 연산 시간:", end - start)

# CuPy (GPU)
a_cp = cp.random.rand(10000, 10000).astype(cp.float32)
cp.cuda.Device(0).synchronize()  # 연산 전/후 동기화
start = time.time()
b_cp = a_cp.dot(a_cp)
cp.cuda.Device(0).synchronize()
end = time.time()
print("CuPy GPU 연산 시간:", end - start)
