# ex2

## 第三问

1. 梯度下降法：

   这里使用的停止条件是cost的变化值小于1e-6，迭代一共进行了85次。

   每次迭代需要计算:

   1. $X*theta$

      1000\*210  210 \*1 : 1000\*210次乘法 999*210次加法

   2. $X' * (predictions - y)$

      210\*1000  1000\*1:   1000次减法 210\*1000次乘法 219*1000次加法

   3. $theta = theta - alpha * updates$

      210\*1 210\*1; 210次乘法 210次减法

85\*(1000\*210+999\*210+1000+210\*1000+219*1000+210\*1+210\*1)=72267850



2. Normal Equations:
```Matlab
L = chol(X' * X);
temp = forwardsub(L',X'*y);
theta = backwardsub(L,temp);
```





## (b)

```matlab
>> norm(theta_grad)
ans =
   82.9163565517039
>> norm(theta_normal)
ans =
   82.9165386448065

>> computeCostMulti(X, y, theta_grad)
ans =
   13.3213102758129
>> computeCostMulti(X, y, theta_normal)
ans =
   13.3213070317204

```
