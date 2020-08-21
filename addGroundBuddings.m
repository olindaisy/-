function [edge,return_A] = addGroundBuddings(buddings,resolution,grid,A)
  %addGroundBuddings - 加入接地建筑物   (方形建筑物)  
  %   建筑物覆盖区域电势为  0V 
  % Syntax: bOutput = addGroundBuddings(input)
  % buddings:  [budding, budding1, budding2,...]
  % budding（参数一） ： 建筑物信息 --- [宽度，高度,起始位置]
  %             宽度：  建筑物二维宽  m
  %             高度：  建筑物二维高  m
  %             起始位置： 建筑物右边界与电场左边界的距离  m
  % resolution : 单个网格距离代表的长度
  % grid:   格盘格点数 V X H --- [垂直V，水平H]
  % A :  网格电势数组
  % 
  % 返回值 output  =  [edge,return_A]
  % edge ： 返回建筑物格点边界   [上，下，左，右]
  % return_A : 返回加入突变建筑物之后的网格电势数组  
  
  edge = [];
  [m,] = size(buddings);
  for x = 1:m
    budding = buddings(x,1:end);
    width = budding(1);
    height = budding(2);
    right = budding(3);
    v_sum = grid(1);
    h_sum = grid(2);

    % 建筑物格点宽度G_width  格点高度 G_length
    % 建筑物坐标上边界  top_edge
    % 建筑物坐标右边界  right_edge  
    G_width = width / resolution;
    G_length = height / resolution;
    top_edge = v_sum - G_length;

    % 宽、高、距离不能为0
    if width <=0 | height <= 0 | right <= 0 
      error('宽、高、距离不能为0');
    end

    right_edge = right / resolution + 1;
  
    % 建筑物覆盖区域电势为  0V 
    for i = v_sum:-1:top_edge
        for j = right_edge:-1:right_edge-G_width
            A(i,j) = 0;
        end
    end
    left_edge = j;

    edge(end+1,:) = [top_edge,v_sum,left_edge,right_edge];
    % 返回建筑物范围 edge = [上，下，左，右]
    % edge = [top_edge,v_sum,left_edge,right_edge];
  end

  return_A = A;
end
  






% 第二个版本
% function [edge,return_A] = addGroundBuddings(budding,resolution,grid,A)
% %addGroundBuddings - 加入接地建筑物   (方形建筑物)  
% %   建筑物覆盖区域电势为  0V 
% % Syntax: bOutput = addGroundBuddings(input)
% % budding（参数一） ： 建筑物信息 --- [宽度，高度,起始位置]
% %             宽度： 建筑物二维宽 m
% %             高度： 建筑物二维高 m
% %             起始位置： 建筑物右边界与电场左边界的距离  m
% % resolution : 单个网格距离代表的长度
% % grid:   格盘格点数 V X H --- [垂直V，水平H]
% % A :  网格电势数组
% % 
% % 返回值 output  =  [edge,return_A]
% % edge ： 返回建筑物格点边界   [上，下，左，右]
% % return_A : 返回加入突变建筑物之后的网格电势数组  

%   width = budding(1);
%   height = budding(2);
%   right = budding(3);
%   v_sum = grid(1);
%   h_sum = grid(2);

%   % 建筑物格点宽度G_width  格点高度 G_length
%   % 建筑物坐标上边界  top_edge
%   % 建筑物坐标右边界  right_edge  
%   G_width = width / resolution;
%   G_length = height / resolution;
%   top_edge = v_sum - G_length;

%   % 宽、高、距离不能为0
%   if width <=0 | height <= 0 | right <= 0 
%     error('宽、高、距离不能为0');
%   end

%   right_edge = right / resolution + 1;

%   % 建筑物覆盖区域电势为  0V 
%   for i = v_sum:-1:top_edge
%       for j = right_edge:-1:right_edge-G_width
%           A(i,j) = 0;
%       end
%   end
%   left_edge = j;

%   % 返回建筑物范围 edge = [上，下，左，右]
%   edge = [top_edge,v_sum,left_edge,right_edge];
%   return_A = A;
% end


% 第一个版本

% % 初始化突变电势（接地长方形建筑物）10m*50m
% % 建筑物坐标上边界  top_edge
% % 建筑物坐标右边界  right_edge  
% % 建筑物格点宽度G_width  格点高度 G_length
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
% % 建筑物范围 edge = [上，下，左，右]
% edge = [top_edge,v_sum,left_edge,right_edge];