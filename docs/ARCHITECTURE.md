# 8x8 NPU Architecture

64 processing elements are arranged as 8 rows x 8 columns. Each PE receives signed INT8 activation and weight, multiplies to INT16, accumulates into INT32, forwards activation right and weight down. The array is a compute foundation for tiled GEMM/convolution mappings.
