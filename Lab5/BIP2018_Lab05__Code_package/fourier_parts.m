function [P, M] = fourier_parts(F)
    
    S = fftshift(F);  %Shifting of the input image to the center
    M = abs(S);  %Magnitude of the shifted matrix
    P = angle(S);  %Phase of the shifted matrix

end