function SEG = pixel_based_segmentation_with_kmeans_C(I, k)
% concatenate step1&2&3
% versionC: H feature space from HSV

    %Produce the feature matrix in H-space
    FM = step1_C(I);
    
    %Convert your feature matrix to a clustered feature matrix
    CFM = step2(FM, k);
    
    %restore the original shape of your image on the clustered
    %feature matrix data
    SEG = step3_C(CFM, I);
    
end
