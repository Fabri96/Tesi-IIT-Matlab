
%% DATASET1
% main --> 2 5 6 7 8 for observer
% 1 2 4 7 8 9 for neutral
% 1 2 3 8 10 12 12 18 20 24 25 26 32 for stressed

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
