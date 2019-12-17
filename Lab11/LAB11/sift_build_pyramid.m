function [params] = sift_build_pyramid(params)

    DefaultSigma = params.DefaultSigma;
    InputImage   = params.InputImage;
    NumOfLayers  = params.NumOfLayers;
    NumOfOctaves = params.NumOfOctaves;

    params.pyramid = cell(NumOfOctaves, 1);
    

    for octave = 1:NumOfOctaves

        scaled_sigma = DefaultSigma * 2^(octave-1);
        scaled_image = imresize(InputImage, 2^(-(octave-1)));
        [m, n] = size(scaled_image);
        big_array = zeros(m,n,NumOfLayers+3);
        for s = 1:NumOfLayers+3
            %Calculate the big array of Gaussians
            sigma = scaled_sigma * 2^((s-2)/NumOfLayers);
            big_array(:,:,s) = imgaussfilt(scaled_image, sigma);
        end
        
        params.pyramid{octave} = diff(big_array, 1, 3);

    end
    
end