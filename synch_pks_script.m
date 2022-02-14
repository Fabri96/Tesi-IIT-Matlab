if(dataset==1)
    fs = 0.129;
end

if(dataset==2)
    fs=0.05;
end

if(dataset==3)
    fs=0.1273;
end

if(dataset==4)
    fs=0.1264;
end

[pks_obs_stress,locs_obs_stress] = findpeaks(obs_activity_test_stress,...
    'MinPeakHeight',mean(obs_activity_test_stress)+std(obs_activity_test_stress) ...
   , 'MinPeakDistance',6);

[pks_obs_stress_hab,locs_obs_stress_hab] = findpeaks(obs_activity_hab_stress,...
    'MinPeakHeight',mean(obs_activity_hab_stress)+std(obs_activity_hab_stress));

[pks_obs_neutral,locs_obs_neutral] = findpeaks(obs_activity_test_neutral,...
    'MinPeakHeight',mean(obs_activity_test_neutral)+std(obs_activity_test_neutral));

[pks_obs_neutral_hab,locs_obs_neutral_hab] = findpeaks(obs_activity_hab_neutral,...
    'MinPeakHeight',mean(obs_activity_hab_neutral)+std(obs_activity_hab_neutral));

[pks_stress,locs_stress] = findpeaks(stress_activity_test2,...
    'MinPeakHeight',mean(stress_activity_test2)+std(stress_activity_test2));

[pks_neutral,locs_neutral] = findpeaks(neutral_activity_test2,...
    'MinPeakHeight',mean(neutral_activity_test2)+std(neutral_activity_test2));

[pks_stress_hab,locs_stress_hab] = findpeaks(stress_activity_hab2,...
    'MinPeakHeight',mean(stress_activity_hab2)+std(stress_activity_hab2));

[pks_neutral_hab,locs_neutral_hab] = findpeaks(neutral_activity_hab2,...
    'MinPeakHeight',mean(neutral_activity_hab2)+std(neutral_activity_hab2));


synch_window = round(1/fs); % window of 2 seconds

synch_pks_obs_stress = synch_pks(locs_obs_stress,locs_stress,synch_window);

synch_pks_obs_neutral = synch_pks(locs_obs_neutral,locs_neutral,synch_window);

synch_pks_obs_stress_hab = synch_pks(locs_obs_stress_hab,locs_stress_hab,synch_window);

synch_pks_obs_neutral_hab = synch_pks(locs_obs_neutral_hab,locs_neutral_hab,synch_window);


aa= categorical({'Habituation','Test'});


plot(aa,[synch_pks_obs_stress_hab synch_pks_obs_stress],'r--o',...
    LineWidth=2,MarkerSize=15)

hold on

plot(aa,[synch_pks_obs_neutral_hab synch_pks_obs_neutral],'b--o',...
    LineWidth=2,MarkerSize=15)

title('Average simultaneous peaks index')
legend('obs vs stressed','obs vs neutral')

set(gca,'FontSize',20)