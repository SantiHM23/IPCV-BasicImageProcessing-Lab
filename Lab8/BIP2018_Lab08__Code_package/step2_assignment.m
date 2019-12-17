function LUT = step2_assignment(S, k, LUT, M)
    
   [m, ~] = size(S);  %So that we get the number of rows of the input matrix
   
   for i = 1:m  
       D = zeros(1,k);  %Help matrix with as many columns as clusters
       for j = 1:k
           D(1,j) = sum((S(i,:)-M(j,:)).^2);  %We store every distance in the help matrix
       end
       [~, argmin] = min(D(:));  %So that we get the position of the minimum value of the help matrix
       LUT(1,i) = argmin;  %The obtained position is assigned to the corresponding LUT parameter
   end

end
