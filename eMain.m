% 定义边界值  
% 顶部电势 top = 100V
% 地面电势 ground = 0V

top = 100;
ground = 0;
length_v = 100; % 垂直方向距离  100m
length_h = 100; % 水平方向距离  100m

% 格点数组，初始化背景值,
% 格点间距为0.5m  resolution
% 垂直格点数    v_sum
% 水平格点数    h_sum
resolution = 0.5;
v_sum = length_v / resolution + 1;
h_sum = length_h / resolution + 1;

for i = 1:v_sum
    for j = 1: h_sum
       A(i,j) = fix(top - (top - ground) / v_sum * (i-1));
    end
end
subplot(1,3,1);
image(A);


% 初始化突变电势（接地长方形建筑物）10m*50m,建筑物右边距离左边界20m
% % 初始化突变电势（接地长方形建筑物）15m*60m,建筑物右边距离左边界60m
[edge,A] = addGroundBuddings([[10,50,20];[15,60,60]],resolution,[v_sum,h_sum],A);

% 画图
subplot(1,3,2);
image(A);


%  计算加入突变之后的网格电势
A_last = A;
% 逼近值
appoach_V = 0.05;
% 记录执行了多少次
num_c = 1;  

while true

    for i = 1:v_sum
%         上下边界值恒定，上为100，下为0
        if i==1 | i == v_sum
            continue;
        end
        % 处理边界
        A(i,1) = A(i,2);
        A(i,h_sum) = A(i,h_sum-1);
    end

    A = e_f(A,edge);

%   判断 A 与 A_last 是否已经逼近
    disp(num_c);
    num_c = num_c + 1;
    if judge(A_last,A,appoach_V)
        break;
    end
    A_last = A;
end

subplot(1,3,3);
image(A);


