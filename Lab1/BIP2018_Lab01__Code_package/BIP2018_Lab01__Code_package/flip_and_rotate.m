function [VER, HOR, ROT] = flip_and_rotate(I)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
VER = flipud(I);
HOR = fliplr(I);
ROT = imrotate(I, -45);
end

