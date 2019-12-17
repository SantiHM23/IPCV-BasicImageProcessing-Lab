function SEG = pixel_based_segmentation_with_kmeans_A(I, k)
% concatenate step1&2&3
% versionA: RGB feature space

    %Produce the feature matrix in RGB-space
    FM = step1_A(I);
    
    %Convert your feature matrix to a clustered feature matrix
    CFM = step2(FM, k);
    
    %restore the original shape of your image on the clustered
    %feature matrix data
    SEG = step3_A(CFM, I);
    
end
