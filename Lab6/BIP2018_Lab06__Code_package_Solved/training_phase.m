function MODEL = training_phase(T_cell)

    N = numel(T_cell);
    MODEL = zeros(N,9);
    
    for n=1:N
        T = T_cell{n};
        [h,w] = size(T);
        for k=1:9
            H = laws_kernel(k);
            A = conv2(T, H, 'same');
            MODEL(n,k) = 1/(h*w) * sum(sum(A.^2));
        end
    end

end