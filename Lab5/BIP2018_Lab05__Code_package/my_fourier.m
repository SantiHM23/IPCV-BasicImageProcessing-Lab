function [F] = my_fourier(I)

    F = I;  %So that the transformed image has the same size as the input image
    
    [N1, N2] = size(I);  %Size of the input image
    
    for k1 = 1:N1
        for k2 = 1:N2
            temp = 0;  %Temporal variable, analog to the sumatory in the applied formula
            for n1 = 1:N1
                for n2 = 1:N2
                    temp = temp + I(n1,n2)*exp(-1i*(2*pi*(k1-1)*(n1-1))/N1)*exp(-1i*(2*pi*(k2-1)*(n2-1))/N2);
                    %Forward formula of the Fourier transform
                end
            end
            F(k1,k2) = temp;  %Image after the Fourier transformation
        end
    end

end