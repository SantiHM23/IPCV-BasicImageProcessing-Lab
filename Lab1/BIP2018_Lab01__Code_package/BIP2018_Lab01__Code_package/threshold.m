function [TH] = threshold(IMG, level)
    type = size(IMG,3);
    if (type ~= 1)
        warning('Image not grayscale');
        TH = rgb2gray(IMG);
    end
end