%% 注意：这个只是一个样例代码，实际的插值方法得具体来编写
%% 我们常用三次样条插值

% 分段三次埃尔米特插值
% 函数为 sin x
x = -pi:pi; y = sin(x);
new_x = -pi:0.1:pi;
p = pchip(x,y,new_x); % 主要插值代码
figure(1); % 在同一个脚本文件里面，要想画多个图，需要给每个图编号
plot(x, y, 'o', new_x, p, 'r-')


% plot函数用法:
% plot(x1,y1,x2,y2) 
% 线方式： - 实线 :点线 -. 虚点线 - - 波折线 
% 点方式： . 圆点  +加号  * 星号  x x形  o 小圆
% 颜色： y黄； r红； g绿； b蓝； w白； k黑； m紫； c青


% 三次样条插值和分段三次埃尔米特插值的对比
x = -pi:pi; 
y = sin(x); 
new_x = -pi:0.1:pi;
p1 = pchip(x,y,new_x);   %分段三次埃尔米特插值
p2 = spline(x,y,new_x);  % 三次样条插值
figure(2);
plot(x,y,'o',new_x,p1,'r-',new_x,p2,'b-')
legend('样本点','三次埃尔米特插值','三次样条插值','Location','SouthEast')   %标注显示在东南方向