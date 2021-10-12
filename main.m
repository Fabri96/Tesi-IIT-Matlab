% Developed by Fabrizio Bernardi 

% MAIN FILE: READ, SPLIT, NORMALIZE AND COMPUTE MEAN ACTIVITY FOR THE 3
% MICE. ZONE ASSIGNMENT, ACTIVITY DETECTION
%  
% 

%%% Read data, exclude rejected neurons and split 
[stress, stress_cage, stress_hab, stress_test] = accept_and_split(stress_data);

[neutral, neutral_cage, neutral_hab, neutral_test] = accept_and_split(neutral_data);

[obs, obs_cage, obs_hab, obs_test] = accept_and_split(obs_data);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Normalize data (test part as example)
obs_test_z = z_score_normalization(obs_test);

stress_test_z = z_score_normalization(stress_test);

neutral_test_z = z_score_normalization(neutral_test);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% compute mean activity on mice

obs_activity_test = mice_activity(obs_test);

neutral_activity_test = mice_activity(neutral_test);

stress_activity_test = mice_activity(stress_test);

% obs_activity_hab = mice_activity(obs_hab);
% 
% neutral_activity_hab = mice_activity(neutral_hab);
% 
% stress_activity_hab = mice_activity(stress_hab);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% adapt time scales to one common to all 3 mice

[stress_activity_adapted,neutral_activity_adapted, obs_activity_adapted] = ...
 time_adapting(stress_activity_test,neutral_activity_test,obs_activity_test);

% [stress_activity_adapted,neutral_activity_adapted, obs_activity_adapted] = ...
%  time_adapting(stress_activity_hab,neutral_activity_hab,obs_activity_hab);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% plot of activities and errors

% figure
% 
% plot(neutral_activity_adapted(:,1),neutral_activity_adapted(:,2),'r-')
% 
% hold on
% 
% plot(obs_activity(:,1),obs_activity(:,2),'b-')
% 
% plot(stress_activity_adapted(:,1),stress_activity_adapted(:,2),'g-')


immse(obs_activity_adapted(:,2),stress_activity_adapted(:,2));

immse(obs_activity_adapted(:,2),neutral_activity_adapted(:,2));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Enters the zone file: observer observer activity vs observer position

ad_zone = adapt_zone(test_zone, obs_activity_adapted);

% plot3(ad_test_zone(:,2), ad_test_zone(:,3),ad_test_zone(:,1))

% plot3(ad_test_zone(:,2), ad_test_zone(:,3),ad_test_zone(:,7))


% zone_plot

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Detection of active neurons

detector = activity_detector(obs_test_z);

%detector_plot(obs_test_z, detector, number)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Histograms

histograms;

figure

mean_and_var(obs_test);





