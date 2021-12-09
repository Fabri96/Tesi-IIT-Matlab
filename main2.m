% Developed by Fabrizio Bernardi 

% MAIN FILE: READ, SPLIT, NORMALIZE AND COMPUTE MEAN ACTIVITY FOR THE 3
% MICE. ZONE ASSIGNMENT, ACTIVITY DETECTION
%  
% (FOR FIRST BATCH OF DATA)

%%% Read data, exclude rejected neurons and split 



addpath('zone analysis','normalizations','overall activity','statistics',...
    'activity detection','ROI analysis','correlation analysis');

addpath('SAVED DATA\DATA_SECOND\');

clearvars -except corr  L2_errors Inf_errors hab_act1 test_act1 hab_act2 test_act2 hab_act3 test_act3 hab_act4 test_act4
close all



load('neutral_data_cage2.mat')

load('neutral_data_habtest2.mat')

load('obs_data2.mat')

load('stress_data2.mat')

load('hab_zone2.mat')

load('test_zone2.mat')

load('sniff2.mat')
dataset=2;

pairings = neutral_data_cage2(1:2,20:35);

[neutral_data2] = neutral_fixing(neutral_data_cage2, neutral_data_habtest2,pairings);

[stress, stress_cage, stress_hab, stress_test, ...
    neutral, neutral_cage, neutral_hab, neutral_test,...
    obs, obs_cage, obs_hab, obs_test,sniff] = ...
    accept_and_split(stress_data2(2:end,:), neutral_data2(2:end,:), obs_data2(2:end,:),sniff2(2:end,:),2) ;


[stress_cage, stress_hab, stress_test, ...
    neutral_cage, neutral_hab, neutral_test, obs_cage, obs_hab, obs_test] = ...
 t_adapting(stress_cage, stress_hab, stress_test, ...
    neutral_cage, neutral_hab, neutral_test, obs_cage, obs_hab, obs_test);

neutral_test = neutral_test(:,[1:3 7:end]);

neutral_hab = neutral_hab(:,[1:3 7:end]);

obs_activity_test = mice_activity(obs_test);

neutral_activity_test = mice_activity(neutral_test);

stress_activity_test = mice_activity(stress_test);




obs_activity_hab = mice_activity(obs_hab);

neutral_activity_hab = mice_activity(neutral_hab);

stress_activity_hab = mice_activity(stress_hab);

ad_test_zone = adapt_zone(test_zone2, obs_activity_test);

ad_hab_zone = adapt_zone(hab_zone2, obs_activity_hab);

zone_plot(ad_test_zone);

xlabel('time')
ylabel('Ca activity')
title('Observer activity during test')

number = 2;

figure

subplot(1,2,1)

detector_plot(obs_test, number)

title('Standard treshold')

subplot(1,2,2)

plot_mad(obs_test, number)

title('MAD algorithm treshold')

[ left, right ,intermediate] = detect_areas(ad_test_zone);

[ left2, right2 ,intermediate2] = detect_areas(ad_hab_zone);

% observer activity when he is close to stressed
obs_activity_test_stress = interp1(obs_activity_test(:,1),obs_activity_test(:,2), left);

% observer activity when he is close to neutral
obs_activity_test_neutral = interp1(obs_activity_test(:,1),obs_activity_test(:,2), right);

% stressed activity when he is close to observer
stress_activity_test2 = interp1(stress_activity_test(:,1),stress_activity_test(:,2), left);

% neutral activity when he is close to observer
neutral_activity_test2 = interp1(neutral_activity_test(:,1),neutral_activity_test(:,2), right);


obs_activity_hab_stress = interp1(obs_activity_hab(:,1),obs_activity_hab(:,2), left2);

obs_activity_hab_neutral = interp1(obs_activity_hab(:,1),obs_activity_hab(:,2), right2);

stress_activity_hab2 = interp1(stress_activity_hab(:,1),stress_activity_hab(:,2), left2);

neutral_activity_hab2 = interp1(neutral_activity_hab(:,1),neutral_activity_hab(:,2), right2);