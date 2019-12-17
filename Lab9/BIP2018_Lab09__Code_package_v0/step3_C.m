function SEG = step3_C(A, I)
% step3: restore the original shape of the image matrix
% versionC: H as feature space (from HSV)
% (do not forget 
% - to insert 0.7s as the missing S and V layers of HSV,
% - and to multiply the array with 255, before converting to uint8)

    [h, w, ~] = size(I); %Number of rows and columns in the input image
    
    [~, d] = size(A);  %Number of columns of the 2D matrix (which is the number of layers of the reshaped image)
    
    SEG_resh = reshape(A, h, w, d);  %Reshaping of the 2D matrix to have the same size as the input image
    
    S = 0.7 * ones(h,w);  %Matrix with the same size as the input one, in which all the parameters are 0.7 
    V = 0.7 * ones(h,w);  %Matrix with the same size as the input one, in which all the parameters are 0.7
    
    SEG_resh(:,:,d+1) = S;  %Now the S matrix is a layer of the reshaped matrix
    SEG_resh(:,:,d+2) = V;  %Now the V matrix is a layer of the reshaped matrix
    
    SEG_rgb = hsv2rgb(SEG_resh);  %Conversion of the image from the HSV space to the RGB space

    SEG_scaled = SEG_rgb * 255;  %Values of the pixels are in the interval [0,1], we make them into [0,255]
    
    SEG = uint8(SEG_scaled);  %So that the output image is uint8 type
    
end
