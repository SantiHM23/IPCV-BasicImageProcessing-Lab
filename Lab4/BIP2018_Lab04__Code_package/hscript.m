
II = imread('ut3.jpg');
%I = imread('./input/football1_v2.jpg');
%I = imread('./input/road_v2.bmp');
%I = imread('./input/vonal1.png');
I = mat2gray(rgb2gray(II));

%I_edges = edge(I, 'Canny', 0.45);

I = imresize(I, 0.5);

canny_th = 0.17;
I_2 = edge(I, 'Canny', canny_th);
%I_2 = edge(I, 'Prewitt');
%I_2 = I;

HT_of_in_img = myhough(I_2);

thres = 0.8*max(HT_of_in_img(:));
fprintf('threshold to hough space: %.2f\n', thres);
O = ihough(HT_of_in_img, 20, 5, thres, size(I, 1), size(I, 2));


figure(2);

subplot(2, 2, 1);
imshow(I);
title('original');

subplot(2, 2, 2);
imshow(I_2);
title(strcat('edges with Canny, ', num2str(canny_th)));

subplot(2, 2, 3);
imagesc(HT_of_in_img); xlabel('\theta'); ylabel('r');
title('Hough space');
hold on;

rectangle('Position', [12-5, 108-25, 10, 50]);
rectangle('Position', [26-5, 192-25, 10, 50]);
rectangle('Position', [28-5, 203-25, 10, 50]);
rectangle('Position', [128-5, 277-25, 10, 50]);


subplot(2, 2, 4);
title('Eredeti');

imshow(imresize(II, .5));
draw_lines([   108   192   203   277],[12    26    28   128]);