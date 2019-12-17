function  check_trace_theor(A)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
lamba = eig(A);
eps = 0.00000005;
if sum(lamba)-trace(A)<eps
    disp('OK')
else
    disp('NOT OK')
end
end

