% Developed by Fabrizio Bernardi 

% MAIN FILE: READ, SPLIT, NORMALIZE AND COMPUTE MEAN ACTIVITY FOR THE 3
% MICE. ZONE ASSIGNMENT, ACTIVITY DETECTION
%  
% (FOR FIRST BATCH OF DATA)

%%% Read data, exclude rejected neurons and split 



addpath('zone analysis','normalizations','overall activity','statistics',...
    'activity detection','ROI analysis','cross-correlation analysis');

addpath('SAVED DATA\DATA_SECOND\');

clearvars -except corr  L2_errors stress_hab_act1 stress_hab_act1 ...
    stress_cage_act1 stress_test_act1 neutral_test_act1 neutral_hab_act1 ...
 neutral_cage_act1   obs_test_act1 obs_hab_act1 obs_cage_act1 ...
 avg_test_stress1 avg_test_neut1 avg_sniff_stress1 avg_sniff_neut1 avg_interm1...
 stress_close1 stress_sniff1 stress_far1 neutral_close1 neutral_sniff1 ...
 neutral_far1 t_obs_stress1 t_obs_neut1 t_interm1 t_obs_stress1_hab ...
 t_obs_neut1_hab t_interm1_hab c_first lags_first c2_first lags2_first ...
 c3_first lags3_first c4_first lags4_first c5_first lags5_first ...
c6_first lags6_first
close all



load('neutral_oasis_cage2.mat')

load('neutral_oasis_habtest2.mat')

load('obs_oasis2.mat')

load('stress_oasis2.mat')

load('hab_zone2.mat')

load('test_zone2.mat')

load('sniff2.mat')
dataset=2;
sd_norm=1;
mm_norm=0;

fs=0.05;
% pairings = neutral_data_cage2(1:2,20:35);

% [neutral_data2] = neutral_fixing(neutral_data_cage2, neutral_data_habtest2,pairings);
neutral_oasis_habtest2 = double(neutral_oasis_habtest2);
neutral_oasis_habtest2(2:end,1) = neutral_oasis_habtest2(2:end,1)+396.185;
neutral_oasis_habtest2=string(neutral_oasis_habtest2);
neutral_data2 = [neutral_oasis_cage2(:,1:end-1) ; neutral_oasis_habtest2(2:end,:)];

[stress, stress_cage, stress_hab, stress_test, ...
    neutral, neutral_cage, neutral_hab, neutral_test,...
    obs, obs_cage, obs_hab, obs_test,sniff] = ...
    accept_and_split(stress_oasis2, neutral_data2, obs_oasis2,sniff2,dataset) ;


[stress_cage, stress_hab, stress_test, ...
    neutral_cage, neutral_hab, neutral_test, obs_cage, obs_hab, obs_test] = ...
 t_adapting(stress_cage, stress_hab, stress_test, ...
    neutral_cage, neutral_hab, neutral_test, obs_cage, obs_hab, obs_test);


obs_test(:,[ 10 11 16 18]) = [];

neutral_test(:,2) = [];

stress_test(:,21)=[];
%% NEURON SELECTION OPTION
%  obs_test(:,[5 13 ])=[];
% neutral_test(:,[2:9 13])=[];
% stress_test(:,[ 6 9 10 11 12 13 15 16 20 21 22 23 25 27 28 30 31 32 33])=[];
%%%
%% Z NORMALIZATION
if(sd_norm ==1)
obs_test = sd_normalization(obs_test);
stress_test = sd_normalization(stress_test);
neutral_test = sd_normalization(neutral_test);

obs_hab = sd_normalization(obs_hab);
stress_hab = sd_normalization(stress_hab);
neutral_hab = sd_normalization(neutral_hab);

obs_cage = sd_normalization(obs_cage);
stress_cage = sd_normalization(stress_cage);
neutral_cage = sd_normalization(neutral_cage);
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

obs_activity_cage = mice_activity(obs_cage);

neutral_activity_cage = mice_activity(neutral_cage);

stress_activity_cage = mice_activity(stress_cage);

ad_test_zone = adapt_zone(test_zone2, obs_activity_test);

ad_hab_zone = adapt_zone(hab_zone2, obs_activity_hab);

zone_plot(ad_test_zone,dataset);

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