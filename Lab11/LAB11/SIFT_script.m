% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% This script is the simplified version of the original Matlab SIFT demo  %
% written by 'Diddi' in 2014. Redistribution and use in source and binary %
% forms, with or without modification, are permitted provided that redis- %
% tributions of source code must retain the above copyright notice, this  %
% list of conditions and the following disclaimer; and redistributions in %
% binary form must reproduce the above copyright notice, this list of     %
% conditions and the following disclaimer in the documentation and/or     %
% other materials provided with the distribution.                         %
%                                                                         %
% The present code is being used for educational purposes at the          %
% Pazmany Peter Catholic University, Budapest, Hungary                    %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
clear; close all; clc;

% ================ Please, set the following parameters ================ %
params.InputImgPath = 'input/rosslyn_a.jpg';

params.NumOfOctaves = 3;
params.NumOfLayers  = 3;
params.DefaultSigma = sqrt(2);
params.UnstableExtremaThreshold = 0.03;
params.EdgeEliminationThreshold = (10 + 1)^2 / 10;

% =================== Do not modify below this line! =================== %

params = sift_preprocess_image(params);
params = sift_build_pyramid(params);
params = sift_find_extrema(params);
params = sift_keypoint_localization(params);
params = sift_eliminate_edge_responses(params);

SIFT = sift_generate_descriptors(params);

