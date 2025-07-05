% 输入方阵保证必须是n乘n
A = input("输入判断矩阵：");
[r, c] = size(A);

if r ~= c
    disp("输入的不是方阵");
end
n = r;

[V, D] = eig(A);
maxEig = max(max(D));

RI = [0 0.001 0.52 0.89 1.12 1.26 1.36 1.41 1.46 1.49 1.52];
% 注意这里的第二项必须是 0.01，一个接近 0 的数
CI = (maxEig - n) / (n - 1);
CR = CI / RI(n);
if CR < 0.1
    disp("输入的判断矩阵一致性可以接受");
else
    disp("输入的判断矩阵一致性不能接受，需要重新修改");
    disp(CR);
end
 
%  算术平均法权重
SumA = sum(A);
SumA = repmat(SumA, n, 1);
StandA = A ./ SumA;

disp("算术平均法的权重为：");
disp(sum(StandA, 2) ./ n);

% 几何平均法求权重
ProductA = prod(A, 2);
ProductA = ProductA .^ (1/n);

disp("几何平均数的权重为：");
disp(ProductA ./ sum(ProductA));

% 特征值求权重
[r, c] = find(D == maxEig, 1);

disp("特征值求权重为：");
disp(V(:,c) ./ sum(V(:,c)) );