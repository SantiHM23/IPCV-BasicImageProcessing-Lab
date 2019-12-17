I = imread('input\AlfredoBorba_TuscanLandscape.jpg');
[A, B, C] = flip_and_rotate(I);
subplot(1,3,1);
imshow(A);
subplot(1,3,2);
imshow(B);
subplot(1,3,3);
imshow(C);