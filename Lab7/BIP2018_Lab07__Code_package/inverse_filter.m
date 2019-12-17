function [R] = inverse_filter(H)

    [m, n] = size(H);  %Size of the input matrix
    
    R = zeros(m, n);  %So that the output matrix has the same size as the input one
    
    Hcomp = conj(H);  %Complex H matrix
    
    %Formula of the inverse filter pixel by pixel
    for w1 = 1:m
        for w2 = 1:n
            R(w1,w2) = Hcomp(w1,w2) / (abs(H(w1,w2))^2);
        end
    end
    
end