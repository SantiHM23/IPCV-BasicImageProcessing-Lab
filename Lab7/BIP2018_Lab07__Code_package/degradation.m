function [y, h, n] = degradation(x, kernel, noise)

    [a, b] = size(x);  %Size of the input image
    y = zeros(a,b);  %So that the output image has the same size as the input one
    
    %Development of the different kernels to use
    if kernel == string('average')
        %5x5 averaging kernel
        h = fspecial('average', [5 5]);
    elseif kernel == string('gaussian')
        %9x9 gaussian kernel with standard deviation = 1
        h = fspecial('gaussian', [9 9], 1);
    elseif kernel == string('motion')
        %Motion kernel with length of the motion = 11 and angle of the
        %motion = 30 degrees
        h = fspecial('motion', 11, 30);
    else
        %Error statement for incorrect kernel input
        error('Introduced Kernel name is not correct');
    end
    
    %Development of the different noises to use
    if noise == string('off')
        %No noise at all
        n = zeros(a,b);
    elseif noise == string('white')
        %White noise with random numbers and variance = 0.001
        n = randn(a,b) * sqrt(0.001);
    elseif noise == string('pink')
        %Pink noise with random numbers from the pinknoise function
        n = pinknoise([a b]) * 0.05;
    else
        %Error statement for incorrect noise input
        error('Introduced noise name is not correct');
    end
    
    %Intput image is filtered with the selected kernel, with values outside
    %the bounds are equal to those of the border, output array with same
    %size as the input one and multidimensional filtering with convolution
    y_inter = imfilter(x, h, 'replicate', 'same', 'conv');
    
    %Addition of selected noise to the filtered image
    y = y_inter + n;

end