I = imread('input/lines.png');

H = my_hough(I);

figure(4);
subplot(121); 
    imshow(I);
    title('Original image');
subplot(122); 
    imagesc(H)
    title('Hough space');
    xlim([1,180]); xlabel('\theta');
    ylabel('r');