import numpy as np
from numba import cuda
import matplotlib.pyplot as plt

@cuda.jit
def invert_image(src, dst):
    x, y = cuda.grid(2)  # 2D 글로벌 인덱스
    H, W = src.shape
    if x < H and y < W:
        dst[x, y] = 1.0 - src[x, y]  # 흑백 이미지라고 가정 (0~1)


H, W = 1024, 1024
img = np.random.rand(H, W).astype(np.float32)  # 랜덤 흑백 이미지

d_src = cuda.to_device(img)
d_dst = cuda.device_array_like(d_src)

threads_per_block = (16, 16)
blocks_per_grid_x = (H + threads_per_block[0] - 1) // threads_per_block[0]
blocks_per_grid_y = (W + threads_per_block[1] - 1) // threads_per_block[1]
blocks_per_grid = (blocks_per_grid_x, blocks_per_grid_y)

invert_image[blocks_per_grid, threads_per_block](d_src, d_dst)
out = d_dst.copy_to_host()

# 시각화
plt.subplot(1, 2, 1)
plt.title("Original")
plt.imshow(img, cmap="gray")

plt.subplot(1, 2, 2)
plt.title("Inverted (GPU)")
plt.imshow(out, cmap="gray")

plt.show()
