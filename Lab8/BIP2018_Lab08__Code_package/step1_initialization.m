function [LUT, M] = step1_initialization(S, k)
    
    [m, n] = size(S); %Size of the input matrix
    LUT = zeros(1,m);  %Size we desire for the LUT matrix
    M = zeros(k,n);  %Size desired for the mean vectors matrix
    
    a = floor(m/k);  %Number of mean vectors we will store in the M matrix
    b = 1;  %Help variable that denotes the row of the M matrix
    
    for x = 1:a:(m-1) %With m, in the case of k=2 it would return three rows instead of two
        M(b,:) = S(x,:);  %Construction of the mean vectors matrix
        b = b+1;  %In every iteration, we move to the following row of the M matrix
    end
      
end
