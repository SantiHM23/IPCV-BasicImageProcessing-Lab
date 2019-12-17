function OUT = majority_voting(IN, w_dia)

OUT = zeros(size(IN));

for x=1:w_dia:size(IN,1)
    for y=1:w_dia:size(IN,2)

        start_x = x;
        start_y = y;
        end_x = min(x + w_dia - 1, size(IN,1));
        end_y = min(y + w_dia - 1, size(IN,2));

        area = IN(start_x:end_x, start_y:end_y);

        major = mode(area(:));

        OUT(start_x:end_x, start_y:end_y) = major;

    end
end


end