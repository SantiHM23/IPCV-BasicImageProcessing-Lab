% script to run pixel_based_segmentation_with_kmeans_B

rng(8);
I = imread('./input/coin.jpg');
k = 2;
SEG1 = pixel_based_segmentation_with_kmeans_A(I, k);
SEG2 = pixel_based_segmentation_with_kmeans_B(I, k);

figure(2);
subplot(1, 3, 1);
imshow(I);
title('Input image');
subplot(1, 3, 2);
imshow(SEG1);
title(['RGB segmented image (k=',num2str(k),')']);
subplot(1, 3, 3);
imshow(SEG2);
title(['RGBXY segmented image (k=',num2str(k),')']);
