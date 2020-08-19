% ����߽�ֵ  
% �������� top = 100V
% ������� ground = 0V

top = 100;
ground = 0;
length_v = 100; % ��ֱ�������
length_h = 100; % ˮƽ�������

% ������飬��ʼ������ֵ,
% �����Ϊ1m  resolution
% ��ֱ�����    v_sum
% ˮƽ�����    h_sum
resolution = 1;
v_sum = length_v / 1 + 1;
h_sum = length_h / 1 + 1;

for i = 1:v_sum
    for j = 1: h_sum
       A(i,j) = fix(top - (top - ground) / v_sum * (i-1));
    end
end

% ��ʼ��ͻ����ƣ��ӵس����ν����8m*15m
% �����������ϱ߽�  top_edge
% �����������ұ߽�  right_edge
top_edge = v_sum - 15;
right_edge = 80;

for i = v_sum:-1:top_edge
    for j = right_edge:-1:right_edge-8
        A(i,j) = 0;
    end
end
left_edge = j;
% �����ﷶΧ edge = [�ϣ��£�����]
edge = [top_edge,v_sum,left_edge,right_edge];

A_last = A;
% �ƽ�ֵ
appoach_V = 0.1;
num_c = 1;
while true

    for i = 1:v_sum
%         ���±߽�ֵ�㶨����Ϊ100����Ϊ0
        if i==1 | i == v_sum
            continue;
        end
        % ����߽�
        A(i,1) = A(i,2);
        A(i,h_sum) = A(i,h_sum-1);
    end
    A = e_f(A,edge);
%     �ж� A �� A_last �Ƿ��Ѿ��ƽ�
    disp(num_c);
    num_c = num_c + 1;
    if judge(A_last,A,appoach_V)
        break;
    end
    A_last = A;
end





