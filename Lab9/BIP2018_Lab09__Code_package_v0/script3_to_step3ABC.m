% elementary check of functions step3_{A, B, C}
close all;
clear;

A = rand(8, 3);
I = zeros(2, 4, 3);

SEG = step3_A(A, I);
assert(isa(SEG, 'uint8'), 'Function step3_A: please return an array with type uint8');
assert(length(size(SEG))==3 && all(size(SEG)==[2, 4, 3]), 'Function step3_A: the size of the returned array is incorrect');
fprintf('Function step3_A: size and type of the returned array seems correct\n');

A = rand(8, 5);
SEG = step3_B(A, I);
assert(isa(SEG, 'uint8'), 'Function step3_B: please return an array with type uint8');
assert(length(size(SEG))==3 && all(size(SEG)==[2, 4, 3]), 'Function step3_B: the size of the returned array is incorrect');
fprintf('Function step3_B: size and type of the returned array seems correct\n');

A = rand(8, 1);
SEG = step3_C(A, I);
assert(isa(SEG, 'uint8'), 'Function step3_C: please return an array with type uint8');
assert(length(size(SEG))==3 && all(size(SEG)==[2, 4, 3]), 'Function step3_C: the size of the returned array is incorrect');
fprintf('Function step3_C: size and type of the returned array seems correct\n');



