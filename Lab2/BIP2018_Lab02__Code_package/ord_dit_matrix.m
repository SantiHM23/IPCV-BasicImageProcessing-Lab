function D = ord_dit_matrix(n)
    D = [0]; %Original 0 matrix
    for i=1:n %Number of times it runs for each iteration
        D = [D*4 D*4+2; D*4+3 D*4+1]; %Recursive rule
    end
    D = D*0.25^n; %Normalization factor for each iteration
end