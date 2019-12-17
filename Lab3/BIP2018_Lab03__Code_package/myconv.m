function output_img = myconv(input_img, kernel)

    [a, b] = size(kernel);  %Getting the values of the kernel's size
    a1 = (a-1)/2;  %Extra pixels needed in the horizontal axe
    b1 = (b-1)/2;  %Extra pixels needed in the vertical axe
    [a2, b2] = size (input_img);  %Getting the values of the original image's size
    arrayed_img = padarray(input_img, [a1, b1]);  %Extension of the original image according to the extra pixels needed for the used kernel
    rot_ker = rot90(kernel, 2);  %180º rotation of the kernel
    [p, q] = size(rot_ker);  %Value's of the rotated kernel size (changes when kernel is not square matrix)
    for x=1:a2  %Going over the original image's horizontal axe
        for y=1:b2 %Going over the original image's vertical axe    
                    output_img(x,y) = sum(sum(rot_ker.*arrayed_img(x:x+p-1,y:y+q-1)));
                    %Use of the mathematical formula in slide 2 of the lab
                    %The centre of the kernel matrix goes all over every
                    %pixel of the image. Every pixel is the result of the
                    %addition of the multiplication of every single element
                    %of the kernel matrix and its correspondent element on
                    %the arrayed matrix in the area in which the kernel is
                    %working. The extra size of this image compared with
                    %the original one is filled with zeros by the formula
                    %used in Line 7.
        end
    end
end
