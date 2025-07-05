%% 注意：这只是一个样例代码，load 的数据只是样例，里面包含 x，y 已知值
%% 这里只包含了线性拟合，其他的得具体情况具体分析
%% 可以使用曲线拟合器，更加方便
clear;clc
load  data1

plot(x,y,'o')
xlabel('x的值')
ylabel('y的值')
n = size(x,1);

% 拟合 y = kx + b 直线的最小二乘法
k = (n*sum(x.*y)-sum(x)*sum(y))/(n*sum(x.*x)-sum(x)*sum(x))
b = (sum(x.*x)*sum(y)-sum(x)*sum(x.*y))/(n*sum(x.*x)-sum(x)*sum(x))

hold on
grid on

f=@(x) k*x+b;
fplot(f,[2.5,7]);
% 画出函数
legend('样本数据','拟合函数','location','SouthEast')

Yhat = k*x+b; % y的拟合值
SSR = sum((Yhat - mean(y)).^2)  % 回归平方和
SSE = sum((Yhat- y).^2) % 误差平方和
SST = sum((y - mean(y)).^2) % 总体平方和
SST = SSE - SSR   % 5.6843e-14  =   5.6843*10^-14   matlab浮点数计算的一个误差
R_2 = SSR / SST