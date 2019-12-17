function [R] = wiener_filter(H, P_NN, P_YY)
  
    [m, n] = size(H);  %Size of the input matrix
    
    R = zeros(m,n);  %So that the output matrix has the same size as the input one
    
    Hcomp = conj(H);  %Complex H matrix
    A = P_NN./P_YY;  %Relation between the noise power spectrum and the output imge power spectrum
    den = abs(H).^2 + A;  %Denominator of the Wiener filter formula
    
    %Result of the Wiener filter formula
    R = Hcomp./den;

end