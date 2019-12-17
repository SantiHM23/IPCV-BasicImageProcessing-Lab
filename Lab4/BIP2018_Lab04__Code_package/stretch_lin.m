function output_img = stretch_lin(input_img)
    
    input_img = double(input_img);  %Stretching can only be done in binary images
    im_min = min(input_img);  %Minimum intensity value of all the present pixels
    im_max = max(input_img);  %Maximum intensity value of all the present pixels
 
    output_img = input_img;  %So that the size of the output image is the same as the input one
    [m, n] = size(input_img);  %Size of the input image
  
  for x = 1:m
    for y = 1:n
      output_img(x,y) = (input_img(x,y) - im_min)*255/(im_max - im_min);
      %Application of the formula for lineal stretching to every pixel of
      %the binary image
    end
 end
 
 output_img = uint8(output_img);  %Output image must be an uint8 image

end