function H = laws_kernel(j)
    
    X{1} = 1/6 * [1; 2; 1];
    X{2} = 1/2 * [1; 0;-1];
    X{3} = 1/2 * [1;-2; 1];

    if j < 1 || j > 9 || j ~= uint8(j)
        error('Invalid Laws kernel index!');
    end
    
    part1 = floor((j-1)/3)+1;
    part2 = j-(part1-1)*3;
    
    H = X{part1}*X{part2}';
    
    
end