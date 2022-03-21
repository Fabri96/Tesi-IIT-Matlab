% Developed by Fabrizio Bernardi 

% MAIN FILE: READ, SPLIT, NORMALIZE AND COMPUTE MEAN ACTIVITY FOR THE 3
% MICE. ZONE ASSIGNMENT, ACTIVITY DETECTION
%  
% (FOR FIRST BATCH OF ONE-TO-ONE DATA)

clear all

addpath('SAVED DATA\ONE_ONE_FIRST\');
addpath('normalizations\');
addpath('overall activity\');

load('mouse2751.mat') %
load('mouse319.mat')

load('zone319_post.mat')
load('zone2751_post.mat')

load('zone319_pre.mat')
load('zone2752_pre.mat')

load('interaction.mat')

d=1; % FIRST DATASET

z_norm =1; % z-score normalization switch

%% SPLIT DATA

[m1_pre, m1_test, m1_post,m2_pre,m2_test,m2_post] = one_one_accept_split(mouse2751, mouse319,d);

m1_test(:,7)=[];
m2_test(:,[5 13 14])=[];

m1_activity_test = mice_activity(m1_test);
%% Z NORMALIZATION
if(z_norm ==1)
m1_pre = z_score_normalization(m1_pre);
m1_test = z_score_normalization(m1_test);
m1_post = z_score_normalization(m1_post);

m2_pre = z_score_normalization(m2_pre);
m2_test = z_score_normalization(m2_test);
m2_post = z_score_normalization(m2_post);
end

m1_activity_pre = mice_activity(m1_pre);

m2_activity_test = mice_activity(m2_test);

m2_activity_pre = mice_activity(m2_pre);

m1_activity_post = mice_activity(m1_post);

m2_activity_post = mice_activity(m2_post);




[m2_post_near,m2_post_far,zone_post_m2] = one_one_zones(m2_activity_post,zone319_post);

[m1_post_near,m1_post_far,zone_post_m1] = one_one_zones(m1_activity_post,zone2751_post);

[m2_pre_near,m2_pre_far,zone_pre_m2] = one_one_zones(m2_activity_pre,zone319_pre);

[m1_pre_near,m1_pre_far,zone_pre_m1] = one_one_zones(m1_activity_pre,zone2752_pre);

interaction(:,1) = interaction(:,1)-0.25; % A keys
interaction(:,1) = interaction(:,1)+m2_activity_test(1,1);
k=find(interaction(:,5)==1);
interaction_times= interaction(k,1);
m1_sniff = interp1(m1_activity_test(:,1),...
    m1_activity_test(:,2),interaction_times);

m2_sniff = interp1(m2_activity_test(:,1),...
    m2_activity_test(:,2),interaction_times);



 