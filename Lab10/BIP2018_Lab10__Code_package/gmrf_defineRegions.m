function mrf = gmrf_defineRegions(params, mrf)

    % Initialize an empty cell to store the rectangles
    rects=cell(1,params.NumOfClasses);

    % For every class, define a region using two points
    for ind=1:params.NumOfClasses

        tmp = ginput(2);
        p1 = tmp(1,:); 
        p2 = tmp(2,:);

        r.y1=round(min(p1(2),p2(2)));
        r.y2=round(max(p1(2),p2(2)));
        r.x1=round(min(p1(1),p2(1)));
        r.x2=round(max(p1(1),p2(1)));
        rects{ind}=r;

        % show the region boundary as a rectangle
        rectangle('Position', [r.x1 r.y1 r.x2-r.x1 r.y2-r.y1], 'LineWidth',1,'EdgeColor','r')
    end

    % For every class, compute the Gaussian distribution describing the
    % selected region
    for ind=1:params.NumOfClasses
        
         r = rects{ind};  %Rectangle
        
         %Crop the relevant part of the input image
         Crop = params.InputImage(r.y1:r.y2, r.x1:r.x2);
         
         %Compute the mean and standard deviation of the pixel intensities of the cropped region
         %Cropping has to be done in a double type image
         mean_c = mean(double(Crop(:)));
         std_dev_c = std(double(Crop(:)));
         
         %Storing of the mean and standard deviation in the MRF model
         mrf.gauss_params{ind}.mean = mean_c;
         mrf.gauss_params{ind}.dev = std_dev_c;
         
         %Compute the normal probability density function of the input image.
         I_npdf = normpdf(double(params.InputImage), mrf.gauss_params{ind}.mean, mrf.gauss_params{ind}.dev);
         
         %Logaritmic probabilities of the image
         mrf.logProbs{ind} = -log(I_npdf);
    end

    % Also, copy the constants defined in params to the GMRF model:
    mrf.Beta        = params.Beta;
    mrf.DeltaUmin   = params.DeltaUmin;
    mrf.T0          = params.T0;
    mrf.c           = params.c;
    
    mrf.imagesize   = size(params.InputImage);
    
    mrf.InitMethod  = params.InitMethod;
    mrf.OptiMethod  = params.OptiMethod;
    
end