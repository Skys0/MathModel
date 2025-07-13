import pandas as pd
import numpy as np
import matplotlib.pyplot as plt


data = pd.read_excel('example.xlsx')
# 支持显示中文
plt.rcParams['font.family'] = ['sans-serif']
plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False

dsc = data.describe()   # dsc 是 data 的一些统计信息

# 画出各种变量之间的散点图，大概评估一些是否线性
pd.plotting.scatter_matrix(data, figsize=(20, 10), alpha=0.75)
plt.show()
cor = data.corr()   # 生成 pearson 相关系数矩阵
print(cor)
