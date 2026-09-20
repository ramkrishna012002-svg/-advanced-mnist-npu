import numpy as np
from pathlib import Path

rng = np.random.default_rng(7)

a = rng.integers(-8, 9, size=(8, 8), dtype=np.int8)
w = rng.integers(-8, 9, size=(8, 8), dtype=np.int8)

golden = a.astype(np.int32) @ w.astype(np.int32)

out = Path("test_vectors")
out.mkdir(exist_ok=True)

np.savetxt(out / "input_8x8.txt", a, fmt="%d")
np.savetxt(out / "weight_8x8.txt", w, fmt="%d")
np.savetxt(out / "golden_8x8.txt", golden, fmt="%d")

print("Generated:")
print(out / "input_8x8.txt")
print(out / "weight_8x8.txt")
print(out / "golden_8x8.txt")
