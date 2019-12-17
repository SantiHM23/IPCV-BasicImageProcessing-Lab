function norm_HOG = pmHOG_extractHOG(I)

   [h, w] = size(I);  %Size of the input image
   %1. Calculate the number of cells along the vertical and horizontal dimension of the image
   cells_h = h/8;
   cells_w = w/8;
   %2. Initialize an empty histogram matrix
   norm_HOG = zeros(cells_h-1, cells_w-1, 36);
   block_hor = 0; %Help variable to know in which row of the histogram matrix we are working on
   block_ver = 0; %Help variable to know in which column of the histogram matrix we are working on
   
   for i = 1:8:(h-cells_h)
       block_hor = block_hor+1; %Following row
       for j = 1:8:(w-cells_w)
           if j == 1 %Every time we start a new row
               block_ver = 0;  %Set column counter to zero
           end
           block_ver = block_ver+1; %Following column
           %Select the 16x16 pixel-sized sub-matrix from the grayscale image according to the block position
           I_cropped = I(i:i+16-1, j:j+16-1);
           %Apply Gaussian filtering
           I_gaussfil = imgaussfilt(I_cropped, 0.1);
           %initialize an empty 1x36 histogram vector to the specific block
           hist_v = [];
           [m, n] = size(I_gaussfil); %Size of the filtered image
           for x = 1:8:m
               for y = 1:8:n
                   %Select the cell’s sub-matrix from the block
                   Cell = I_gaussfil(x:x+7, y:y+7);
                   %Calculate the phase and magnitude values
                   [PHI, MAG] = pmHOG_gradient(Cell);
                   %Calculate the histogram belonging to this cell
                   H = pmHOG_binner(PHI, MAG);
                   %Save the histogram into the histogram vector to the appropriate position
                   hist_v = [hist_v,H];
               end
           end
           %Calculate the sum of the current block
           s = sum(hist_v(:));
           %Divide every element of the histogram vector by the calculated sum
           norm_hist_v = hist_v / s;
           %Save the normalized histogram vector to the appropriate position of the histogram matrix
           norm_HOG(block_hor, block_ver, :) = norm_hist_v;
       end
   end
    
end
