function [x_tilde] = restoration(y, h, method, varargin)
    
    [a, b] = size(y);  %Size of the input mtrix
    Y = fft2(y);  %Fourier transformation of the input matrix
    H = psf2otf(h, [a b]);  %Transformation of the h matrix to the frequency domain 
                            %with zero padding to make it of the same size as the input matrix
    P_XX = Y .* conj(Y);  %Power spectrum of the signal. As we don't have x, we "cheat" using y.
    
    %Development of the different methods to select
    if method == string('inverse')
        %Reconstruction matrix with the inverse filter
        R = inverse_filter(H);
    elseif method == string('CLS')
        %alpha and c are the first and second variables stored in varargin
        %for the use of this method
        alpha = varargin{1};
        c = varargin{2};
        %We have to transform c to the frequency domain so that it has the
        %same size as the input matrix
        C = psf2otf(c, [a b]);
        %Reconstruction matrix with the Constrained Least Squared filter
        R = CLS_filter(H,alpha,C);
    elseif method == string('wiener')
        %n is the first variable stored in varargin for the use of this
        %method
        n = varargin{1};
        %We have to transform n to the frequency domain so that it has the
        %same size as the input matrix
        N = psf2otf(n, [a b]);
        %Formula for the calculation of the power spectrum
        P_NN = N .* conj(N);
        %Reconstruction matrix with the Wiener filter
        R = wiener_filter(H, P_NN, P_XX);
    elseif method == string('wiener-white')  %Here the Wiener filter has white noise
        %var_noise is the first variable stored in varagin for the use of
        %this method
        var_noise = varargin{1};
        %Variance of the input signal
        var_image = var(y(:));
        %Reconstruction matrix with the Wiener filter
        R = wiener_filter(H, var_noise, var_image);
    else
        %Error statement for incorrect method input
        error('Introduced method name is not correct');
    end
    
    %Formula for getting the restored image in the spatial domain
    x_tilde = abs(ifft2(R.*Y));
    
end