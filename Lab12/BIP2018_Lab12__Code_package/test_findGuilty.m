close all;
clear;

[HOG_differences, guilty_index] = pmHOG_findGuilty();

figure;
bar(1./HOG_differences);
title(strcat('Likelihood of being a culprit is maximal for Suspect #', num2str(guilty_index)));
xlabel('suspect ID-s');
ylabel('likelihood of being a bad guy');
