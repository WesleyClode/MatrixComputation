# Tensor

## Motivation

图像/深度学习模型/TPU/通信

## Tensor basics
- 表示法
  - 立体法
  - 展开法
- Terminology
  - Outer-product
  - Inner- product
  - Matricization
    - Unfold a N-way tensor into a matrix 把一些friber按照一些顺序排一下子
    - 从左到右，从前到后
  - Multiplication
    - 中间的一个维度需要对上，维度代替
  - Imporant matrix products
    - Kronecker product
    - Khatri-Rao product
    - Hadamard product
- Tensor Decomposition and ranks
  - CP decomposition
    - CP分解是将一个高维的张量，分解成多个核的和，每个核是由向量的外积组成；通过这样的分解，我们可以大大地降低参数的维度。
    - format
    - Alternating LS
    - Uniqueness property
  - Tucker decomposition
     - format
    - Alternating LS

