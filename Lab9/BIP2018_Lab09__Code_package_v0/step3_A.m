function SEG = step3_A(A, I)
% step3: restore the original shape of the image matrix
% versionA: RGB feature space

    [h, w, ~] = size(I); %Number of rows and columns in the input image
    
    [~, d] = size(A);  %Number of columns of the 2D matrix (which is the number of layers of the reshaped image)
    
    SEG_resh = reshape(A, h, w, d);  %Reshaping of the 2D matrix to have the same size as the input image
    
    SEG = uint8(SEG_resh);  %So that the output image is uint8 type
    
end
