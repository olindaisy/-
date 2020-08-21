function A_v = e_f(A, edge)

    [v_sum, h_sum] = size(A);
    [m, n] = size(edge);

    % 格点上下左右四点电势值
    t = 0; b = 0; r = 0; l = 0;

    flag = false;

    for i = v_sum:-1:1

        for j = h_sum:-1:1
            % 越过上下边界
            if (i == 1 | i == v_sum)
                break;
                % 越过左右边界
            elseif (j == 1 | j == h_sum)
                continue;
            end

        
            % 越过突变边界
            for x = 1:m
                temp_edge = edge(x,1:end);
                top = temp_edge(1);
                bottom = temp_edge(2);
                left = temp_edge(3);
                right = temp_edge(4);
               
                if i >= top & i <= bottom & j >= left & j <= right
                    flag = true;
                    break;
                end
            end
            
            if flag
                flag = false;
                continue;
            end

            t = A(i - 1, j);
            b = A(i + 1, j);
            r = A(i, j + 1);
            l = A(i, j - 1);
            A(i, j) = (t + b + r + l) / 4;

        end

    end

    A_v = A;
end
