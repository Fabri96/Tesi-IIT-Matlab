% Developed by Fabrizio Bernardi 

% UNIFORMATION OF TIME SCALE ON THE OBSERVER:
%  
% INPUT --> activities of mice
% 
% OUTPUT --> new values corresponding to the time scale of the reference
% mouse


function [stress_cage, stress_hab, stress_test, ...
    neutral_cage, neutral_hab, neutral_test, obs_cage, obs_hab, obs_test] = ...
 t_adapting(stress_cage, stress_hab, stress_test, ...
    neutral_cage, neutral_hab, neutral_test, obs_cage, obs_hab, obs_test) 

%cage data

neutral_cage(end,:) = [];
cage_min = min([stress_cage(end,1),neutral_cage(end,1),obs_cage(end,1)]); 

k_stress_cage = find(stress_cage(:,1)< cage_min);

k_stress_cage = k_stress_cage(end);

stress_cage = stress_cage(1:k_stress_cage,:);

cage_times = stress_cage(:,1);

%hab data

hab_min = min([neutral_hab(end,1),obs_hab(end,1),stress_hab(end,1)]); 

hab_max = max([neutral_hab(1,1),obs_hab(1,1),stress_hab(1,1)]);

k1_stress_hab = find(stress_hab(:,1)> hab_max);

k1_stress_hab = k1_stress_hab(1);

k2_stress_hab =find(stress_hab(:,1)< hab_min);

k2_stress_hab = k2_stress_hab(end);

stress_hab = stress_hab(k1_stress_hab:k2_stress_hab,:);

hab_times = stress_hab(:,1);

% test data

test_min = min([neutral_test(end,1),obs_test(end,1),stress_test(end,1)]); 

test_max = max([neutral_test(1,1),obs_test(1,1),stress_test(1,1)]);

k1_stress_test = find(stress_test(:,1)> test_max);

k1_stress_test = k1_stress_test(1);

k2_stress_test =find(stress_test(:,1)< test_min);

k2_stress_test = k2_stress_test(end);

stress_test = stress_test(k1_stress_test:k2_stress_test,:);

test_times = stress_test(:,1);



neutral_cage_ad(:,1) = cage_times;

neutral_hab_ad(:,1) = hab_times;

neutral_test_ad(:,1)= test_times;

obs_cage_ad(:,1) = cage_times;

obs_hab_ad(:,1) = hab_times;

obs_test_ad(:,1)= test_times;

stress_cage_ad = stress_cage;

stress_hab_ad = stress_hab;

stress_test_ad= stress_test;



for j = 2:size(obs_cage,2)
    
obs_cage_ad(:,j) = interp1(obs_cage(:,1),obs_cage(:,j),cage_times);

obs_hab_ad(:,j) = interp1(obs_hab(:,1),obs_hab(:,j),hab_times);

obs_test_ad(:,j) = interp1(obs_test(:,1),obs_test(:,j),test_times);

end



for j = 2:size(neutral_cage,2)
    
neutral_cage_ad(:,j) = interp1(neutral_cage(:,1),neutral_cage(:,j),cage_times);

neutral_hab_ad(:,j) = interp1(neutral_hab(:,1),neutral_hab(:,j),hab_times);

neutral_test_ad(:,j) = interp1(neutral_test(:,1),neutral_test(:,j),test_times);

end



stress_cage = stress_cage_ad ;
stress_hab = stress_hab_ad;
stress_test = stress_test_ad;
neutral_cage = neutral_cage_ad;
neutral_hab = neutral_hab_ad;
neutral_test = neutral_test_ad;
obs_cage = obs_cage_ad;
obs_hab = obs_hab_ad;
obs_test = obs_test_ad;



