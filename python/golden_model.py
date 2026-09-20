import numpy as np

def int8_matmul(a,w):
    return np.asarray(a,dtype=np.int8).astype(np.int32) @ np.asarray(w,dtype=np.int8).astype(np.int32)
def relu(x): return np.maximum(x,0)
def requantize(x,shift): return np.clip(np.asarray(x,dtype=np.int32)>>shift,-128,127).astype(np.int8)
if __name__=="__main__":
    a=np.array([[2,-3,4]],dtype=np.int8); w=np.array([[5],[-2],[3]],dtype=np.int8); y=int8_matmul(a,w); print("INT32:",y);print("ReLU:",relu(y));print("INT8:",requantize(y,2))
