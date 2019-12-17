function pine = find_the_pine(I)
    I2 = rgb2hsv(I); %Image transformation to HSV space
    H = I2(:,:,1); %Every
    S = I2(:,:,2); %HSV
    V = I2(:,:,3); %Space
    pine = H<0.16 & S<0.97 & V<0.99; %Values of each variable between 0 and 1
end