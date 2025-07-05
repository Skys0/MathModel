clear;clc
load example.mat
% 导入.mat文件
% （1）在工作区右键，点击新建（Ctrl+N)，输入变量名称为X
% （2）在Excel中复制数据，再回到Excel中右键，点击粘贴Excel数据（Ctrl+Shift+V）
% （3）关掉这个窗口，点击X变量，右键另存为，保存为mat文件（下次就不用复制粘贴了，只需使用load命令即可加载数据）
% （4）注意，代码和数据要放在同一个目录下哦，且Matlab的当前文件夹也要是这个目录

% 第一步先
[n,m] = size(X);
disp(['一共有' num2str(n) '个评价对象, ' num2str(m) '个评价指标']);
Pos = input('请输入需要正向化处理的指标所在的列，例如第2、3、6三列需要处理，那么你需要输入[2,3,6]：');
disp('请输入需要处理的这些列的指标类型（1：极小型， 2：中间型， 3：区间型） ');
Type = input('例如：第2列是极小型，第3列是区间型，第6列是中间型，就输入[1,3,2]');
for i = 1 : size(Pos,2)
        X(:,Pos(i)) = Positivization(X(:,Pos(i)),Type(i),Pos(i));
end

disp('正向化后的矩阵 X =  ')
disp(X)

Z = X ./ repmat(sum(X.*X) .^ 0.5, n, 1);
disp('标准化矩阵 Z = ')
disp(Z)

DP = sum([(Z - repmat(max(Z),n,1)) .^ 2 ],2) .^ 0.5;   % D+ 与最大值的距离向量
DN = sum([(Z - repmat(min(Z),n,1)) .^ 2 ],2) .^ 0.5;   % D- 与最小值的距离向量
St = DN ./ (DP+DN);    
disp('最后的得分为：')
standSt = St / sum(St)
[sorted_S,index] = sort(standSt ,'descend')