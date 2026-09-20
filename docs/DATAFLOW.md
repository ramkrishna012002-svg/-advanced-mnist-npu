# Dataflow

INT8 input -> input/weight buffers -> 8x8 systolic MAC -> INT32 accumulation -> bias -> ReLU -> requantization -> detection/post-processing. A complete CNN still needs feature-map scheduling, convolution/tiling, DMA and a trained quantized model.
