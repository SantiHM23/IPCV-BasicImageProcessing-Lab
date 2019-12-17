function [params] = sift_eliminate_edge_responses(params)

    EdgeEliminationThreshold = params.EdgeEliminationThreshold;
    NumOfLayers  = params.NumOfLayers;
    NumOfOctaves = params.NumOfOctaves;
    
    params.eliminated = params.filtered;
    
    for octave = 1:NumOfOctaves
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
                Dyy = layers(y+1, x, z) - 2*layers(y, x, z) + layers(y-1, x, z);
                Dxx = layers(y, x+1, z) - 2*layers(y, x, z) + layers(y, x-1, z);
                
                Dxy = layers(y-1, x+1, z) - layers(y-1, x-1, z) - layers(y+1, x+1, z) + layers(y+1, x-1, z);
                
                TraceH = Dxx + Dyy;
                DetH   = Dxx*Dyy - Dxy*Dxy;
                
                if ((TraceH^2 / DetH) >= EdgeEliminationThreshold)
                    params.eliminated{octave}(y,x,s) = 0; % discard point on edge
                end
                
            end
        end
    end
end


