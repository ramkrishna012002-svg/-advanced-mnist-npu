# Dataflow

1. Input pixels/features are quantized to signed INT8.
2. Activations are supplied from the input side of the systolic array.
3. Weights enter from the top side.
4. Each PE multiplies INT8 activation and INT8 weight.
5. The product is accumulated in INT32.
6. Layer output can be followed by bias addition.
7. ReLU removes negative activations.
8. Requantization converts INT32 back to INT8.
9. Pooling and detection logic operate on quantized feature maps.

The Python golden model is the numerical reference for RTL verification.
