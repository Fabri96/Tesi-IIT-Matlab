% Developed by Fabrizio Bernardi 

% UNIFORMATION OF TIME SCALE ON THE OBSERVER:
%  
% INPUT --> activities of mice
% 
% OUTPUT --> new values corresponding to the time scale of the reference
% mouse


function [stress_activity_adapted,neutral_activity_adapted, obs_activity_adapted] = ...
 time_adapting(stress_activity,neutral_activity,obs_activity) 

% reference mouse has smallest ending time between 3 mice. Its times start
% at the biggest time between 3 mice (in this way I have a time interval common to all 3)

% here neutral has biggest ending time



maximum = max([obs_activity(1,1),neutral_activity(1,1),stress_activity(1,1)]); 

k =find(neutral_activity(:,1)>maximum);

k = k(1);

neutral_activity_adapted = neutral_activity(k:end,:);

stress_activity_adapted = neutral_activity(k:end,:);

obs_activity_adapted = neutral_activity(k:end,:);

stress_activity_adapted(:,2) = interp1(stress_activity(:,1),stress_activity(:,2),neutral_activity_adapted(:,1));

obs_activity_adapted(:,2) = interp1(obs_activity(:,1),obs_activity(:,2),neutral_activity_adapted(:,1));


