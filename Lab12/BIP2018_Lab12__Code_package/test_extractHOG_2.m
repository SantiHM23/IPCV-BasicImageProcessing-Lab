%close all;
clear;

I = imread('./input/evidence.png');

H = pmHOG_extractHOG(I);

figure;
imshow(I, 'InitialMagnification', 'fit');
hold on;
plotHOG(H);
