close all;
clear;

% please set the value of the following variable, according to the 
% lab-slides:
level = 2; % value can be integers {1, 2, 3}



I = imread('input/AlfredoBorba_TuscanLandscape.jpg');
I = mat2gray(I);

I_part = I(227:331, 439:596); % part of the image

% kernel-declaration:
if level==1
    K = fspecial('prewitt'); % horizontal Prewitt 1st order derivative
    K = K'; % vertical Prewitt 1st order derivative
    fig_name = 'vertical Prewitt, 1st order derivative';
elseif level==2
    hs = randi(20)*2+1;
    K = fspecial('log', hs, 0.5); % Laplacian of Gaussian
    fig_name = 'Laplacian of Gaussian (variable sized, squared kernel)';
else
    K = fspecial('motion', 16, 80); % motion blur with 16px shift and 80degrees rotation
    fig_name = 'motion blur (not-squared kernel)';
end

I_c = myconv(I_part, K);



% basic check (there is no relation with the checker of the submission system):
% - size of the convolved result is the same as the input image
assert(isequal(size(I_part), size(I_c)), ...
    'The size of your result (convolved) image is not the same as the size of the input.');
% - the content of the image has changed
assert(~isequal(I_part, I_c), 'The resulted (convolved) image is the same as the input.');

% basic check (there is no relation with the checker of the submission system):
% - the convolution matrix indexed in the right order --- VISUAL MEANING:
% the left of the trees should be black, the right should be white;
% generate reference solution with matlab, and calculate difference pixel-by-pixel
I_c_ref = conv2(I_part, K, 'same');
difference_error = sum(sum(abs(I_c - I_c_ref))); % higher difference --> higher error


figure('Name', fig_name);
subplot(2, 2, 1);
imagesc(I_part);
colormap gray;
axis equal;
axis off;
colorbar;
title('original');

subplot(2, 2, 3);
imagesc(I_c);
colormap gray;
axis equal;
axis off;
colorbar;
title(strcat('myconv, difference to GT: ', num2str(difference_error)));

subplot(2, 2, 4);
imagesc(I_c_ref);
colormap gray;
axis equal;
axis off;
colorbar;
title('built-in conv2');




