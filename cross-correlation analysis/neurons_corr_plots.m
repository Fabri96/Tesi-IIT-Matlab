% Developed by Fabrizio Bernardi  

% Plots of the correlation matrices of neuron pairs using neurons_corr
% function

% dataset = 3; %select the dataset you are working on


if(dataset ==1 || dataset ==3)

%     ad_test_zone = adapt_zone(test_zone, obs_activity_test);
% 
%     ad_hab_zone = adapt_zone(hab_zone,obs_activity_hab);
% 
%     [ left, right ,intermediate] = detect_areas(ad_test_zone);
% 
%     [ left2, right2 ,intermediate2] = detect_areas(ad_hab_zone);

    [~,a]=neurons_corr(obs_test,stress_test,right,"stressed","test");

    [~,a1]=neurons_corr(obs_test,neutral_test,left,"neutral","test");

    [~,a2]=neurons_corr(obs_hab,stress_hab,right2,"stressed","habituation");

    [~,a3]=neurons_corr(obs_hab,neutral_hab,left2,"neutral","habituation");

end

if(dataset == 2)

%     ad_test_zone = adapt_zone(test_zone2, obs_activity_test);
% 
%     ad_hab_zone = adapt_zone(hab_zone2,obs_activity_hab);
% 
%     [ left, right ,intermediate] = detect_areas(ad_test_zone);
% 
%     [ left2, right2 ,intermediate2] = detect_areas(ad_hab_zone);

    [~,a1]=neurons_corr(obs_test,neutral_test,right,"neutral","test");

    [~,a]=neurons_corr(obs_test,stress_test,left,"stressed","test");

    [~,a2]=neurons_corr(obs_hab,neutral_hab,right2,"neutral","habituation");

    [~,a3]=neurons_corr(obs_hab,stress_hab,left2,"stressed","habituation");

end


if(dataset == 4)

%     ad_test_zone = adapt_zone(test_zone, obs_activity_test);
% 
%     ad_hab_zone = adapt_zone(hab_zone,obs_activity_hab);
% 
%     [ left, right ,intermediate] = detect_areas(ad_test_zone);
% 
%     [ left2, right2 ,intermediate2] = detect_areas(ad_hab_zone);

    [~,a1]=neurons_corr(obs_test,neutral_test,right,"neutral","test");

    [~,a]=neurons_corr(obs_test,stress_test,left,"stressed","test");

    [~,a2]=neurons_corr(obs_hab,neutral_hab,right2,"neutral","habituation");

    [~,a3]=neurons_corr(obs_hab,stress_hab,left2,"stressed","habituation");

end

