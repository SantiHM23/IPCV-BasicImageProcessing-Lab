function S = step1_A(I)
% step1: reshape
% versionA: RGB feature space
    I_d = double(I);  %Conversion of the input image to a type double
    
    [h, w, d] = size(I_d);  %Rows, columns and layers of the double image
    
    S = reshape(I_d, h*w, d);  %Reshaping of the image into a matrix
    
end
