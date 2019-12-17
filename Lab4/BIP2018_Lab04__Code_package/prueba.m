A =[17     6     1     8    15
    23     5     7    14    16
     4    24    13    20    22
    10    12    19    21     3
    11    18    25     2     9];

k=2;
s=1;

[m, n] = size(A);

r_vect = zeros(k,1);
t_vect = zeros(k,1);

for p = 1:k
        [val, ind] = max(A(:));
        
        [a, b] = ind2sub([m, n], ind);
        
        r_vect(p,1) = a;
        t_vect(p,1) = b;
        
        x1 = max(1, a-s);
        x2 = min(m, a+s);
        y1 = max(1, b-s);
        y2 = min(n, b+s);
        
        A(x1:x2, y1:y2) = 0;
        
       % k = k-1;
end