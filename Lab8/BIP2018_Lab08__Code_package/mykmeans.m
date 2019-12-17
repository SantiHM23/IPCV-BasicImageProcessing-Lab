function [LUT, M] = mykmeans(S, k)
    %Initialization in order to create a LUT vector and an M matrix
    [LUT0, M0] = step1_initialization(S, k);   
    t = 0;  %Help variable to count the number of iterations
    thres = 0.02;  %Selected threshold value
    converged = 0;  %It is not converged in the beginning so that the loop works
    
    while converged == 0 && t<100  %Conditions to keep the while loop running
        LUT = step2_assignment(S, k, LUT0, M0);  %Assignment of the final LUT vector
        M = step3_update(S, k, LUT, M0);  %Updating of the final mean vector matrix
        dist = sum(abs(mean(M)-mean(M0)).^2);  %Calculation of the distance between the parameters in the updated and the previous M matrix
        t = t+1;  %Updating of the number of iterations
        if dist<thres
            converged = 1; %Once the distance between parameters is lower than the threshold, there is convergence
        else  
            converged = 0; %Not converged otherwise
        end
        %For the following iteration, the new LUT vector and M matrix will
        %be used as the "old" ones
        LUT0 = LUT;
        M0 = M;
    end

    %In order to know how many iterations were needed
    fprintf('Iteration finished after %d steps.\n', t);

end
