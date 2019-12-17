function [BGR] = swap_RB_dump(RGB)
BGR = size(RGB);
[m, n, k] = size(RGB);
  for i = 0:m
      for j = 0:n
          BGR(i,j,3)=RGB(i,j,1);
          BGR(i,j,1)=RGB(i,j,3);
         
      end
  end
end