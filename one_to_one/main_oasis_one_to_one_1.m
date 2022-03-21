% Developed by Fabrizio Bernardi  & Greta Fregiari

% MAIN FILE: READ, SPLIT, NORMALIZE AND COMPUTE MEAN ACTIVITY FOR THE 2
% MICE. ZONE ASSIGNMENT, ACTIVITY DETECTION
%  
% (FOR FIRST BATCH OF DATA)

%% Read data, exclude rejected neurons and split 

clear

addpath("../SAVED DATA/ONE_ONE_FIRST/")
addpath("../cross-correlation analysis/")
addpath("../normalizations/")
addpath("../overall activity/")
addpath("..")

load("oasis_mouse_319.mat")
load ("oasis_mouse_2751.mat")
load("oasis_peaks_319.mat")
load("oasis_peaks_2751.mat")
load('zone319_post.mat')
load('zone2751_post.mat')
load('zone319_pre.mat')
load('zone2752_pre.mat')
load('interaction.mat')

%save data with general name per ora non usati
mouse_1=oasis_mouse_319;
mouse_2=oasis_mouse_2751;
peaks_1=oasis_peaks_319;
peaks_2=oasis_peaks_2751;
zone_pre_1=zone319_pre;
zone_pre_2=zone2752_pre;
zone_post_1=zone319_post;
zone_post_2=zone2751_post;
interaction_mice=interaction;

dataset=1;
sd_norm=0;
mm_norm=1;
fs=0.05;

%% SPLIT DATA

[m1_pre, m1_test, m1_post,m2_pre,m2_test,m2_post] = one_one_accept_split(oasis_mouse_319, oasis_mouse_2751,dataset);

%% SD NORMALIZATION
if(sd_norm ==1)
    m1_pre = sd_normalization(m1_pre);
    m1_test = sd_normalization(m1_test);
    m1_post = sd_normalization(m1_post);

    m2_pre = sd_normalization(m2_pre);
    m2_test = sd_normalization(m2_test);
    m2_post = sd_normalization(m2_post);
end
%% MIN MAX NORMALIZATION
if(mm_norm == 1)  
    m1_pre = min_max_normalization(m1_pre);
    m1_test = min_max_normalization(m1_test);
    m1_post = min_max_normalization(m1_post);

    m2_pre = min_max_normalization(m2_pre);
    m2_test = min_max_normalization(m2_test);
    m2_post = min_max_normalization(m2_post);
end

%% data of calcium of mean activity of all neurons with time
m1_activity_test = mice_activity(m1_test);

m1_activity_pre = mice_activity(m1_pre);

m2_activity_test = mice_activity(m2_test);

m2_activity_pre = mice_activity(m2_pre);

m1_activity_post = mice_activity(m1_post);

m2_activity_post = mice_activity(m2_post);

%% data of calcium post/pre when neuron is near/far and data of place of mouse and if it is near o far, with right time
[m1_post_near,m1_post_far,zone_post_m1] = one_one_zones(m1_activity_post,zone319_post);

[m2_post_near,m2_post_far,zone_post_m2] = one_one_zones(m2_activity_post,zone2751_post);

[m1_pre_near,m1_pre_far,zone_pre_m1] = one_one_zones(m1_activity_pre,zone319_pre);

[m2_pre_near,m2_pre_far,zone_pre_m2] = one_one_zones(m2_activity_pre,zone2752_pre);

%% SNIFFING
interaction(:,1) = interaction(:,1)-0.25; % A keys 0.25

interaction(:,1) = interaction(:,1)+m2_activity_test(1,1);

k=find(interaction(:,5)==1); %indici di quando c'è lo sniffing
sniffing_times= interaction(k,1);

m1_sniff = interp1(m1_activity_test(:,1),...
    m1_activity_test(:,2),sniffing_times); %attività in tutti gli istanti di sniffing

m2_sniff = interp1(m2_activity_test(:,1),...
    m2_activity_test(:,2),sniffing_times);

%Istanti in cui sono vicini i topi nel test ( cioè tieni conto anche di
%prima e dopo sniffing)
% Aggiungo in res gli indici di k e anche tm indici prima e dopo gli sniffing.
res=[];
tm=50; %istanti da tener conto prima e dopo sniffing
time_without_sniff= interaction(:,1); %inizializzo tempi senza sniff e interaction
time_without_inter= interaction(:,1);


for i=1:size(k,1)
    time_without_sniff=time_without_sniff(time_without_sniff~=interaction(k(i),1)); %rimuovo tempo in cui ho sniff
    time_without_inter=time_without_inter(time_without_inter~=interaction(k(i),1));
    for tmp=-tm:1:tm
        if((k(i)+tmp)>0 && (k(i)+tmp) < size(interaction,1)) %controlla che indice sia maggiore di zero e che sia minore della lungheza di "interaction"
            if(size(res,1)==0)
                res(size(res,1)+1,1)=k(i)+tmp;
                time_without_sniff=time_without_sniff(time_without_sniff~=interaction(k(i)+tmp,1));
            else
                if(res(size(res,1))<k(i)+tmp)
                     res(size(res,1)+1,1)=k(i)+tmp;
                     time_without_inter=time_without_inter(time_without_inter~=interaction(k(i)+tmp,1));
                end
            end
        end
    end
end

interaction_times= interaction(res,1);

m1_interaction = interp1(m1_activity_test(:,1),...
    m1_activity_test(:,2),interaction_times); %attività in tutti gli istanti trovati con res

m2_interaction = interp1(m2_activity_test(:,1),...
    m2_activity_test(:,2),interaction_times);

m1_no_inter = interp1(m1_activity_test(:,1),...
    m1_activity_test(:,2),time_without_inter); %attività in tutti gli istanti senza interazione

m2_no_inter = interp1(m2_activity_test(:,1),...
    m2_activity_test(:,2),time_without_inter);

m1_no_sniff = interp1(m1_activity_test(:,1),...
    m1_activity_test(:,2),time_without_sniff); %attività in tutti gli istanti senza sniff

m2_no_sniff = interp1(m2_activity_test(:,1),...
    m2_activity_test(:,2),time_without_sniff);

%% Mean value of calcium during sniffing, interaction, no_sniff, no inter, all_test, pre/post_close_zone, pre/post_far_zone

m1_mean_sniff= mean(m1_sniff);
m2_mean_sniff= mean(m2_sniff);

m1_mean_interaction= mean(m1_interaction);
m2_mean_interaction= mean(m2_interaction);

m1_mean_no_sniff= mean(m1_no_sniff);
m2_mean_no_sniff= mean(m2_no_sniff);

m1_mean_no_interaction= mean(m1_no_inter);
m2_mean_no_interaction= mean(m2_no_inter);

m1_mean_test= mean(m1_activity_test(:,2));
m2_mean_test= mean(m2_activity_test(:,2));

m1_mean_pre_near= mean(m1_pre_near);
m2_mean_pre_near= mean(m2_pre_near);

m1_mean_post_near= mean(m1_post_near);
m2_mean_post_near= mean(m2_post_near);

m1_mean_pre_far= mean(m1_pre_far);
m2_mean_pre_far= mean(m2_pre_far);

m1_mean_post_far= mean(m1_post_far);
m2_mean_post_far= mean(m2_post_far);


