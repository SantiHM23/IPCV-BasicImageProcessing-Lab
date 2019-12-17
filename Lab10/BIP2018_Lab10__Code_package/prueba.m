clear all; clc;
a = 2;
n = 5;
b = a;

while b == a
    r = rand();
    b = ceil(n * r);
end

disp(['Value =' , a]);