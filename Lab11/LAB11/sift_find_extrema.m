function [params] = sift_find_extrema(params)

    NumOfLayers  = params.NumOfLayers;
    NumOfOctaves = params.NumOfOctaves;

    params.extrema = cell(NumOfOctaves, 1);
    
    for octave = 1:NumOfOctaves
        
        layers  = params.pyramid{octave};
        map = zeros(size(layers));
        
        for s = 1:NumOfLayers
            for y = 2:(size(map, 1) - 1)
                for x = 2:(size(map, 2) - 1)
                    
                    z = s + 1;
                    nbhd = layers((y-1):(y+1), (x-1):(x+1), (z-1):(z+1));
                    [~, min_ind] = min(nbhd(:)); %Center element: 14
                    [~, max_ind] = max(nbhd(:));
                    
                    if min_ind == 14 || max_ind == 14
                        map(y,x,s) = 1;
                    end
                    
                end
            end
        end
        
        
        params.extrema{octave} = map;
    end
end