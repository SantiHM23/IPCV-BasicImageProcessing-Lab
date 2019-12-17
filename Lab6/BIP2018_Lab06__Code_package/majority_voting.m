function OUT = majority_voting(IN, w_dia)

    [m, n] = size(IN);  %Size of the input matrix
    
    OUT = zeros(m,n);  %So that the output matrix has the same size as the input one
    
    for x = 1:w_dia:m
        for y = 1:w_dia:n
            startx = x;  %Starting row value of each window
            starty = y;  %Starting column value of each window
            endx = min(x+w_dia-1, m);  %Last row value of each window
            endy = min(y+w_dia-1, n);  %Last column value of each window
            SelectedWindow = IN(startx:endx, starty:endy);  %Window with which we are going to work
            MajorityValue = mode(mode(SelectedWindow));  %Most repeated value of the window
            %In the output matrix, substitution of all the values of the
            %window with the most frequent one of that window in the input
            %matrix
            OUT(startx:endx, starty:endy) = MajorityValue;  
        end
    end

end