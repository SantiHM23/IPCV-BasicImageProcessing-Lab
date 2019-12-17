function [r_vect, t_vect] = non_max_sup(A, k, s)

    [m, n] = size(A);  %Size of the input matrix
    
    r_vect = zeros(k,1);  %Empty vertical radius vector
    t_vect = zeros(k,1);  %Empty vertical angle vector
    
    for p = 1:k  %Each iteration searchs for one maximal value
        [~, ind] = max(A(:));  %Index inside the matrix of the maximum value
        
        [a, b] = ind2sub([m, n], ind);  %Matrix coordinates of the max value
        
        r_vect(p,1) = a;  %Position of the max in the radiux axe
        t_vect(p,1) = b;  %Position of the max in the angle axe
        
        %For the following iterations, convert the max value found and its
        %neighbours in an "s" radius into 0 values. In order to avoid
        %illegal indexes in edges and corners, conditions are stated
        x1 = max(1, a-s); %never start over the first row
        x2 = min(m, a+s); %never end below the last row
        y1 = max(1, b-s); %never start "lefter" than the first column
        y2 = min(n, b+s); %never end "righter" the last column
        
        A(x1:x2, y1:y2) = 0;
        
    end
        
end