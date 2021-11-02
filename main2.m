% Developed by Fabrizio Bernardi 

% MAIN FILE: READ, SPLIT, NORMALIZE AND COMPUTE MEAN ACTIVITY FOR THE 3
% MICE. ZONE ASSIGNMENT, ACTIVITY DETECTION
%  
% (FOR FIRST BATCH OF DATA)

%%% Read data, exclude rejected neurons and split 


addpath('zone analysis','normalizations','overall activity','statistics',...
    'activity detection');

addpath('DATA_SECOND');

clear all
close all



load('neutral_data_cage2.mat')

load('neutral_data_habtest2.mat')

load('obs_data2.mat')

load('stress_data2.mat')

load('hab_zone2.mat')

load('test_zone2.mat')

load('sniff2.mat')

pairings = neutral_data_cage2(1:2,20:35);

[neutral_data2] = neutral_fixing(neutral_data_cage2, neutral_data_habtest2,pairings);

[stress, stress_cage, stress_hab, stress_test, ...
    neutral, neutral_cage, neutral_hab, neutral_test,...
    obs, obs_cage, obs_hab, obs_test,sniff] = ...
    accept_and_split(stress_data2(2:end,:), neutral_data2(2:end,:), obs_data2(2:end,:),sniff2(2:end,:)) ;


[stress_cage, stress_hab, stress_test, ...
    neutral_cage, neutral_hab, neutral_test, obs_cage, obs_hab, obs_test] = ...
 t_adapting(stress_cage, stress_hab, stress_test, ...
    neutral_cage, neutral_hab, neutral_test, obs_cage, obs_hab, obs_test);


obs_activity_test = mice_activity(obs_test);

neutral_activity_test = mice_activity(neutral_test(:,[1:3 7:17]));

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
