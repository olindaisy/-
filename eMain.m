% ����߽�ֵ  
% �������� top = 100V
% ������� ground = 0V

top = 100;
ground = 0;
length_v = 100; % ��ֱ�������  100m
length_h = 100; % ˮƽ�������  100m

% ������飬��ʼ������ֵ,
% �����Ϊ0.5m  resolution
% ��ֱ�����    v_sum
% ˮƽ�����    h_sum
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


% ��ʼ��ͻ����ƣ��ӵس����ν����10m*50m,�������ұ߾�����߽�20m
% % ��ʼ��ͻ����ƣ��ӵس����ν����15m*60m,�������ұ߾�����߽�60m
[edge,A] = addGroundBuddings([[10,50,20];[15,60,60]],resolution,[v_sum,h_sum],A);

% ��ͼ
subplot(1,3,2);
image(A);


%  �������ͻ��֮����������
A_last = A;
% �ƽ�ֵ
appoach_V = 0.05;
% ��¼ִ���˶��ٴ�
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

%   �ж� A �� A_last �Ƿ��Ѿ��ƽ�
    disp(num_c);
    num_c = num_c + 1;
    if judge(A_last,A,appoach_V)
        break;
    end
    A_last = A;
end

subplot(1,3,3);
image(A);


