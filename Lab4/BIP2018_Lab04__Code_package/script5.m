M =[17     6     1     8    15
    23     5     7    14    16
     4    24    13    20    22
    10    12    19    21     3
    11    18    25     2     9];

[R, T] = non_max_sup(M, 1, 1);
if R ~= 5 || T ~= 3
    error('The non maximum suppression gives wrong values! (k=1 case)');
end


[R, T] = non_max_sup(M, 2, 1);
if ~isequal(R, [5; 3]) || ~isequal(T, [3; 2])
    error('The non maximum suppression gives wrong values! (k=2 case)');
end


[R, T] = non_max_sup(M, 2, 2);
if ~isequal(R, [5; 2]) || ~isequal(T, [3; 1])
    error('The non maximum suppression gives wrong values! (k=2, s=2 case)');
end


disp('You non_max_sup function seems to be OK!');