function hist_vector = calc_hist_vector(input_img)
 
    hist_vector = zeros(256,1);  %Empty vector to store quantity of pixels of each value
	[m, n] = size(input_img);  %Size of the input image

	for x = 1:m
		for y = 1:n
			a = input_img(x,y);  %Intensity of the pixel
			hist_vector(a+1) = hist_vector(a+1) + 1; 
            %Increasment of the value of the vector position corresponding 
            %to the intensity value. The vector indexes start in position
            %1, and intensity values start in value 0, so "a+1" is the corresponding
            %index to an intensity "a".
        end
    end
end