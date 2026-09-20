import numpy as np
rng=np.random.default_rng(1);a=rng.integers(-8,9,size=(8,8),dtype=np.int8);w=rng.integers(-8,9,size=(8,8),dtype=np.int8);y=a.astype(np.int32)@w.astype(np.int32);np.savetxt("input_8x8.txt",a,fmt="%d");np.savetxt("weight_8x8.txt",w,fmt="%d");np.savetxt("golden_8x8.txt",y,fmt="%d");print("Generated test vectors.")
