function M = step3_update(S, k, LUT, M)
    
    for j = 1:k
        LUTj = LUT == j;  %Logical indexing of the LUT vector depending on the current cluster
        Sj = S(LUTj',:);  %Selection of the rows of the input matrix that correspond to the current cluster
        M(j,:) = mean(Sj,1);  %The mean vector matrix is filled with the mean of the corresponding valid values
    end
    
end
