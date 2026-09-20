import numpy as np
def quantize_symmetric(x):
    x=np.asarray(x,dtype=np.float32); scale=max(np.max(np.abs(x))/127.0,1e-12); q=np.clip(np.round(x/scale),-128,127).astype(np.int8); return q,scale
if __name__=="__main__":
    q,s=quantize_symmetric(np.array([-1.2,-.4,0,.7,1.1]));print("scale =",s);print("INT8 =",q)
