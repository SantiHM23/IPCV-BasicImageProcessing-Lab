clear; close all; clc;

N = [0         0         0         0         0         0         0         0         0
     0.1487    0.0406    0.0406    0.0183    0.0050    0.0050    0.0183    0.0050    0.0050];
A = toeplitz([1 1 1 zeros(1,7)]);
S = recognition_phase(A, N);
Z = toeplitz([2 2 2 ones(1,7)]);
Y = sum(sum(S < 1 | S > 2));

err = sum(sum(abs(Z-S)));

perfect = 1;
% Check size
if size(S ,1) ~= 10 || size(S ,2) ~= 10
    warning('The size of the ClassMap is not the same as the input image.');
    perfect = 0;
end

if Y > 0
    warning('ClassMap contains invalid values. Possible valies in case of two classes are 1 and 2.');
    perfect = 0;
end

if err > 5
    warning('The class labels in ClassMap are incorrect.');
    perfect = 0;
end

if perfect
    disp('The recognition phase function seems to be OK!');
end
