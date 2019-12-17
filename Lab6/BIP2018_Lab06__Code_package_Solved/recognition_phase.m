function ClassMap = recognition_phase(I, MODEL)

    N = 1/9 * [1 1 1; 1 1 1; 1 1 1];
    
    ClassMap = zeros(size(I));
    BB = zeros(size(I,1), size(I,2), 9);
    
    % Build BB matrix
    for k=1:9
        H = laws_kernel(k);
        B = conv2(I, H, 'same');
        B_star = conv2(B.^2, N, 'same');
        BB(:,:,k) = B_star;
    end
    
    % We don't need this N anymore; overwrite:
    N = size(MODEL, 1);
    
    % Classify the pixels
    for x=1:size(I, 1)
        for y=1:size(I, 2)
            sum_abs_diff = ones(N,1)*9999;
            for n=1:N
                tmp1 = BB(x,y,:);
                tmp2 = MODEL(n,:);
                sum_abs_diff(n) = sum(abs(tmp1(:) - tmp2(:)));
            end
            [~, ClassMap(x,y)] = min(sum_abs_diff);
        end
    end
    
        
end