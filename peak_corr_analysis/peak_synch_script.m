% Developed by Fabrizio Bernardi 

% Compute peak synchronization between mice
%  


step=10;
peak_script;
% roi_analysis_hab;
close all
fs=step*0.05;
dt = 3*fs;

c_matrix_stress_hab= corr_matrix_two_mice(A_obs_stress_hab',A_stress_hab',dt,fs);
hab_max_obs_stress = max(abs(c_matrix_stress_hab(:)));

% hab_mean_obs_stress = mean(nonzeros(c_matrix_stress_hab(:)));
hab_mean_obs_stress = mean(c_matrix_stress_hab(:));


c_matrix_neutral_hab= corr_matrix_two_mice(A_obs_neutral_hab',A_neutral_hab',dt,fs);
hab_max_obs_neutral = max(abs(c_matrix_neutral_hab(:)));

% hab_mean_obs_neutral = mean(nonzeros(c_matrix_neutral_hab(:)));
hab_mean_obs_neutral = mean(c_matrix_neutral_hab(:));

% roi_analysis_cage;
% close all
% fs=step*0.05;
% dt = 3*fs;
% 
% c_matrix_stress_cage= corr_matrix_two_mice(A_obs_stress_cage,A_stress_cage,dt,fs);
% cage_max_obs_stress = max(abs(c_matrix_stress_cage(:)));
% 
% cage_mean_obs_stress = mean(nonzeros(c_matrix_stress_cage(:)));
% 
% 
% 
% c_matrix_neutral_cage= corr_matrix_two_mice(A_obs_neutral_cage,A_neutral_cage,dt,fs);
% cage_max_obs_neutral = max(abs(c_matrix_neutral_cage(:)));
% 
% cage_mean_obs_neutral = mean(nonzeros(c_matrix_neutral_cage(:)));


% main;
% close all
% roi_analysis;
% close all

c_matrix_stress_test= corr_matrix_two_mice(A_obs_stress',AA_stress',dt,fs);
obs_stress = sum(c_matrix_stress_test');
stress_obs = sum(c_matrix_stress_test);
test_max_obs_stress = max(abs(c_matrix_stress_test(:)));

% test_mean_obs_stress = mean(nonzeros(c_matrix_stress_test(:)));

test_mean_obs_stress = mean(c_matrix_stress_test(:));

c_matrix_neutral_test= corr_matrix_two_mice(A_obs_neutral',AA_neutral',dt,fs);
test_max_obs_neutral = max(abs(c_matrix_neutral_test(:)));
obs_neut = sum(c_matrix_neutral_test');
neut_obs = sum(c_matrix_neutral_test);
% test_mean_obs_neutral = mean(nonzeros(c_matrix_neutral_test(:)));
test_mean_obs_neutral = mean(c_matrix_neutral_test(:));

aa= categorical({'Habituation','Test'});

figure
subplot(2,1,1)
plot(aa,[hab_max_obs_stress,test_max_obs_stress],'r--o',LineWidth=2,MarkerSize=15)
hold on

plot(aa,[hab_max_obs_neutral,test_max_obs_neutral],'b--o',LineWidth=2,MarkerSize=15)
legend('obs vs stressed','obs vs neutral')
title('Maximum peak-correlation')
set(gca,'FontSize',20)
grid on
ylim([0 4])

subplot(2,1,2)

plot(aa,[hab_mean_obs_stress,test_mean_obs_stress],'r--o',LineWidth=2,MarkerSize=15)
hold on

plot(aa,[hab_mean_obs_neutral,test_mean_obs_neutral],'b--o',LineWidth=2,MarkerSize=15)
legend('obs vs stressed','obs vs neutral')
title ('Average peak-correlation')
set(gca,'FontSize',20)
grid on
ylim([0.3 0.6])
% aa= categorical({'Cage','Test'});

% figure
% subplot(2,1,1)
% plot(aa,[cage_max_obs_stress,test_max_obs_stress],'r-o','LineWidth',4)
% hold on
% 
% plot(aa,[cage_max_obs_neutral,test_max_obs_neutral],'b-o','LineWidth',4)
% legend('obs vs stressed','obs vs neutral')
% title('Maximum peak-correlation')
% set(gca,'FontSize',20)
% grid on

% 
% subplot(2,1,2)

% figure
% 
% plot(aa,[cage_mean_obs_stress,test_mean_obs_stress],'r-o','LineWidth',4)
% hold on
% 
% plot(aa,[cage_mean_obs_neutral,test_mean_obs_neutral],'b-o','LineWidth',4)
% legend('obs vs stressed','obs vs neutral')
% title ('Average peak-correlation')
% set(gca,'FontSize',20)
% grid on
