I = imread('input\AlfredoBorba_TuscanLandscape.jpg');
imshow(I);
isColor=(size(I,3)==3);
A = rgb2gray(I);
imshow(A);
imwrite(A,'output\AlfredoBorba_TuscanLandscape_GRAY.jpg') 
