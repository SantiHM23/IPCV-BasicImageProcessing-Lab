function mrf=gmrf_doMMD(mrf)

         cmap = load('MRF_colormap.mat');
            h = mrf.imagesize(1);
            w = mrf.imagesize(2);
         cnum = mrf.classnum;
         beta = mrf.Beta;
    DeltaUmin = mrf.DeltaUmin;
            T = mrf.T0;
            c = mrf.c;       

             
           cycle = 0;
    summa_deltaE = 2 * DeltaUmin; % the first iteration is guaranteed

    while summa_deltaE > DeltaUmin 
        
        %Set the summa of deltaE to zero and increment the cycle counter
        summa_deltaE = 0;
        cycle = cycle+1;
        
        for y = 1:w
            for x = 1:h
                
                %Get the current class label at the actual pixel
                C = mrf.classmask(y, x);
                
                %Get the class label of the neighboring pixels.
                Cn(1) = mrf.classmask(max(y-1, 1),           x); %Neighbour W
                Cn(2) = mrf.classmask(min(y+1, h),           x); %Neighbour E
                Cn(3) = mrf.classmask(          y, max(x-1, 1)); %Neighbour N
                Cn(4) = mrf.classmask(          y, min(x+1, w)); %Neighbour S
                Cn(5) = mrf.classmask(max(1, y-1), max(1, x-1)); %Neighbour NW
                Cn(6) = mrf.classmask(max(1, y-1), min(w, x+1)); %Neighbour SW
                Cn(7) = mrf.classmask(min(h, y+1), max(1, x-1)); %Neighbour NE
                Cn(8) = mrf.classmask(min(h, y+1), min(w, x+1)); %Neighbour SE
                
                %Actual posterior probability
                PosPr = mrf.logProbs{C}(y, x);
                
                %Initialization of the actual prior probability
                PriorPr = 0;
                
                for i = 1:8 %For every neighbour pixel
                    if Cn(i) == C %Class of the neighbour is the same as the pixel
                        b = -beta;
                    else %Class of the neighbour is different as the pixel
                        b = beta;
                    end
                    PriorPr = PriorPr + b; %Sum the beta values to get the prior probability
                end
                
                %Formula of the actual energy
                U_act = PosPr + PriorPr;
                
                %Initialization of the new class being the same as the actual class
                NewC = C;
                
                while NewC == C %We want the new class to be different
                    NewC = ceil(cnum*rand()); %New class generated randomly
                end
                
                %Posterior probability of the new class
                NewPosPr = mrf.logProbs{NewC}(y, x);
                
                %Prior probability of the new class (analog calculation as in the current one
                NewPriorPr = 0;
                
                for i = 1:8
                    if Cn(i) == NewC
                        b = -beta;
                    else
                        b = beta;
                    end
                    NewPriorPr = NewPriorPr + b;
                end
                
                %Formula of the new energy
                U_new = NewPosPr + NewPriorPr;
                
                %Compute the energy change
                dU = U_new - U_act;
                
                %Conditions to change the class of the pixel in the mask
                if dU < 0 || rand() < exp(-dU/T)  %Que epsilon usar
                    summa_deltaE = summa_deltaE + abs(dU);
                    mrf.classmask(y,x) = NewC;
                end
              
            end
        end
        
        %Update the temperature
        T = c*T;
        
        imshow(uint8(255*reshape(cmap.color(mrf.classmask,:), h, w, 3)));
        title(['Class map in cycle ', num2str(cycle)]);
        pause(0.1);
    end
end
