import numpy as np


def quantize_int8(x):
    """Symmetric float32 -> signed INT8 quantization."""
    x = np.asarray(x, dtype=np.float32)
    max_abs = np.max(np.abs(x))

    if max_abs == 0:
        scale = 1.0
    else:
        scale = max_abs / 127.0

    q = np.round(x / scale)
    q = np.clip(q, -128, 127).astype(np.int8)

    return q, scale


if __name__ == "__main__":
    values = np.array([-1.0, -0.5, 0.0, 0.5, 1.0], dtype=np.float32)
    q, scale = quantize_int8(values)

    print("Scale:", scale)
    print("INT8:", q)
