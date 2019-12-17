imshow(params.InputImage); hold on;
spy(params.extrema{1}(:,:,1), 'g');
spy(params.filtered{1}(:,:,1), 'co');
spy(params.eliminated{1}(:,:,1), 'yx');