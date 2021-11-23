% Developed by Fabrizio Bernardi 

% Function which takes as input a string array of data (times and neurons
% activities), deletes the rejected neurons and return numerical matrices: 
%
% stress --> all the values of accepted neurons
% stress_cage --> only for homecage part (first 5 minutes)
% stress_hab --> only for habituation (15 minutes)
% stress_test --> only for test (15 minutes)



% ATTENTION! Same function used also for neutral and observed mice, just change return
% matrices names when called. Example: 
%  << [neutral, neutral_cage, neutral_hab, neutral_test] = accept_and_split(neutral_data)



function [stress, stress_cage, stress_hab, stress_test, ...
    neutral, neutral_cage, neutral_hab, neutral_test,...
    obs, obs_cage, obs_hab, obs_test,sniff] = ...
    accept_and_split(stress_data, neutral_data, obs_data,sniff,dataset) 

stress=stress_data(2:end,1); % first column (times)

for j = 2:size(stress_data,2)  % add column if the correspondent neuron is accepted
    if stress_data(1,j) == " accepted"
        stress = [stress stress_data(2:end,j)];
    end
end

stress = double(stress);

neutral=neutral_data(2:end,1); % first column (times)

for j = 2:size(neutral_data,2)  % add column if the correspondent neuron is accepted
    if neutral_data(1,j) == " accepted"
        neutral = [neutral neutral_data(2:end,j)];
    end
end

neutral = double(neutral);


obs=obs_data(2:end,1); % first column (times)

for j = 2:size(obs_data,2)  % add column if the correspondent neuron is accepted
    if obs_data(1,j) == " accepted"
        obs = [obs obs_data(2:end,j)];
    end
end

obs = double(obs);

if(dataset == 1)

  sniff_adapting %adapt times based on A keybord references
  
  k2_obs = 24173;

k2_neutral = 24173;

k2_stress = 24096;

k1_obs = 6159;

k1_neutral = 6159;

k1_stress = 6081;

end

if(dataset==2)

 sniff_adapting
 

k2_obs = 24184;

k2_neutral = 24152;

k2_stress = 24190;

k1_obs = 6171;

k1_neutral = 6138;

k1_stress = 6176;

end

if(dataset == 3)

  sniff_adapting %adapt times based on A keybord references
  
  k2_obs = 24198;

k2_neutral = 24170;

k2_stress = 24110;

k1_obs = 6181;

k1_neutral = 6153;

k1_stress = 6092;

end

if(dataset == 4)

%   sniff_adapting %adapt times based on A keybord references
  
  k2_obs = 25104;

k2_neutral = 25128;

k2_stress = 25172;

k1_obs = 6072;

k1_neutral = 6077;

k1_stress = 6096;

end

stress_cage = stress(1:k1_stress-1,:);
stress_hab  = stress(k1_stress:k2_stress-1,:);
stress_test  = stress(k2_stress:end,:);
neutral_cage = neutral(1:k1_neutral-1,:);
neutral_hab = neutral(k1_neutral:k2_neutral-1,:); 
neutral_test = neutral(k2_neutral:end,:);
 obs_cage = obs(1:k1_obs-1,:);
 obs_hab = obs(k1_obs:k2_obs-1,:);
 obs_test = obs(k2_obs:end,:);

