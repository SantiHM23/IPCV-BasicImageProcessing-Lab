% elementary check of functions step1_{A, B, C}
close all;
clear;

R = uint8(rand(4, 8, 3)*255);

S = step1_A(R);
assert(isa(S, 'double'), 'Function step1_A: please return an array with type double');
assert(length(size(S))==2 && all(size(S)==[32, 3]), 'Function step1_A: the size of the returned array is incorrect');
fprintf('Function step1_A: size and type of the returned array seems correct\n');

S = step1_B(R);
assert(isa(S, 'double'), 'Function step1_B: please return an array with type double');
assert(length(size(S))==2 && all(size(S)==[32, 5]), 'Function step1_B: the size of the returned array is incorrect');
assert(S(2, 4)==1 && S(2, 5)==2, 'Function step1_B: probably the x- and y-coordinates in the feature-matrix are swapped');
fprintf('Function step1_B: size and type of the returned array seems correct\n');

S = step1_C(R);
assert(isa(S, 'double') && max(S(:))<1+eps && min(S(:))>0-eps, 'Function step1_C: have you done the rgb-->hsv conversation?');
assert(length(size(S))==2 && all(size(S)==[32, 1]), 'Function step1_C: the size of the returned array is incorrect (probably: you have not gathered the H layer of the HSV array)');
fprintf('Function step1_C: size and type of the returned array seems correct\n');



