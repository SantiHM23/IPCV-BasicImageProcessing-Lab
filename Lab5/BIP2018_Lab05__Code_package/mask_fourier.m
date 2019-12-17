function newF = mask_fourier(F, x, y, r)

    S = fftshift(F);  %Shifting of the input matrix
    
    [m, n] = size(S);  %Size of the shifted matrix
    
    %x and y are vectors that accumulate the x and y coordinates of the
    %pixels manually selected by the user
    [b, ~] = size(x);  %Number of rows of the vector (as they have the same size, could also work with y)
    
    for a = 1:b
        
        %x coordinate on the image is y coordinate on the Euclidian space
        %and viceversa
        xr = round(y(a,1));  %As working with a matrix, we have to round
        yr = round(x(a,1));  %the obtained values in the iteration
        
        %As in previous lab, make sure we always work inside the matrix
        x1 = max(1, xr-r); %never start over the first row
        x2 = min(m, xr+r); %never end below the last row
        y1 = max(1, yr-r); %never start "lefter" than the first column
        y2 = min(n, yr+r); %never end "righter" the last column

        %Selected points and their neighbours inside the radius area are
        %converted into complex zero-value pixels
        S(x1:x2, y1:y2) = 0+0*1i;
    end
    
    newF = ifftshift(S);  %Final matrix with zero values is unshifted

end