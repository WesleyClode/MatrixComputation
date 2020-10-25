# Numpy计算范数
numpy包里的linalg模块，是专门处理基本线性代数问题的模块。借助该模块中的norm()函数可以轻松计算向量与矩阵的范数。

norm函数说明如下所示：

```python
def norm(x, ord=None, axis=None, keepdims=False):
    Matrix or vector norm.

    This function is able to return one of eight different matrix norms,
    or one of an infinite number of vector norms (described below), depending
    on the value of the ``ord`` parameter.

    The following norms can be calculated:

    =====  ============================  ==========================
    ord    norm for matrices             norm for vectors
    =====  ============================  ==========================
    None   Frobenius norm                2-norm
    'fro'  Frobenius norm                --
    'nuc'  nuclear norm                  --
    inf    max(sum(abs(x), axis=1))      max(abs(x))
    -inf   min(sum(abs(x), axis=1))      min(abs(x))
    0      --                            sum(x != 0)
    1      max(sum(abs(x), axis=0))      as below
    -1     min(sum(abs(x), axis=0))      as below
    2      2-norm (largest sing. value)  as below
    -2     smallest singular value       as below
    other  --                            sum(abs(x)**ord)**(1./ord)
    =====  ============================  ==========================
```

```python
import numpy as np
import numpy.linalg as LA

def compute_norm():
    mat = np.matrix([[1,2],[3,4]])
    inv_mat = np.linalg.inv(mat)
    print inv_mat

def vector_norm():
    a = np.arange(9) - 4
    print a
    print LA.norm(a,np.inf) #无穷范数
    print LA.norm(a,-np.inf)
    print LA.norm(a,1) #1范数
    print LA.norm(a,2) #2范数

def matrix_norm():
    a = np.arange(9) - 4
    b = a.reshape(3,3)
    b_t = np.transpose(b)
    b_new = np.dot(b_t,b) #b_new矩阵为b^t * b
    x = np.linalg.eigvals(b_new) #求b_new矩阵的特征值
    print x
    print LA.norm(b,1) #列范数
    print LA.norm(b,2) #谱范数,为x里最大值开平方
    print LA.norm(b,np.inf) #无穷范数，行范数
    print LA.norm(b,"fro") #F范数

vector_norm()
print 
matrix_norm()

# 向量范数
[-4 -3 -2 -1  0  1  2  3  4]
4.0
0.0
20.0
7.74596669241

#矩阵范数
[[-4 -3 -2]
 [-1  0  1]
 [ 2  3  4]]
[  5.40000000e+01   6.00000000e+00   5.99792822e-16]
7.0
7.34846922835
9.0
7.74596669241
```