function H = pmHOG_binner(PHI, MAG)
  
    %1. Initialize an empty 1×9 histogram vector.
    H = zeros(1,9);
    
    %Minimum and maximum value of each phase bin
    lim_min = -90:20:70;
    lim_max = -70:20:90;
    
    for k = 1:9
        %Calculate the interval endpoints
        min_ind = lim_min(k);
        max_ind = lim_max(k);
        %Create a logical mask of the phase matrix.
        LOG_MASK = (PHI >= min_ind & PHI < max_ind);
        %Select those elements from the magnitude matrix for which the 
        %corresponding vector’s angle is in this bin
        Elems = MAG .* LOG_MASK;
        %Calculate the sum of the selected magnitude values and store them 
        %in the histogram at the position specified by the bin index
        H(k) = sum(sum(Elems));
    end

end
