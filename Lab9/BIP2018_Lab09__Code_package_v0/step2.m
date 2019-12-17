function A = step2(S, k)
% step2: convert the feature matrix to a clustered/segmented feature matrix
% do here
% - the k-means clustering itself with the built-in matlab function
% - replace the elements of the feature matrix with the centroid values, on
%   the basis of the cluster indices
    [LUT, M] = kmeans(S,k);  %Obtention of the Look up vector vector and the centroids matrix
    
    [m, n] = size(S);  %Size of the input matrix
    
    A = zeros(m,n);  %So that the output matrix has the same size as the input matrix
    
    for i = 1:k  %For every cluster
        LUT_ind = LUT == i;  %Logical indexing of the LUT vector
        A = A + LUT_ind .* M(i,:);  %Construction of the output matrix depending on the logically indexed 
                                    %LUT vector and its corresponding rows of the centroids matrix
    end
    
end
