I = imread('input/cat.png');
I = mat2gray(I);

h = {'average', 'gaussian', 'motion'};
n = {    'off',    'white',   'pink'};
r = {       89,        369,      649};
c = {      491,        771,     1051};

M = imread('script1.png');
M = mat2gray(M);

for a = 1:3
    for b=1:3
        [M(r{b}:r{b}+255,  c{a}:c{a}+255), ~, k] = degradation(I, h{a}, n{b});
        M(r{b}:r{b}+255, 98:98+255) = k - min(k(:));
    end
end
M(r{1}:r{1}+255, 98:98+255) = I;

figure(1);
imshow(M);