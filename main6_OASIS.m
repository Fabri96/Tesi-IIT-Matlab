addpath('zone analysis','normalizations','overall activity','statistics',...
    'activity detection','ROI analysis','cross-correlation analysis');

addpath('SAVED DATA\DATA_SIXTH\');
clearvars -except corr  L2_errors  hab_act1 ...
    test_act1 hab_act2 test_act2 hab_act3 test_act3 hab_act4 test_act4
 close all

load('hab_zone.mat')

load('test_zone.mat')

% load('sniff.mat')

load('stress_OASIS6.mat')

load('obs_OASIS6.mat')

load('neutral_OASIS6.mat')


mm_norm = 0; % 1 for using min-max normalization
sd_norm =1;
dataset=6;
selection=0; % 1 for neuron selection option
sniff=[];

[stress, stress_cage, stress_hab, stress_test, ...
    neutral, neutral_cage, neutral_hab, neutral_test,...
    obs, obs_cage, obs_hab, obs_test,sniff] =...
    accept_and_split(stress_OASIS6, neutral_OASIS6, obs_OASIS6,sniff,dataset);


 neutral_test(:,1) = neutral_test(:,1)+  1.8010;
stress_test(:,1) = stress_test(:,1) + 2.5460;


[stress_cage, stress_hab, stress_test, ...
    neutral_cage, neutral_hab, neutral_test, obs_cage, obs_hab, obs_test] = ...
 t_adapting(stress_cage, stress_hab, stress_test, ...
    neutral_cage, neutral_hab, neutral_test, obs_cage, obs_hab, obs_test);
%% MEAN ACTIVITIES

stress_test(:,6) = [];

neutral_test(:,[ 15]) = [];


if(sd_norm == 1)
    
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


obs_activity_test = mice_activity(obs_test);

neutral_activity_test = mice_activity(neutral_test);

stress_activity_test = mice_activity(stress_test);

obs_activity_hab = mice_activity(obs_hab);

neutral_activity_hab = mice_activity(neutral_hab);

stress_activity_hab = mice_activity(stress_hab);

obs_activity_cage = mice_activity(obs_cage);

neutral_activity_cage = mice_activity(neutral_cage);

stress_activity_cage = mice_activity(stress_cage);

  test_zone(:,1) = test_zone(:,1) - 0.0893;

ad_test_zone = adapt_zone(test_zone, obs_activity_test);



% plot3(ad_test_zone(:,2), ad_test_zone(:,3),ad_test_zone(:,7))

ad_hab_zone = adapt_zone(hab_zone, obs_activity_hab);


zone_plot(ad_test_zone,dataset);

fs=ad_test_zone(16,1)-ad_test_zone(15,1);


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