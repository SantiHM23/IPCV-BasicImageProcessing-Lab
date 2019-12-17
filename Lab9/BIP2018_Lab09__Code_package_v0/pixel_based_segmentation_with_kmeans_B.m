function SEG = pixel_based_segmentation_with_kmeans_B(I, k)
% concatenate step1&2&3
% versionB: RGBXY feature space
    
    %Produce the feature matrix in RGBXY-space
    FM = step1_B(I);
    
    %Convert your feature matrix to a clustered feature matrix
    CFM = step2(FM, k);
    
    %restore the original shape of your image on the clustered
    %feature matrix data
    SEG = step3_B(CFM, I);

end
