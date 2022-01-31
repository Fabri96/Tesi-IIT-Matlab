
%% DATASET 1
% 2 5 6 7 8 for observer
% 1 2 4 7 8 9 for neutral
% 1 2 3 8 10 12 12 18 20 24 25 26 32 for stressed

%% DATASET 1
% 2 5 6 7 8 for observer
% 1 2 4 7 8 9 for neutral
% 1 2 3 8 10 12 12 18 20 24 25 26 32 for stressed


%% DATASET 3
% 1 2 7 11 13 for observer
% 4 7 8 9 for neutral
% 1:3 7:12 16:23 25:27 29:31 34:end for stressed

%% DATASET 4
% 4 8 10 for observer
% 7 9 for neutral
% 2 4 5 7 10 13:15 19 20 23 24 26 28 34:37 39 41 43:47 49 for stressed


neurons_corr_plots;
close all
sum_obs_stress = sum(a');

sum_obs_neut = sum(a1');

sum_stress = sum(a);

sum_neut = sum(a1);

heatmap(sum_obs_stress)
title('obs vs stress')

figure
heatmap(sum_obs_neut)
title('obs vs neut')

figure
heatmap(sum_neut)
title(' neut')

figure
heatmap(sum_stress)
title('stress')
