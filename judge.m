function output = judge(A_last, A, approach)
  %myFun - 判断二者是否已逼近
  %
  % Syntax: output = myFun(input)
  %
  % Long description
  [v_sum,h_sum] = size(A_last);
  max_approach = 0;
    for i = 1: v_sum
      for j = 1: h_sum
        temp_m = abs(A_last(i,j) - A(i,j));
        if temp_m > max_approach
          max_approach = temp_m;
        end 
      end
    end    
    if max_approach <= approach
       output = true ;
    else 
      output = false;

    end
end
