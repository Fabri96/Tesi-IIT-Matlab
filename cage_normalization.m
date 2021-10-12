% Developed by Fabrizio Bernardi 

% CAGE NORMALIZATION FOR THE SIGNAL:
%  
% x' = (x-mu)/sigma   mu, sigma are average and std on homecage 
% 
% Takes as input the neuron activities over time and cage activities and
% normalizes the first based on the second


function norm_cage_data = cage_normalization(data, cage_data)

norm_cage_data = data;

for j = 2:size(data,2)
    mu = mean(cage_data(:,j));
    sigma = std(cage_data(:,j));
    for i = 1:size(data,1)
        norm_cage_data(i,j) = (data(i,j) - mu)/sigma;
    end
end