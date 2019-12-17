function [HOG_differences, guilty_index] = pmHOG_findGuilty()

    %Load the database
    gt = load('./input/suspects.mat');
    %Extract the images from suspects contained in the database
    usual = gt.suspects;
    %Read in the image of the evidence
    I = imread('./input/evidence.png'); 
    
    %Calculate the HOG descriptor matrix of the evidence image
    HOG_E = pmHOG_extractHOG(I);
    [~, ~, t] = size(usual);  %To get number of suspects
    HOG_differences = zeros(1,t);  %So that the differences vector has as many as there are suspects
    
    for i = 1:10
        %Select every suspect image
        Susp = usual(:,:,i);
        %Calculate the HOG descriptor matrix
        HOG_S = pmHOG_extractHOG(Susp);
        %Calculate the difference between the suspect and the evidence
        diff = sum(sum(sum(abs(HOG_E-HOG_S))));
        %Store this difference in a vector assigned to the suspect index
        HOG_differences(i) = diff;
    end
    
    %Find the index of the culprit (the lowest value in the difference vector)
    [~, guilty_index] = min(HOG_differences);

end
