function S = step1_B(I)
% step1: reshape
% versionB: RGBXY feature space
    I_d = double(I);  %Conversion of the input image to a type double
    
    [h, w, d] = size(I_d);  %Rows, columns and layes of the double image
    
    [X, Y] = meshgrid(1:w, 1:h);  %Matrices with the column and row indeces
    
    I_d(:,:,d+1) = X;  %Matrix with the column indeces is now a new layer of the image
    I_d(:,:,d+2) = Y;  %Matrix with the row indeces is now a new layer of the image
    
    S = reshape(I_d, h*w, size(I_d,3));  %Reshaping of the image into a matrix
    
end
