function mrf = gmrf_doICM(mrf)

         cmap = load('MRF_colormap.mat');
            h = mrf.imagesize(1);
            w = mrf.imagesize(2);
         cnum = mrf.classnum;
         beta = mrf.Beta;
    DeltaUmin = mrf.DeltaUmin;

    

           cycle = 0;
    summa_deltaE = 2 * DeltaUmin; % the first iteration is guaranteed

    while summa_deltaE > DeltaUmin 

        summa_deltaE = 0;

        % Increment the cycle index
        cycle = cycle + 1;

        for y=1:h
            for x=1:w
                % Class of the current pixel
                C     = mrf.classmask(y, x);

                % Classes of the 4 1st order neigbors
                Cn(1) = mrf.classmask(max(y-1, 1),           x);
                Cn(2) = mrf.classmask(min(y+1, h),           x);
                Cn(3) = mrf.classmask(          y, max(x-1, 1));
                Cn(4) = mrf.classmask(          y, min(x+1, w));

                % Classes of the 4 2nd order neigbors
                Cn(5) = mrf.classmask(max(1, y-1), max(1, x-1));
                Cn(6) = mrf.classmask(max(1, y-1), min(w, x+1));
                Cn(7) = mrf.classmask(min(h, y+1), max(1, x-1));
                Cn(8) = mrf.classmask(min(h, y+1), min(w, x+1));
                
                act_posterior = mrf.logProbs{C}(y, x);
                act_prior =  (beta * (sum(Cn(:) ~= C))) - (beta * (sum(Cn(:) == C)));

                U_act = act_posterior + act_prior;
                
                % find minimum
                U_min = U_act;
                
                for cind=1:cnum
                    
                    if cind ~= C
                        new_posterior = mrf.logProbs{cind}(y,x);
                        new_prior = (beta * (sum(Cn(:) ~= cind))) - (beta * (sum(Cn(:) == cind)));
                        U_new = new_posterior + new_prior;

                        if U_new < U_min
                            C = cind;
                            U_min = U_new;
                            mrf.classmask(y,x) = cind; 
                        end

                    end

                end

                summa_deltaE = summa_deltaE + abs(U_min - U_act); 
                
            end
        end
        
        
        
        imshow(uint8(255*reshape(cmap.color(mrf.classmask,:), h, w, 3)));
        title(['Class map in cycle ', num2str(cycle)]);
        pause(0.1);
    end
end
