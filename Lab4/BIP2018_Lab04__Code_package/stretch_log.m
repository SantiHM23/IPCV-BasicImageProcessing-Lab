function output_img = stretch_log(input_img, c)
    
    input_img = double(input_img); %Stretching can only be done in binary images
 
    inter_img = input_img;  %Intermediate image with same size as the original one
    [m, n] = size(input_img);  %Size of the input image
    
    for x = 1:m
        for y= 1:n
            inter_img(x,y) = c * log(input_img(x,y) + 1);
            %Application of pint-wise log transformtion in every pixel
        end
    end
    
    inter_img = uint8(inter_img);  %Transform the intermediate image into a unit8 type one
    
    %Calculation of the minimum and maximum values, as stretching in the
    %dyamic range, using a previously implemented function
    output_img = stretch_lin(inter_img);
    
end