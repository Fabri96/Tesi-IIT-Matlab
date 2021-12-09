% Developed by Fabrizio Bernardi 

% Compute peak synchronization between mice
%  




roi_analysis_hab;
close all
dt = 0.8;
c_matrix= corr_matrix_two_mice(A_obs_stress_hab,A_stress_hab,dt);
hab_max_obs_stress = max(abs(c_matrix(:)));

hab_mean_obs_stress = mean(nonzeros(c_matrix(:)));



c_matrix= corr_matrix_two_mice(A_obs_neutral_hab,A_neutral_hab,dt);
hab_max_obs_neutral = max(abs(c_matrix(:)));

hab_mean_obs_neutral = mean(nonzeros(c_matrix(:)));

roi_analysis;
close all
dt = 0.8;
c_matrix= corr_matrix_two_mice(A_obs_stress,A_stress,dt);
obs_stress = sum(c_matrix');
stress_obs = sum(c_matrix);
test_max_obs_stress = max(abs(c_matrix(:)));

test_mean_obs_stress = mean(nonzeros(c_matrix(:)));



c_matrix= corr_matrix_two_mice(A_obs_neutral,A_neutral,dt);
test_max_obs_neutral = max(abs(c_matrix(:)));
obs_neut = sum(c_matrix');
neut_obs = sum(c_matrix);
test_mean_obs_neutral = mean(nonzeros(c_matrix(:)));


aa= categorical({'Habituation','Test'});

figure
subplot(2,1,1)
plot(aa,[hab_max_obs_stress,test_max_obs_stress],'r-o','LineWidth',4)
hold on

plot(aa,[hab_max_obs_neutral,test_max_obs_neutral],'b-o','LineWidth',4)
legend('obs vs stressed','obs vs neutral')
title('Maximum peak-correlation')
set(gca,'FontSize',20)
grid on


subplot(2,1,2)

plot(aa,[hab_mean_obs_stress,test_mean_obs_stress],'r-o','LineWidth',4)
hold on

plot(aa,[hab_mean_obs_neutral,test_mean_obs_neutral],'b-o','LineWidth',4)
legend('obs vs stressed','obs vs neutral')
title ('Average peak-correlation')
set(gca,'FontSize',20)
grid on
