function correlations_change(obs_activity_test,stress_activity_test,neutral_activity_test,...
    obs_activity_hab,stress_activity_hab,neutral_activity_hab)

obs_stress_hab_corr = corr(obs_activity_hab(:,2),stress_activity_hab(:,2));

obs_stress_test_corr = corr(obs_activity_test(:,2),stress_activity_test(:,2));

obs_neutral_hab_corr = corr(obs_activity_hab(:,2),neutral_activity_hab(:,2));

obs_neutral_test_corr = corr(obs_activity_test(:,2),neutral_activity_test(:,2));

figure

y = [ obs_stress_test_corr obs_stress_hab_corr ; obs_neutral_test_corr obs_neutral_hab_corr];


subplot(1,2,1)
bar(y)


[c,lags] = xcorr(obs_activity_test(:,2),stress_activity_test(:,2),'normalized');

[c2,lags2] = xcorr(obs_activity_hab(:,2),stress_activity_hab(:,2),'normalized');
 
subplot(1,2,2)
 stem(lags,c)
 
 hold on
 
  stem(lags2,c2)