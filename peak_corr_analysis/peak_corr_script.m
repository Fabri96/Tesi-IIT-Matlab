% Developed by Fabrizio Bernardi 

% Compute peak correlations in every mouse
%  





roi_analysis_hab;
close all
AA_neutral_hab = [zeros(size(A_neutral_hab,2),1) A_neutral_hab'];
AA_obs_hab = [zeros(size(A_obs_hab,2),1) A_obs_hab'];
AA_stress_hab = [zeros(size(A_stress_hab,2),1) A_stress_hab'];


dt = 0.8;
fs=0.25;
c_matrix= corr_matrix_single_mouse(AA_neutral_hab,dt,fs);
hab_max_neutral = max(abs(c_matrix(:)));

hab_mean_neutral = mean(nonzeros(c_matrix(:)));

c_matrix= corr_matrix_single_mouse(AA_obs_hab,dt,fs);
hab_max_obs = max(abs(c_matrix(:)));

hab_mean_obs = mean(nonzeros(c_matrix(:)));

c_matrix= corr_matrix_single_mouse(AA_stress_hab,dt,fs);
hab_max_stress = max(abs(c_matrix(:)));

hab_mean_stress = mean(nonzeros(c_matrix(:)));

roi_analysis;
close all
AA_neutral_test = [zeros(size(A_neutral,2),1) A_neutral'];
AA_obs_test = [zeros(size(A_obs ,2),1) A_obs'];
AA_stress_test = [zeros(size(A_stress,2),1) A_stress'];


dt = 0.8;
c_matrix= corr_matrix_single_mouse(AA_neutral_test,dt,fs);
test_max_neutral = max(abs(c_matrix(:)));

test_mean_neutral = mean(nonzeros(c_matrix(:)));

c_matrix= corr_matrix_single_mouse(AA_obs_test,dt,fs);
test_max_obs = max(abs(c_matrix(:)));

test_mean_obs = mean(nonzeros(c_matrix(:)));

c_matrix= corr_matrix_single_mouse(AA_stress_test,dt,fs);
test_max_stress = max(abs(c_matrix(:)));

test_mean_stress = mean(nonzeros(c_matrix(:)));

aa= categorical({'Habituation','Test'});

figure
subplot(2,1,1)
plot(aa,[hab_max_stress,test_max_stress],'r-o','LineWidth',4)
hold on
plot(aa,[hab_max_obs,test_max_obs],'k-o','LineWidth',4)
plot(aa,[hab_max_neutral,test_max_neutral],'b-o','LineWidth',4)
legend('stressed','observer','neutral')
title('Maximum peak-correlation')
set(gca,'FontSize',20)
grid on


subplot(2,1,2)

plot(aa,[hab_mean_stress,test_mean_stress],'r-o','LineWidth',4)


hold on

plot(aa,[hab_mean_obs,test_mean_obs],'k-o','LineWidth',4)
plot([hab_mean_neutral,test_mean_neutral],'b-o','LineWidth',4)
legend('stressed', 'observer','neutral')
title ('Average peak-correlation')
set(gca,'FontSize',20)
grid on
