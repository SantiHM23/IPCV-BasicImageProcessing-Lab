function H = laws_kernel(k)
   
    L = [1/6; 1/3; 1/6];  %Level detection filter
    E = [1/2; 0; -1/2];   %Edge detection filter
    S = [1/2; -1; 1/2];   %Spot detection filter

    %Calculation of all the Law's filters kernels for each index value
    if k==1
        H = L*L';
    elseif k==2
        H = L*E';
    elseif k==3
        H = L*S';
    elseif k==4
        H = E*L';
    elseif k==5
        H = E*E';
    elseif k==6
        H = E*S';
    elseif k==7
        H = S*L';
    elseif k==8
        H = S*E';
    elseif k==9
        H = S*S';
    else
        %Error statement if a wrong index is introduced
        error('Error: Input indexes not valid.');
    end
    
end