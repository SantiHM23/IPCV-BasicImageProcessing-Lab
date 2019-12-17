function ClassMap = recognition_phase(I, MODEL)
  
    [m, n] = size(I);  %Size of the input matrix
    
    ClassMap = zeros(m,n);  %Output matrix is an empty matrix with the same size as the input one
    BB = zeros(m, n, 9);  %3D matrix to store the recognition matrices
    N = (1/9) * ones(3,3);  %3x3 averaging matrix
    [row, ~] = size(MODEL);  %In order to know with how many textures we are working in the model
    
    for k = 1:9
        H = laws_kernel(k);  %Each of the Laws kernel matrices for each iteration
        B = conv2(I,H,'same');  %Convolution of the input matrix with the Laws kernel
        Bsq = B.*B;  %Squared matrix
        Bavg = conv2(Bsq,N,'same');  %Squared matrix convolved with the averaging matrix
        BB(:,:,k) = Bavg;  %Storing of the averaged convolved matrix in the 3D storing matrix
    end
    
    sum_abs_diff = zeros(row,1);  %Empty vector with the same rows as the MODEL matrix
    
    for x = 1:m
        for y = 1:n
            for text = 1:row
                temp = 0;  %Helpful storing variable
                for i = 1:9
                    %Storing the absolut difference between the values in
                    %the 3D storing matrix and the model matrix
                    temp = temp + abs(BB(x,y,i) - MODEL(text,i)); 
                end
                %Each row of the vector stores the corresponding sum value
                sum_abs_diff(text,1) = temp;
            end
            b = min(sum_abs_diff);  %Minimum value of the sum storing vector
            [a, ~] = find(sum_abs_diff == b); %Row of the minimum value
            %In that position of the output matrix, we store the value of
            %the row in which the sum difference is lower, which represents
            %the most similar texture of those being tested
            ClassMap(x,y) = a;  
        end
    end

end