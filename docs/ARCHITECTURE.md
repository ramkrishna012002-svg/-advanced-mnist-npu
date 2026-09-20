# 8x8 INT8 Object Detection NPU Architecture

## Compute core

The accelerator is built around a true dataflow-style 8x8 systolic MAC array.

- 64 processing elements
- Signed INT8 activations
- Signed INT8 weights
- INT8 x INT8 -> INT16 product
- INT16 -> INT32 accumulation
- Registered activation forwarding
- Registered weight forwarding

## Processing path

Camera/Image
-> Preprocessing
-> Input Buffer
-> 8x8 Systolic MAC Array
-> INT32 Accumulation
-> Bias
-> ReLU
-> Requantization
-> Detection/Post-processing

## Important scope

This repository is the hardware compute foundation for an object-detection NPU. A complete detector still requires a trained CNN, convolution/tensor tiling, DMA/BRAM scheduling, multiple layers, and post-processing such as NMS.

The current RTL is intended for learning, simulation, and incremental FPGA development; it is not a claim of trained detector accuracy.
