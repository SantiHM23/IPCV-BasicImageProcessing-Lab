function B = ordered_dither(I, D)
    M = size(I);  %Size of the image
    N = size(D);  %Size of the threshold map
    B = repmat(D, M./N);  %Image size composed by x times the threshold map
    B = I>B;  %Thresholding. B is formed by many combined Ds.
end