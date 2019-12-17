% script to run pixel_based_segmentation_with_kmeans_A

rng(8);
I = imread('./input/duck.jpg');
k = 2;
SEG = pixel_based_segmentation_with_kmeans_A(I, k);

figure(1);
subplot(1, 2, 1);
imshow(I);
title('Input image');
subplot(1, 2, 2);
imshow(SEG);
title(['RGB segmented image (k=',num2str(k),')']);
