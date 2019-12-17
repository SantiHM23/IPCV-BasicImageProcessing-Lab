function [params] = sift_keypoint_localization(params)

    UnstableExtremaThreshold = params.UnstableExtremaThreshold;
    DefaultSigma = params.DefaultSigma;
    NumOfLayers  = params.NumOfLayers;
    NumOfOctaves = params.NumOfOctaves;
    
    params.filtered = params.extrema;

    for octave = 1:NumOfOctaves
        factor_double = 2^( + (octave - 1) );
        scaled_sigma = times(DefaultSigma , factor_double);
        map = params.extrema{octave};
        layers = params.pyramid{octave};
                
        for s = 1:NumOfLayers
            
            SSC_index = find(map(:,:,s)); % Scale-Space-Corner Index
            if isempty(SSC_index)
                continue;
            end
            
            for ssc = 1:length(SSC_index)
                [y,x] = ind2sub([size(map,1), size(map,2)], SSC_index(ssc));
                z = s + 1;
                row_diff = layers(y+1, x, z) - layers(y-1, x, z);
                col_diff = layers(y, x+1, z) - layers(y, x-1, z);
                lyr_diff = layers(y, x, z+1) - layers(y, x, z-1);
                
                offset = [2; 2; scaled_sigma * ( 2^( (z+1) / NumOfLayers ) - 2^( (z-1) / NumOfLayers ) )];
                
                DxHat = layers(y,x,z) + 0.5 * ([row_diff,col_diff,lyr_diff] * offset);
                
                if abs(DxHat) < UnstableExtremaThreshold
                    params.filtered{octave}(y,x,s) = 0; % discard unstable extrema
                end
                
            end
        end
    end
end