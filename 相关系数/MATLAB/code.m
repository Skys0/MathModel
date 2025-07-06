%% 例子
clear;clc
load example.mat

minn = min(Test);  % 每一列的最小值
maxn = max(Test);   % 每一列的最大值
mean = mean(Test);  % 每一列的均值
medium = median(Test);  %每一列的中位数
skewness = skewness(Test); %每一列的偏度
kurtosis = kurtosis(Test);  %每一列的峰度
Std = std(Test);  % 每一列的标准差
RESULT = [minn;maxn;mean;medium;skewness;kurtosis;Std];

%% 计算各列之间的相关系数:Pearson相关系数
% 在计算Pearson相关系数之前,一定要用 SPSS来做出散点图来观察两组变量之间是否有线性关系
[R,P] = corrcoef(Test);

P < 0.01  % 标记3颗星的位置
(P < 0.05) .* (P > 0.01)  % 标记2颗星的位置
(P < 0.1) .* (P > 0.05) % % 标记1颗星的位置