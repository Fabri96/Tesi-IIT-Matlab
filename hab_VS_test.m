% Developed by Fabrizio Bernardi 

% Plots of overall activity change from habituation to test
% Normalization of data over the homecage period

% normc_obs_test = cage_normalization(obs_test, obs_cage);
% 
% normc_obs_hab = cage_normalization(obs_hab, obs_cage);
% 
% normc_stress_test = cage_normalization(stress_test, stress_cage);
% 
% normc_stress_hab = cage_normalization(stress_hab, stress_cage);
% 
% normc_neutral_test = cage_normalization(neutral_test, neutral_cage);
% 
% normc_neutral_hab = cage_normalization(neutral_hab, neutral_cage);


% figure
% 
% 
% subplot(1,3,1)
% title('Activity from habituation to test in observer')
% 
% hold on
% 
% for j = 2:size(normc_obs_test,2)
%     
%     plot([mean(normc_obs_hab(:,j))  mean(normc_obs_test(:,j))], 'r--')
%     
% end
% 
% plot([mean(mean(normc_obs_hab(:,2:end))) mean(mean(normc_obs_test(:,2:end)))],...
%     'k-', 'Linewidth',4)
% 
% subplot(1,3,2)
% 
% title('Activity from habituation to test in stressed')
% 
% hold on
% 
% for j = 2:size(normc_stress_test,2)
%     
%     plot([mean(normc_stress_hab(:,j))  mean(normc_stress_test(:,j))], 'r--')
%     
% end
% 
% plot([mean(mean(normc_stress_hab(:,2:end))) mean(mean(normc_stress_test(:,2:end)))],...
%     'k-', 'Linewidth',4)
% 
% 
% subplot(1,3,3)
% 
% title('Activity from habituation to test in neutral')
% 
% hold on
% 
% for j = 2:size(normc_neutral_test,2)
%     
%     plot([mean(normc_neutral_hab(:,j))  mean(normc_neutral_test(:,j))], 'r--')
%     
% end
% 
% plot([mean(mean(normc_neutral_hab(:,2:end))) mean(mean(normc_neutral_test(:,2:end)))],...
%     'k-', 'Linewidth',4)





figure


subplot(1,3,1)
title('Activity from habituation to test in observer')

hold on

for j = 2:size(obs_test,2)
    
    plot([mean(obs_hab(:,j))  mean(obs_test(:,j))], 'r--')
    
end

plot([mean(mean(obs_hab(:,2:end))) mean(mean(obs_test(:,2:end)))],...
    'k-', 'Linewidth',4)

subplot(1,3,2)

title('Activity from habituation to test in stressed')

hold on

for j = 2:size(stress_test,2)
    
    plot([mean(stress_hab(:,j))  mean(stress_test(:,j))], 'r--')
    
end

plot([mean(mean(stress_hab(:,2:end))) mean(mean(stress_test(:,2:end)))],...
    'k-', 'Linewidth',4)


subplot(1,3,3)

title('Activity from habituation to test in neutral')

hold on

for j = 2:size(neutral_test,2)
    
    plot([mean(neutral_hab(:,j))  mean(neutral_test(:,j))], 'r--')
    
end

plot([mean(mean(neutral_hab(:,2:end))) mean(mean(neutral_test(:,2:end)))],...
    'k-', 'Linewidth',4)