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



function [stress, stress_cage, stress_hab, stress_test] = accept_and_split(stress_data) 

stress=stress_data(2:end,1); % first column (times)

for j = 2:size(stress_data,2)  % add column if the correspondent neuron is accepted
    if stress_data(1,j) == " accepted"
        stress = [stress stress_data(2:end,j)];
    end
end

stress = double(stress);

k1 = find(stress(:,1) < 500);  % To find last index corresponding to homecage
k1 = k1(end);

k2 = find(stress(:,1) < 1600); % To find last index corresponding to habituation
k2=k2(end);

stress_cage = stress(1:k1,:);

stress_hab = stress(k1+1:k2,:);

stress_test = stress(k2+1:end,:);