I = imread('input/airplane.jpg');

hist_vector = calc_hist_vector(I);

figure(1);
subplot(2,2,1:2); 
    imshow(I);
    title('Grayscale input');
subplot(2,2,3); 
    hist(double(I(:)), 256); 
    title('Official histogram');
    xlim([1,256]);
subplot(2,2,4);
    bar(hist_vector);
    title('Your histogram');
    xlim([1,256]);