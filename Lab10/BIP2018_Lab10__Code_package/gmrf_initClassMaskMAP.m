function mrf=gmrf_initClassMaskMAP(mrf)

    cmap = load('MRF_colormap.mat');
       h = mrf.imagesize(1);
       w = mrf.imagesize(2);
    cnum = mrf.classnum;

    
    for y=1:h
        for x=1:w
            for cind = 1:cnum
                %Check every index in every pixel and store it
                v(cind) = mrf.logProbs{cind}(y,x);
            end
            %The minimal class index is our objective for the mask
            [~, minind] = min(v);
            mrf.classmask(y,x) = minind;     
        end
    end
    
    imshow(uint8(255*reshape(cmap.color(mrf.classmask,:), h, w, 3)));

end