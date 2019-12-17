% script to run pixel_based_segmentation_with_kmeans_C

rng(8);
I = imread('./input/toboz.jpg');
k = 2;
SEG1 = pixel_based_segmentation_with_kmeans_A(I, k);
SEG2 = pixel_based_segmentation_with_kmeans_C(I, k);

figure(3);
subplot(1, 3, 1);
imshow(I);
title('Input image');
subplot(1, 3, 2);
imshow(SEG1);
title(['RGB segmented image (k=',num2str(k),')']);
subplot(1, 3, 3);
imshow(SEG2);
title(['H segmented image (k=',num2str(k),')']);
