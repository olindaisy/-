function [edge,return_A] = addGroundBuddings(buddings,resolution,grid,A)
  %addGroundBuddings - ����ӵؽ�����   (���ν�����)  
  %   �����︲���������Ϊ  0V 
  % Syntax: bOutput = addGroundBuddings(input)
  % buddings:  [budding, budding1, budding2,...]
  % budding������һ�� �� ��������Ϣ --- [��ȣ��߶�,��ʼλ��]
  %             ��ȣ�  �������ά��  m
  %             �߶ȣ�  �������ά��  m
  %             ��ʼλ�ã� �������ұ߽���糡��߽�ľ���  m
  % resolution : ��������������ĳ���
  % grid:   ���̸���� V X H --- [��ֱV��ˮƽH]
  % A :  �����������
  % 
  % ����ֵ output  =  [edge,return_A]
  % edge �� ���ؽ�������߽�   [�ϣ��£�����]
  % return_A : ���ؼ���ͻ�佨����֮��������������  
  
  edge = [];
  [m,] = size(buddings);
  for x = 1:m
    budding = buddings(x,1:end);
    width = budding(1);
    height = budding(2);
    right = budding(3);
    v_sum = grid(1);
    h_sum = grid(2);

    % ����������G_width  ���߶� G_length
    % �����������ϱ߽�  top_edge
    % �����������ұ߽�  right_edge  
    G_width = width / resolution;
    G_length = height / resolution;
    top_edge = v_sum - G_length;

    % ���ߡ����벻��Ϊ0
    if width <=0 | height <= 0 | right <= 0 
      error('���ߡ����벻��Ϊ0');
    end

    right_edge = right / resolution + 1;
  
    % �����︲���������Ϊ  0V 
    for i = v_sum:-1:top_edge
        for j = right_edge:-1:right_edge-G_width
            A(i,j) = 0;
        end
    end
    left_edge = j;

    edge(end+1,:) = [top_edge,v_sum,left_edge,right_edge];
    % ���ؽ����ﷶΧ edge = [�ϣ��£�����]
    % edge = [top_edge,v_sum,left_edge,right_edge];
  end

  return_A = A;
end
  






% �ڶ����汾
% function [edge,return_A] = addGroundBuddings(budding,resolution,grid,A)
% %addGroundBuddings - ����ӵؽ�����   (���ν�����)  
% %   �����︲���������Ϊ  0V 
% % Syntax: bOutput = addGroundBuddings(input)
% % budding������һ�� �� ��������Ϣ --- [��ȣ��߶�,��ʼλ��]
% %             ��ȣ� �������ά�� m
% %             �߶ȣ� �������ά�� m
% %             ��ʼλ�ã� �������ұ߽���糡��߽�ľ���  m
% % resolution : ��������������ĳ���
% % grid:   ���̸���� V X H --- [��ֱV��ˮƽH]
% % A :  �����������
% % 
% % ����ֵ output  =  [edge,return_A]
% % edge �� ���ؽ�������߽�   [�ϣ��£�����]
% % return_A : ���ؼ���ͻ�佨����֮��������������  

%   width = budding(1);
%   height = budding(2);
%   right = budding(3);
%   v_sum = grid(1);
%   h_sum = grid(2);

%   % ����������G_width  ���߶� G_length
%   % �����������ϱ߽�  top_edge
%   % �����������ұ߽�  right_edge  
%   G_width = width / resolution;
%   G_length = height / resolution;
%   top_edge = v_sum - G_length;

%   % ���ߡ����벻��Ϊ0
%   if width <=0 | height <= 0 | right <= 0 
%     error('���ߡ����벻��Ϊ0');
%   end

%   right_edge = right / resolution + 1;

%   % �����︲���������Ϊ  0V 
%   for i = v_sum:-1:top_edge
%       for j = right_edge:-1:right_edge-G_width
%           A(i,j) = 0;
%       end
%   end
%   left_edge = j;

%   % ���ؽ����ﷶΧ edge = [�ϣ��£�����]
%   edge = [top_edge,v_sum,left_edge,right_edge];
%   return_A = A;
% end


% ��һ���汾

% % ��ʼ��ͻ����ƣ��ӵس����ν����10m*50m
% % �����������ϱ߽�  top_edge
% % �����������ұ߽�  right_edge  
% % ����������G_width  ���߶� G_length
% G_width = 10 / resolution;
% G_length = 50 / resolution;
% top_edge = v_sum - G_length;
% right_edge = 110;   

% for i = v_sum:-1:top_edge
%     for j = right_edge:-1:right_edge-G_width
%         A(i,j) = 0;
%     end
% end
% left_edge = j;
% % �����ﷶΧ edge = [�ϣ��£�����]
% edge = [top_edge,v_sum,left_edge,right_edge];