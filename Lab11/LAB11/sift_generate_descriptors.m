function [SIFT] = sift_generate_descriptors(params)

    NumOfLayers  = params.NumOfLayers;
    NumOfOctaves = params.NumOfOctaves;
    DefaultSigma = params.DefaultSigma;
    
    SIFT = [];
    
    % SIFT feature descriptors generation
    % the patch size for dominant orientation calculation is 9;
    % the patch size for feature transformation is 16;
    for octave = 1:NumOfOctaves
        factor_double = 2^( + (octave - 1) );
        scaled_sigma = times(DefaultSigma , factor_double);

        for s = 1:NumOfLayers
            z = s+1;
            sigma      = scaled_sigma * 2^( (z-2) / NumOfLayers );
            smoothed   = params.pyramid{octave}(:,:,z);
            map = params.eliminated{octave}(:,:,z);
            SSC_index  = find(map);

            if isempty(SSC_index)
                continue;
            end

            DomOri = zeros(length(SSC_index),2,36); % first column is for sita, second column is for magnitude
            sift = zeros(length(SSC_index),128,36);

            for ssc = 1:length(SSC_index)
                [y,x] = ind2sub([size(map,1), size(map,2)], SSC_index(ssc));
                y = y + 1; % offset [1,1];
                x = x + 1; %


                if (y <= 10) || (y >= size(smoothed,1)-8) || (x <= 10) || (x >= size(smoothed,2)-8)
                    continue;
                end

                % magnitude and sita of sample points in the patch
                mag = ( (smoothed(y-8:y+7,x-7:x+8) - smoothed(y-8:y+7,x-9:x+6)).^2 ...
                      + (smoothed(y-7:y+8,x-8:x+7) - smoothed(y-9:y+6,x-8:x+7)).^2 ...
                      ).^0.5;

                sita = atan2( (smoothed(y-7:y+8,x-8:x+7) - smoothed(y-9:y+6,x-8:x+7)), ...
                              (smoothed(y-8:y+7,x-7:x+8) - smoothed(y-8:y+7,x-9:x+6)));

                sita = mod(sita + 2*pi, 2*pi); % the range of atan2 function is -pi~pi, map it to 0~2*pi

                % Dominant orientation calculation
                Dmag = imgaussfilt(mag(5:13,5:13), 1.5*sigma); % magnitude is weighted by gaussian filter
                sitaquantize = mod(sita(5:13,5:13) + pi/36,2*pi);
                sitaquantize = floor(sitaquantize / (2*pi/36));
                sitabin = zeros(36,1);
                for patchindx = 1:9^2
                    sitabin(sitaquantize(patchindx)+1) = sitabin(sitaquantize(patchindx)+1) + Dmag(patchindx);
                end
                maxsitabin = max(sitabin);
                DominantOriBin = find((sitabin / maxsitabin) >= 0.8); % duplicate the feature when non-maximum magnitude of orientation is also big
                DominantOriSita = (DominantOriBin-1)*(2*pi/36);
                
                % SIFT feature calculation
                for DomOriIndx = 1:length(DominantOriSita)
                    Smag = imgaussfilt(mag, 8);
                    sitaquantize = mod(sita - DominantOriSita(DomOriIndx) + pi/8 + 2*pi,2*pi);
                    sitaquantize = floor(sitaquantize / (2*pi/8));
                    sitabin = zeros(8,4,4);
                    for patchindx = 1:16^2
                        [row,col] = ind2sub([16,16], patchindx);
                        row = floor((row-1)/4)+1;
                        col = floor((col-1)/4)+1;
                        sitabin(sitaquantize(patchindx)+1,row,col) = sitabin(sitaquantize(patchindx)+1,row,col) + Smag(patchindx);
                    end
                    sitabin = bsxfun(@times,sitabin,sum(sitabin.^2,1).^(-0.5)); % normalize the vector
                    sitabin(sitabin > 0.2) = 0.2; % threshold the maximum value as 0.2
                    sitabin = bsxfun(@times,sitabin,sum(sitabin.^2,1).^(-0.5)); % renormalize
                    SIFT = [SIFT; sitabin(:)'];
                end
            end
        end 
    end
end
