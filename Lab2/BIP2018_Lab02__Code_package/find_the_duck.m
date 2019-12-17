function duck = find_the_duck(I)
    R = I(:,:,1); %Every
    G = I(:,:,2); %RGB
    B = I(:,:,3); %plane
    duck = R>65 & G<245 & B<245; %Values of each variable between 0 and 255
end