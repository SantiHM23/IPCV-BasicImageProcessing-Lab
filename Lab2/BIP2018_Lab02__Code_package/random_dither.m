function B = random_dither(A)
    R = rand(size(A));  %Create a random matrix with the same size as matrix A
    B = A + R;  %Output matrix is the input matrix plus the random matrix
    B = B>1;  %Thresholoding matrix
end