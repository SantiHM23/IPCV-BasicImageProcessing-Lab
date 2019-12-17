function [H] = my_hough(input_img)
    % assumption: the input is already a BW image (containing edges) from
    % the range [0, 1]
    
    [m, n] = size(input_img);  %Size of the input image
    r = sqrt(m^2 + n^2);  %Diagonal of the image (longest possible radius)
    r_max = ceil(r);  %Rounding to the following value, in case r is decimal
    H = zeros(r_max, 180);  %Empty matrix to store data, which size is the 
                            %maximum radius by the maximum theta angle
    
    for x = 1:m
        for y = 1:n
            if input_img(x,y) > 0  %Only on non-zero pixels
                for th = 1:180
                r_th = x*cosd(th) + y*sind(th);  %Polar equation of the line
                r = round(r_th);
                %For every non-zero pixel, we obtain the value of the
                %radius for all the theta angles between 0 and 180
                    if r>0 && r<r_max
                        H(r,th) =  H(r,th)+1;
                        %As long as the radius values are in the range of
                        %the Hough space, their value is incremented. In
                        %the solution, the most coloured points correspond
                        %to the lines of the Euclidian space
                    end
                end
            end
        end
   end

end