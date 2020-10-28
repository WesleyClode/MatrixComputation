# QR 
## Square matrix
Any real square matrix $A$ may be decomposed as
$$
A=Q R
$$
where $Q$ is an orthogonal matrix (its columns are orthogonal unit vectors meaning $\left.Q^{\top} Q=Q Q^{\top}=I\right)$ and $R$ is an upper triangular matrix (also called right triangular matrix, hence the name). If $A$ is invertible, then the factorization is unique if we require the diagonal elements of $R$ to be positive.
If instead $A$ is a complex square matrix, then there is a decomposition $A=Q R$ where $Q$ is a unitary matrix $\left(\right.$ so $\left.Q^{*} Q=Q Q^{*}=I\right)$.
If $A$ has $n$ linearly independent columns, then the first $n$ columns of $Q$ form an orthonormal basis for the column space of $A$. More generally, the first $k$ columns of $Q$ form an orthonormal basis for the span of the first $k$ columns of $A$ for any $1 \leqslant k \leqslant n .^{[1]}$ The fact that any column $k$ of $A$ only depends on the first $k$ columns of $Q$ is responsible for the triangular form of $R .^{[1]}$

## Rectangular matrix 

 More generally, we can factor a complex $m \times n$ matrix $A$, with $m \geqslant n$, as the product of an $m \times m$ unitary matrix $Q$ and an $m \times n$ upper triangular matrix $R$. As the bottom $(m-n)$ rows of an $m \times n$ upper triangular matrix consist entirely of zeroes, it is often useful to partition $R,$ or both $R$ and $Q$.
$$
A=Q R=Q\left[\begin{array}{c}
R_{1} \\
0
\end{array}\right]=\left[Q_{1}, Q_{2}\right]\left[\begin{array}{c}
R_{1} \\
0
\end{array}\right]=Q_{1} R_{1}
$$
where $R_{1}$ is an $n \times n$ upper triangular matrix, $O$ is an $(m-n) \times n$ zero matrix, $Q_{1}$ is $m \times n, Q_{2}$ is $m \times(m-n),$ and $Q_{1}$ and $Q_{2}$ both have orthogonal columns. Golub $\&$ Van Loan $(1996, \$ 5.2)$ call $Q_{1} R_{1}$ the thin QR factorization of $A ;$ Trefethen and Bau call this the reduced QR factorization. $^{[1]}$ If $A$ is of full rank $n$ and we require that the diagonal elements of $R_{1}$ are positive then $R_{1}$ and $Q_{1}$ are unique, but in general $Q_{2}$ is not. $R_{1}$ is then equal to the upper triangular factor of the Cholesky decomposition of $A^{\star} A\left(=A^{\top} A\right.$ if $A$ is real).
QL, RQ and LQ decompositions [edit ]
Analogously, we can define $\mathrm{QL}, \mathrm{RQ},$ and LQ decompositions, with $\angle$ being a lower triangular matrix.