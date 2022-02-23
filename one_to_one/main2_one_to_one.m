% Developed by Fabrizio Bernardi 

% MAIN FILE: READ, SPLIT, NORMALIZE AND COMPUTE MEAN ACTIVITY FOR THE 3
% MICE. ZONE ASSIGNMENT, ACTIVITY DETECTION
%  
% (FOR FIRST BATCH OF ONE-TO-ONE DATA)

clear all
% addpath('C:\Users\Fabrizio\Desktop\data_analysis_MATLAB\')
addpath('SAVED DATA\ONE_ONE_SECOND\');


load('mouse318.mat')
load('mouse317.mat')

load('zone317_post.mat')
load('zone318_post.mat')

load('zone317_pre.mat')
% load('zone318_pre.mat')

load('interaction.mat')

d=2; % SECOND DATASET

z=1; % z-score norm

%% ATTENZIONE MANCA PRE-TEST DEL TOPO 318

%% SPLIT DATA

[m1_pre, m1_test, m1_post,m2_pre,m2_test,m2_post] = one_one_accept_split(mouse317, mouse318,d);

m1_test(:,[7 9]) = [];
m1_activity_test = mice_activity(m1_test);
% m1_activity_test=m1_activity_test-mean(m1_activity_test);

if(z==1)

m1_test = z_score_normalization(m1_test);

m1_pre = z_score_normalization(m1_pre);

m1_post = z_score_normalization(m1_post);

m2_test = z_score_normalization(m2_test);

m2_pre = z_score_normalization(m2_pre);

m2_post = z_score_normalization(m2_post);

end

m1_activity_pre = mice_activity(m1_pre);

m2_activity_test = mice_activity(m2_test);
% m2_activity_test=m2_activity_test-mean(m2_activity_test);
m2_activity_pre = mice_activity(m2_pre);

m1_activity_post = mice_activity(m1_post);

m2_activity_post = mice_activity(m2_post);
% 

m1_activity_test(:,2) = (m1_activity_test(:,2) ...
    -mean(m1_activity_test(:,2)))/std(m1_activity_test(:,2));

m2_activity_test(:,2) = (m2_activity_test(:,2) ...
    -mean(m2_activity_test(:,2)))/std(m2_activity_test(:,2));

m1_activity_pre(:,2) = (m1_activity_pre(:,2) ...
    -mean(m1_activity_pre(:,2)))/std(m1_activity_pre(:,2));

m2_activity_post(:,2) = (m2_activity_post(:,2) ...
    -mean(m2_activity_post(:,2)))/std(m2_activity_post(:,2));

m2_activity_pre(:,2) = (m2_activity_pre(:,2) ...
    -mean(m2_activity_pre(:,2)))/std(m2_activity_pre(:,2));

m2_activity_post(:,2) = (m2_activity_post(:,2) ...
    -mean(m2_activity_post(:,2)))/std(m2_activity_post(:,2));

[m2_post_near,m2_post_far,zone_post_m2] = one_one_zones(m2_activity_post,zone_318_post);

[m1_post_near,m1_post_far,zone_post_m1] = one_one_zones(m1_activity_post,zone317_post);

% [m2_pre_near,m2_pre_far,zone_pre_m2] = one_one_zones(m2_activity_pre,zone318_pre);

[m1_pre_near,m1_pre_far,zone_pre_m1] = one_one_zones(m1_activity_pre,zone317_pre);

interaction(:,1) = interaction(:,1)-0.236;
interaction(:,1) = interaction(:,1)+m2_activity_test(1,1);
k=find(interaction(:,5)==1);
interaction_times= interaction(k,1);
m1_sniff = interp1(m1_activity_test(:,1),...
    m1_activity_test(:,2),interaction_times);

m2_sniff = interp1(m2_activity_test(:,1),...
    m2_activity_test(:,2),interaction_times);

