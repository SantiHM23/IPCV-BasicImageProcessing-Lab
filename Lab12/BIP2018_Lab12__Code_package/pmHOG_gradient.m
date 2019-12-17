function [PHI, MAG] = pmHOG_gradient(I)
   
    %1. Convert the input image to double
    I = double(I);
    
    %2. Define the kernels as MATLAB row and column vectors.
    Hx = [-1 0 1];
    Hy = Hx';
    
    %3. Apply your kernels
    X = imfilter(I, Hx, 'replicate', 'same');
    Y = imfilter(I, Hy, 'replicate', 'same');
    
    [x, y] = size(X); %Size of both kerneled matrices (they are the same size)
    
    %So that the output matrices have the same size as the kerneled matrices
    PHI = zeros(x,y);
    MAG = zeros(x,y);
    
    for i = 1:x
        for j = 1:y
            %4. Compute the phase angle
            PHI(i,j) = atan(Y(i,j) / X(i,j));
            %Convert the resulting phase into degrees
            PHI(i,j) = rad2deg(PHI(i,j));
            %5. Compute the magnitude of the vectors
            MAG(i,j) = sqrt(X(i,j)^2 + Y(i,j)^2);
        end
    end

end
