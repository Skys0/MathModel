import numpy as np
from numpy import linalg as LA

mat = []
n = int(input("请输入判断矩阵的维度："))

print("请输入矩阵：")
for i in range(n):
    tmp = input().split(" ")
    tmp = [float(x) for x in tmp]
    mat.append(tmp)

A = np.array(mat)
# 打表出来RI的值
RI = [0, 0.001, 0.52, 0.89, 1.12, 1.26, 1.36, 1.41, 1.46, 1.49, 1.52]
V, D = LA.eig(A)
# 找到最大特征值
MaxEig = np.max(D)

CI = (MaxEig - n) / (n - 1)
CR = CI / RI[n]
if CR < 0.1:
    print("输入的判断矩阵一致性可以接受")
else:
    print("输入的判断矩阵一致性不能接受，需要重新修改")

# 算术平均法求权重
sumA = np.array([np.sum(A, axis=0)])
sumA = np.tile(sumA, (n, 1))

# 将求出的矩阵归一化处理
StandA = A / sumA
# 归一化的矩阵按照列相加，并且每个元素除以 n 得到权重
print("算术平均法求权重：", np.sum(StandA, axis = 1) / n)

# 几何平均法求权重
# 将 A 的元素按照行相乘得到一个新的列向量
ProductA = A.prod(axis = 1)
# 将新的向量的每个分量开 n 次方
ProductA = ProductA ** (1/n)

print("几何平均法求权重:", ProductA / np.sum(ProductA))

# 特征值法求权重
MaxIndex = np.argmax(V)
MaxEiv = D[:,MaxIndex]

StandEiv = MaxEiv / MaxEiv.sum()
print("特征值法求权重", StandEiv)