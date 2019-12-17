function MODEL = training_phase(T_cell)

    [~, N] = size(T_cell);  %In order to obtain the number of elements in the cell
    
    MODEL = zeros(N,9);  %The output matrix is, at first, an empty matrix with
                         %as many rows as elements are in the cell, and as
                         %many columns as possible Laws kernels exist
    
    for n = 1:N
        Tn = T_cell{n};  %n-th element in the cell
        [h, w] = size(Tn);  %Size of the n-th element
        for k = 1:9
            H = laws_kernel(k);  %k-th Laws kernel
            A = conv2(Tn,H,'same');  %Convolution of the cell element and the kernel
            temp = 0;  %Helpful storing variable
            for x = 1:h
                for y = 1:w
                    %For every position in the convolved matrix, we square
                    %it and store it in the helpful variable
                    temp = temp + A(x,y) * A(x,y);
                end
            end
            %In the model matrix, the element for the n-th elemnt cell and
            %the k-th kernel used is the sum of the element of the
            %convolved matrix squared, divided by the size of the n-th
            %element of the cell
            MODEL(n,k) = temp/(h*w);
        end
    end

end