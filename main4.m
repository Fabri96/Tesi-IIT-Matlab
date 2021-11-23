% Developed by Fabrizio Bernardi 

% MAIN FILE: READ, SPLIT, NORMALIZE AND COMPUTE MEAN ACTIVITY FOR THE 3
% MICE. ZONE ASSIGNMENT, ACTIVITY DETECTION
%  
% (FOR FOURTH BATCH OF DATA)



addpath('zone analysis','normalizations','overall activity','statistics',...
    'activity detection','ROI analysis','correlation analysis');

addpath('SAVED DATA\DATA_FOURTH\');

clearvars -except corr  L2_errors Inf_errors
close all

load('neutral_data.mat')

load('obs_data.mat')

load('stress_data.mat')

load('hab_zone.mat')

load('test_zone.mat')

load('sniff.mat')

%%% Read data, exclude rejected neurons and split 
dataset=4;


[stress, stress_cage, stress_hab, stress_test, ...
    neutral, neutral_cage, neutral_hab, neutral_test,...
    obs, obs_cage, obs_hab, obs_test,sniff] =...
    accept_and_split(stress_data, neutral_data, obs_data,sniff,4);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[stress_cage, stress_hab, stress_test, ...
    neutral_cage, neutral_hab, neutral_test, obs_cage, obs_hab, obs_test] = ...
 t_adapting(stress_cage, stress_hab, stress_test, ...
    neutral_cage, neutral_hab, neutral_test, obs_cage, obs_hab, obs_test);

% %%% Normalize data (test part as example)
% obs_test_z = z_score_normalization(obs_test);
% 
% stress_test_z = z_score_normalization(stress_test);
% 
% neutral_test_z = z_score_normalization(neutral_test);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% compute mean activity on mice
sniff(1,:) = zeros(1,size(sniff,2));
sniff(:,1) = sniff(:,1) + obs_test(1,1);

obs_activity_test = mice_activity(obs_test);

neutral_activity_test = mice_activity(neutral_test);

stress_activity_test = mice_activity(stress_test);

obs_activity_hab = mice_activity(obs_hab);

neutral_activity_hab = mice_activity(neutral_hab);

stress_activity_hab = mice_activity(stress_hab);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% plot of activities and errors

% figure
% 
% plot(neutral_activity_test(:,1),neutral_activity_test(:,2),'r-')
% 
% hold on
% 
% plot(obs_activity_test(:,1),obs_activity_test(:,2),'b-')
% 
% plot(stress_activity_test(:,1),stress_activity_test(:,2),'g-')


% immse(obs_activity_test(:,2),stress_activity_test(:,2));
% 
% immse(obs_activity_test(:,2),neutral_activity_test(:,2));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Enters the zone file: observer activity vs observer position

ad_test_zone = adapt_zone(test_zone, obs_activity_test);

% plot3(ad_test_zone(:,2), ad_test_zone(:,3),ad_test_zone(:,7))

ad_hab_zone = adapt_zone(hab_zone, obs_activity_hab);


% zone_plot(ad_test_zone);
% 
% xlabel('time')
% ylabel('Ca activity')
% title('Observer activity during test')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Detection of active neurons

% detector = activity_detector(obs_test);

number = 6;

figure

subplot(1,2,1)

detector_plot(obs_test, number)

title('Standard treshold')

subplot(1,2,2)

plot_mad(obs_test, number)

title('MAD algorithm treshold')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Histograms

% histograms;
% 
% 
% mean_and_var(obs_test);

[ left, right ,intermediate] = detect_areas(ad_test_zone);

[ left2, right2 ,intermediate2] = detect_areas(ad_hab_zone);


