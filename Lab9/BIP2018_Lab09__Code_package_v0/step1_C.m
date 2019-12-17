function S = step1_C(I)
% step1: reshape
% versionC: H as feature space (from HSV)
    I_hsv = rgb2hsv(I);  %Conversion of the input image into the HSV space
    
    I_h = I_hsv(:,:,1);  %We only take the H layer of the HSV image
    
    [h, w, d] = size(I_h);  %Dimensions of the H matrix
    
    S = reshape(I_h, h*w, d);  %Reshaping of the H matrix into a vector
    
end
