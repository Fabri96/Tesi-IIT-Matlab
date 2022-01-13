% Developed by Fabrizio Bernardi 

% MAIN FILE: READ, SPLIT, NORMALIZE AND COMPUTE MEAN ACTIVITY FOR THE 3
% MICE. ZONE ASSIGNMENT, ACTIVITY DETECTION
%  
% (FOR FIRST BATCH OF DATA)




addpath('zone analysis','normalizations','overall activity','statistics',...
    'activity detection','ROI analysis','correlation analysis');

addpath('SAVED DATA\DATA_FIRST\');

clearvars -except corr  L2_errors Inf_errors hab_act1 test_act1 hab_act2 test_act2 hab_act3 test_act3 hab_act4 test_act4
close all

load('neutral_data.mat')

load('obs_data.mat')

load('stress_data.mat')

load('hab_zone.mat')

load('test_zone.mat')

load('sniff.mat')

dataset=1;
%%% Read data, exclude rejected neurons and split 


[stress, stress_cage, stress_hab, stress_test, ...
    neutral, neutral_cage, neutral_hab, neutral_test,...
    obs, obs_cage, obs_hab, obs_test,sniff] =...
    accept_and_split(stress_data, neutral_data, obs_data,sniff,1);

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
% obs_test(:,[2 8])=[];
% neutral_test(:,[5 10])=[];


% obs_test=obs_test(:,[3 6 7 8 9]);
% neutral_test=neutral_test(:,[3 6 7 8 9]);


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


zone_plot(ad_test_zone);

xlabel('time')
ylabel('Ca activity')
title('Observer activity during test')
set(gca,'FontSize',15)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Detection of active neurons

% detector = activity_detector(obs_test);

number = 6;

figure

subplot(1,2,1)

detector_plot(obs_test, number)

title('Standard treshold')
set(gca,'FontSize',15)
subplot(1,2,2)

plot_mad(obs_test, number)

title('MAD algorithm treshold')
set(gca,'FontSize',15)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Histograms

% histograms;
% 
% 
% mean_and_var(obs_test);

[ left, right ,intermediate] = detect_areas(ad_test_zone);

[ left2, right2 ,intermediate2] = detect_areas(ad_hab_zone);


% observer activity when he is close to stressed
obs_activity_test_stress = interp1(obs_activity_test(:,1),obs_activity_test(:,2), right);

% observer activity when he is close to neutral
obs_activity_test_neutral = interp1(obs_activity_test(:,1),obs_activity_test(:,2), left);

% stressed activity when he is close to observer
stress_activity_test2 = interp1(stress_activity_test(:,1),stress_activity_test(:,2), right);

% neutral activity when he is close to observer
neutral_activity_test2 = interp1(neutral_activity_test(:,1),neutral_activity_test(:,2), left);


obs_activity_hab_stress = interp1(obs_activity_hab(:,1),obs_activity_hab(:,2), right2);

obs_activity_hab_neutral = interp1(obs_activity_hab(:,1),obs_activity_hab(:,2), left2);

stress_activity_hab2 = interp1(stress_activity_hab(:,1),stress_activity_hab(:,2), right2);

neutral_activity_hab2 = interp1(neutral_activity_hab(:,1),neutral_activity_hab(:,2), left2);
