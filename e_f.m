
function  A_v = e_f(A, edge)
  
    [v_sum,h_sum] = size(A);
    top = edge(1);
    bottom = edge(2);
    left = edge(3);
    right = edge(4);
    % 格点上下左右四点
    t = 0;b = 0;r = 0;l = 0;
    for i = v_sum:-1:1
        for j = h_sum:-1:1
            % 越过上下边界
            if (i == 1 | i == v_sum)
                break;
            % 越过左右边界
            elseif (j==1 | j == h_sum)
                continue;
            end

            % 越过突变边界
            if i >= top & i <= bottom & j >= left & j <= right
                continue;
            end
            
            t = A(i-1,j);
            b = A(i+1,j);
            r = A(i,j+1);
            l = A(i,j-1);
            A(i,j) = (t+b+r+l) / 4;

        end
    end
    A_v = A;
end

