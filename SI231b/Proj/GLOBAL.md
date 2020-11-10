# GLOBAL REGISTRATION OF MULTIPLE POINT CLOUDS USING SEMIDEFINITE PROGRAMMING

In this paper, we demonstrate how the least-squares formulation can be relaxed into a convex program, namely, a semidefinite program (SDP). By setting up connections between the uniqueness of this SDP and results from rigidity theory, we prove conditions for exact and stable recovery for the SDP relaxation. In particular, we prove that the SDP relaxation can guarantee recovery under more adversarial conditions compared to earlier proposed spectral relaxations, and we derive error bounds for the registration error incurred by the SDP relaxation.

在本文中，我们证明了最小二乘法公式如何可以放宽为一个凸规划，即半正定规划（SDP）。通过建立该SDP的唯一性与刚性理论的结果之间的联系，我们证明了SDP松弛的精确和稳定恢复的条件。特别是，我们证明了与早期提出的频谱松弛相比，SDP松弛可以保证在更多对抗性条件下的恢复，我们还推导了SDP松弛所产生的匹配误差的误差界限。

The registration problem in question is one of determining the coordinates of a point cloud P from the knowledge of (possibly noisy) coordinates of smaller point cloud subsets (called patches) P1 , . . . , PM that are derived from P through some general transformation. In certain applications , one is often interested in finding the optimal transforms (one for each patch) that consistently align P1, . . . , PM . This can be seen as a subproblem in the determination of the coordinates of P.

所述的注册问题是根据较小的点云子集(称为补丁)P1 , ... ..., PM的坐标知识(可能有噪声)来确定点云P的坐标，这些点云子集是通过某种一般变换从P中导出的。.PM，这些子集是通过某种一般变换从P中导出的。在某些应用中，人们通常对寻找最佳变换（每个补丁的一个）感兴趣，这些变换能够一致地对齐P1，......，PM。, PM . 这可以看作是确定P的坐标的一个子问题。

The problem of multipatch registration is intrinsically nonconvex since one is required to optimize over the nonconvex domain of orthogonal transforms. Different ideas from the optimization literature have been deployed to attack this problem, including Lagrangian optimization and projection methods. In the Lagrangian setup, the orthogonality constraints are incorporated into the objective; in the projection method, the constraints are forced after every step of the optimization [49]. Following the observation that the registration problem can be viewed as an optimization on the Grassmanian and Stiefel manifolds, researchers have proposed algorithms using ideas from the theory and practice of manifold optimization [40]. A detailed review of these methods is beyond the scope of this paper, and instead we refer the interested reader to these excellent reviews [18, 1]. Manifold-based methods are, however, local in nature and are not guaranteed to find the global minimizer. Moreover, it is rather difficult to certify the noise stability of such methods.

由于需要在正交变换的非凸域上进行优化，因此多配位注册问题本质上是非凸的。从优化文献中已经部署了不同的想法来攻击这个问题，包括拉格朗日优化和投影方法。在拉格朗日设置中，正交约束被纳入目标中；在投影法中，约束在优化的每一步后被强制执行[49]。在观察到注册问题可以看作是Grassmanian和Stiefel分形上的优化之后，研究者们利用分形优化理论和实践的思想提出了一些算法[40]。对这些方法的详细评述超出了本文的范围，相反，我们把感兴趣的读者推荐给这些优秀的评论[18，1]。然而，基于歧管的方法是局部的，不能保证找到全局最小化器。此外，要证明这种方法的噪声稳定性相当困难。

where Cij ∈ Rd×d(1 ≤ i,j ≤ M) are the (i,j)th subblocks of some positive semidefinite block matrix C of size Md×Md. Given the solution of (1.7), the desired global coordinates can simply be obtained by solving a linear system. It is virtually impossible to find the global optimum of (1.7) for large-scale problems (M ≫ 1), since this involves the optimization of a quadratic cost on a huge nonconvex parameter space. In fact, the simplest case d = 1 with C as the Laplacian matrix corresponds to the MAX-CUT problem, which is known to be NP-hard. The main observation of this paper is that (1.7) can instead be relaxed into a convex program, namely, a semidefinite program (SDP), whose global optimum can be approximated to any finite precision in polynomial time using standard off-the-shelf solvers. This yields a tractable method for global registration described in Algorithm 2. The corresponding algorithm, derived from the spectral relaxation of (1.7) that was already considered in [40], is described in Algorithm 1 for reference.

给定(1.7)的解，通过求解一个线性系统就可以简单地得到所需的全局坐标。对于大规模问题(M≫1)，要找到(1.7)的全局最优值几乎是不可能的，因为这涉及到在一个巨大的非凸参数空间上进行二次成本的优化。事实上，最简单的情况d＝1，C为Laplacian矩阵，对应的是MAX-CUT问题，众所周知，该问题是NP-hard的。本文的主要观点是，(1.7)可以被放宽为一个凸程序，即半正定程序(SDP)，其全局最优值可以使用标准的现成求解器在多项式时间内逼近到任何有限精度。这就产生了算法2中描述的全局匹配的可操作方法。相应的算法是由[40]中已经考虑过的(1.7)的频谱松弛推导出来的，在算法1中进行了描述，供参考。



我们提出了使用算法2进行精确恢复的（1.7）中的系数矩阵C的条件。特别是，我们表明，关于算法2的精确恢复问题可以映射成刚性理论问题，这些问题已经在[68，25]中进行了早期研究2。本节的对比是在(1.7)中的C矩阵和这些论文中考虑的各种刚性概念之间建立的联系。我们还提出了一个高效的C的随机化秩检验，它可以用来证明精确的恢复。



我们在这里的主要结果是定理5.2，该定理指出，如果C满足一个特定的等级条件，那么算法2的注册误差在噪声水平的恒定系数之内。据我们所知，目前还没有任何现有的多派别注册算法具有类似的稳定性保证。



我们提出了模拟数据的数值结果，对算法1和算法2的精确恢复和噪声稳定性进行了数值验证。我们的主要经验发现如下。
(1)在重建质量方面，半定义松弛的表现明显优于基于谱和显式的优化(比如说，以谱解作为初始化)(参见图7中的第一张图)。
(2)在一定的噪声水平下，我们实际上能够使用半定义松弛来解决原非凸问题(参见图7中的第二张图)。





我们介绍了

1. 引言中描述的最小二乘匹配问题的半定义松弛。作为参考，我们还介绍了已经在[40，68，25]中考虑过的密切相关的光谱松弛。
2. 第3节讨论了精确恢复问题，
3. 第4节进行了随机测试。
4. 第5节介绍了光谱松弛和半定义松弛的稳定性分析。
5. 数值模拟可以在第6节中找到，
6. 第7节中对某些未决问题进行了讨论。









这篇论文提出了一个新的无监督室内场景下的深度估计网络P2Net，其创新点在于提出了两种新式无监督损失函数，论文发表在ECCV2020上。

传统的无监督损失函数是以像素点为单位的图像重构损失，以及边缘敏感的梯度平滑损失。作者发现只在每个像素点处计算图像重构损失得到的特征表示并不够鲁棒，由此提出采用基于图像块表示的重构损失。具体地，采用已有的特征描述子算法DSO提取特征关键点，以关键点为中心构建局部窗口，计算整个窗口内的重构损失更具有鲁棒性。另外，考虑到无监督训练时的崩塌来源于室内场景下的无纹理区域，作者认为无纹理区域可以看做是一个平面，通过对图像提取超像素点从而构造平面区域，在同一平面上的像素点的深度信息应当具有一致性，由此提出平面一致性损失。

作者提出的P2Net在NYU Depth V2和ScanNet两个公开数据集上取得了SOTA的效果。



作者：雷锋网
链接：https://zhuanlan.zhihu.com/p/193106689
来源：知乎
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。