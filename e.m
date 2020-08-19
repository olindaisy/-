% 定义边界值  
% 顶部电势 top = 100V
% 地面电势 ground = 0V

top = 100;
ground = 0;
length_v = 100; % 垂直方向距离
length_h = 100; % 水平方向距离

% 格点数组，初始化背景值,
% 格点间距为1m  resolution
% 垂直格点数    v_sum
% 水平格点数    h_sum
resolution = 1;
v_sum = length_v / 1 + 1;
h_sum = length_h / 1 + 1;

for i = 1:v_sum
    for j = 1: h_sum
       A(i,j) = fix(top - (top - ground) / v_sum * (i-1));
    end
end

% 初始化突变电势（接地长方形建筑物）8m*15m
% 建筑物坐标上边界  top_edge
% 建筑物坐标右边界  right_edge
top_edge = v_sum - 15;
right_edge = 80;

for i = v_sum:-1:top_edge
    for j = right_edge:-1:right_edge-8
        A(i,j) = 0;
    end
end
left_edge = j;
% 建筑物范围 edge = [上，下，左，右]
edge = [top_edge,v_sum,left_edge,right_edge];

A_last = A;
% 逼近值
appoach_V = 0.1;
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
%     判断 A 与 A_last 是否已经逼近
    disp(num_c);
    num_c = num_c + 1;
    if judge(A_last,A,appoach_V)
        break;
    end
    A_last = A;
end





