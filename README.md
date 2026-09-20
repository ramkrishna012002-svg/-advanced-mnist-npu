# FPGA 8x8 Object Detection NPU

Advanced starter project for an INT8 edge-vision accelerator on Xilinx FPGA.

## Pipeline
Camera/Image -> Preprocessing -> Input Buffer -> 8x8 INT8 Systolic MAC Array -> INT32 Accumulation -> Bias -> ReLU -> Requantization -> Detection/Post-processing

## Numeric format
- Activations: signed INT8 (-128..127)
- Weights: signed INT8 (-128..127)
- Product: signed INT16
- Accumulator: signed INT32
- Quantized output: signed INT8

## Repository
- rtl/: synthesizable Verilog compute/control modules
- sim/: Verilog testbench
- python/: golden model, quantization and test-vector generation
- docs/: architecture and dataflow
- vivado/: Vivado 2023.2 project creation script

## Status
This is a development architecture, not a claim of trained object-detection accuracy. A full detector still requires a trained/quantized CNN, convolution scheduling, DMA/BRAM integration, post-processing (for example NMS), and Vivado synthesis/timing/resource validation.
