import numpy as np

INT8_MIN = -128
INT8_MAX = 127


def int8_matmul(a, w):
    """Reference INT8 x INT8 matrix multiplication with INT32 accumulation."""
    a32 = np.asarray(a, dtype=np.int8).astype(np.int32)
    w32 = np.asarray(w, dtype=np.int8).astype(np.int32)
    return a32 @ w32


def relu(x):
    return np.maximum(np.asarray(x, dtype=np.int32), 0)


def requantize(x, shift):
    x = np.asarray(x, dtype=np.int32)
    y = x >> shift
    return np.clip(y, INT8_MIN, INT8_MAX).astype(np.int8)


if __name__ == "__main__":
    a = np.arange(1, 9, dtype=np.int8).reshape(1, 8)
    w = np.ones((8, 1), dtype=np.int8)

    y = int8_matmul(a, w)

    print("Input:")
    print(a)
    print("Weights:")
    print(w)
    print("INT32 output:")
    print(y)
    print("ReLU:")
    print(relu(y))
    print("Requantized INT8:")
    print(requantize(y, 2))
