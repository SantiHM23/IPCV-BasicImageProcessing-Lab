function [params] = sift_preprocess_image(params)

    I = imread(params.InputImgPath);
  %  I = histeq(I);
    I = imresize(I, .15);

    % Convert it to grayscale if necessary
    if size(I, 3) > 1
        I = rgb2gray(I);
    end

    % Convert it to [0,1] double
    params.InputImage = mat2gray(I);

end