% Developed by Fabrizio Bernardi 

% MAIN FILE: READ, SPLIT, NORMALIZE AND COMPUTE MEAN ACTIVITY FOR THE 3
% MICE. ZONE ASSIGNMENT, ACTIVITY DETECTION
%  
% (FOR FIRST BATCH OF DATA)




addpath('zone analysis','normalizations','overall activity','statistics',...
    'activity detection','ROI analysis','cross-correlation analysis');

addpath('SAVED DATA\DATA_FIRST\');

clearvars -except corr  L2_errors Inf_errors hab_act1 ...
    test_act1 hab_act2 test_act2 hab_act3 test_act3 hab_act4 test_act4 ...
    hab_mean_obs_neutral  hab_max_obs_neutral ...
c_matrix_neutral_hab hab_mean_obs_stress hab_max_obs_stress ...
c_matrix_stress_hab fs dt step

close all

load('neutral_data.mat')

load('obs_data.mat')

load('stress_data.mat')

load('hab_zone.mat')

load('test_zone.mat')

load('sniff.mat')

mm_norm = 0; % 1 for using min-max normalization
z_norm =0;
dataset=1;
selection=0; % 1 for neuron selection option

%% Read data, exclude rejected neurons and split 
fs=0.125; % sampling in zone file

[stress, stress_cage, stress_hab, stress_test, ...
    neutral, neutral_cage, neutral_hab, neutral_test,...
    obs, obs_cage, obs_hab, obs_test,sniff] =...
    accept_and_split(stress_data, neutral_data, obs_data,sniff,1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[stress_cage, stress_hab, stress_test, ...
    neutral_cage, neutral_hab, neutral_test, obs_cage, obs_hab, obs_test] = ...
 t_adapting(stress_cage, stress_hab, stress_test, ...
    neutral_cage, neutral_hab, neutral_test, obs_cage, obs_hab, obs_test);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% REMOVE BAD NEURONS
obs_test(:,[2 8 end])=[];
neutral_test(:,[5 10])=[];
obs_hab(:,[2 8 end])=[];
neutral_hab(:,[5 10])=[];

%% NEURON SELECTION OPTION
if(selection==1)
 obs_test(:,[3 5 6])=[];
neutral_test(:,[4 6 7])=[];
stress_test(:,[5 7 8 10 12 22:24 28:32 34:end])=[];
end

%% MIN-MAX NORMALIZATION

if(mm_norm == 1)
    
obs_test = min_max_normalization(obs_test);
stress_test = min_max_normalization(stress_test);
neutral_test = min_max_normalization(neutral_test);


obs_hab = min_max_normalization(obs_hab);
stress_hab = min_max_normalization(stress_hab);
neutral_hab = min_max_normalization(neutral_hab);
end
%% Z NORMALIZATION
if(z_norm ==1)
obs_test = z_score_normalization(obs_test);
stress_test = z_score_normalization(stress_test);
neutral_test = z_score_normalization(neutral_test);

obs_hab = z_score_normalization(obs_hab);
stress_hab = z_score_normalization(stress_hab);
neutral_hab = z_score_normalization(neutral_hab);
end
% obs_test=obs_test(:,[1 3 5 6]);
% obs_test = cage_normalization(obs_test,obs_cage);
% stress_test = cage_normalization(stress_test,stress_cage);
% neutral_test = cage_normalization(neutral_test,neutral_cage);
% 
% 
% obs_hab = cage_normalization(obs_hab,obs_cage);
% stress_hab = cage_normalization(stress_hab,stress_cage);
% neutral_hab = cage_normalization(neutral_hab,neutral_cage);
%% MEAN ACTIVITIES
obs_activity_test = mice_activity(obs_test);
% obs_activity_test=z_score_normalization(obs_activity_test);

neutral_activity_test = mice_activity(neutral_test);
% neutral_activity_test=z_score_normalization(neutral_activity_test);

stress_activity_test = mice_activity(stress_test);
% stress_activity_test=z_score_normalization(stress_activity_test);

obs_activity_hab = mice_activity(obs_hab);
% obs_activity_hab=z_score_normalization(obs_activity_hab);

neutral_activity_hab = mice_activity(neutral_hab);
% neutral_activity_hab=z_score_normalization(neutral_activity_hab);


stress_activity_hab = mice_activity(stress_hab);
% stress_activity_hab=z_score_normalization(stress_activity_hab);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% plot of activities and errors

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


zone_plot(ad_test_zone,dataset);

xlabel('time')
ylabel('Ca activity')
title('Observer activity during test')
set(gca,'FontSize',15)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Detection of active neurons

detector = activity_detector(obs_test);

number = 6;

figure

subplot(1,2,1)

detector_plot(obs_test, number)

title('Standard threshold')
set(gca,'FontSize',20)
subplot(1,2,2)

plot_mad(obs_test, number)

title('MAD threshold')
set(gca,'FontSize',20)

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
