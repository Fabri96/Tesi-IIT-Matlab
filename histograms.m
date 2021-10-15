% Developed by Fabrizio Bernardi 

% HISTOGRAMS

 
figure

min_max_obs_activity = min_max_normalization(obs_activity_test);

min_max_stress_activity = min_max_normalization(stress_activity_test);

min_max_neutral_activity = min_max_normalization(neutral_activity_test);

distr1 = fitdist(min_max_obs_activity(:,2),'gamma');


subplot(1,3,1);
histfit(min_max_obs_activity(:,2),40,'gamma')
title('Observer activity distribution')
legend('Frequencies','\Gamma(a,b)')

subplot(1,3,2);
histfit(min_max_stress_activity(:,2),40,'gamma')
title('Stressed activity distribution')
legend('Frequencies','\Gamma(a,b)')

subplot(1,3,3);
histfit(min_max_neutral_activity(:,2),40,'gamma')
title('Neutral activity distribution')
legend('Frequencies','\Gamma(a,b)')







