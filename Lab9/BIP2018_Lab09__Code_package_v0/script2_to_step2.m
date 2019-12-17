% elementary check of function step2
close all;
clear;

rng(8);
S = rand(12, 3);

A = step2(S, 4);
assert(length(size(A))==2 && all(size(A)==[12, 3]), 'Function step2: the size of the returned array is incorrect');
fprintf('Function step2: size of the returned array seems correct\n');

% 4 different vectors
