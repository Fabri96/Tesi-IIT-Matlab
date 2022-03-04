k=50;
% 
% [~,lengths]= segment_id(left);
% n2 = compute_num_seg(120,lengths) -1;
% 
% [~,lengths]= segment_id(right);
% n = compute_num_seg(120,lengths)-1;

x = obs_activity_test_stress;

y = stress_activity_test2;

x2 = obs_activity_hab_stress;

y2 = stress_activity_hab2;

% x = obs_activity_test_stress(1:sum(lengths(1:n)));
% 
% y = stress_activity_test2(1:sum(lengths(1:n)));
% 
% x2 = obs_activity_hab_stress(1:sum(lengths(1:n)));
% 
% y2 = stress_activity_hab2(1:sum(lengths(1:n)));

x3 = obs_activity_test_neutral;

y3 = neutral_activity_test2;

x4 = obs_activity_hab_neutral;

y4 = neutral_activity_hab2;

% x3 = obs_activity_test_neutral(1:sum(lengths(1:n2)));
% 
% y3 = neutral_activity_test2(1:sum(lengths(1:n2)));
% 
% x4 = obs_activity_hab_neutral(1:sum(lengths(1:n2)));
% 
% y4 = neutral_activity_hab2(1:sum(lengths(1:n2)));

mi_test_stress = mi_cont_cont(x, y, k);

mi_hab_stress = mi_cont_cont(x2, y2, k);

mi_test_neutral = mi_cont_cont(x3, y3, k);

mi_hab_neutral = mi_cont_cont(x4, y4, k);

plot([mi_hab_stress mi_test_stress], 'r-o',LineWidth=2,MarkerSize=15)

hold on

plot([mi_hab_neutral mi_test_neutral], 'b-o',LineWidth=2,MarkerSize=15)
ylim([0,0.7])
legend('obs vs stress', 'obs vs neut')
set(gca,'FontSize',20)