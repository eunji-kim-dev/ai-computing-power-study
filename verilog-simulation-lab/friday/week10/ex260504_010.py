import time, numpy as np, cupy as cp
from cupyx.scipy.signal import convolve2d
 
H, W = 4000, 4000   # 해상도 큼 → GPU 차이 ↑
yy, xx = np.mgrid[:H, :W].astype(np.float32)
img_cpu = np.zeros((H,W), np.float32)
img_cpu[((yy-H/2)**2 + (xx-W/2)**2) < (min(H,W)/5)**2] = 1.0  # 원
img_cpu[H//6:H//3, W//6:W//3] = 0.5                           # 사각형

# 필터 커널 (블러, 소벨)
blur = np.ones((7,7), np.float32)/49.0
sobel_x = np.array([[-1,0,1],[-2,0,2],[-1,0,1]], np.float32)
sobel_y = sobel_x.T

# CPU (NumPy+SciPy 없이 직접 컨볼브는 무거워서 여기선 CuPy만 속도 비교 위주)
t0 = time.perf_counter()
# CPU에선 간단히 블러만: (NumPy 컨볼루션 직접 구현은 느려서 데모성만)
# 아래는 매우 단순 패딩+합계 방식의 느린 버전 (데모라 주석)
# 실제 수업에선 SciPy 사용 권장
t1 = time.perf_counter()

# GPU (CuPy)
img_gpu = cp.asarray(img_cpu)
t2 = time.perf_counter()
blurred = convolve2d(img_gpu, cp.asarray(blur), mode='same', boundary='symm')
gx = convolve2d(blurred, cp.asarray(sobel_x), mode='same', boundary='symm')
gy = convolve2d(blurred, cp.asarray(sobel_y), mode='same', boundary='symm')
edges = cp.sqrt(gx*gx + gy*gy)
cp.cuda.Stream.null.synchronize()
t3 = time.perf_counter()

print(f"[Image] CPU(참조용, 생략) time≈{t1-t0:.3f}s")
print(f"[Image] GPU(블러+소벨) time={t3-t2:.3f}s  | mean(edge)={float(edges.mean()):.4f}")
