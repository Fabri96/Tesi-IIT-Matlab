% Developed by Fabrizio Bernardi 

% Z-SCORE NORMALIZATION FOR THE SIGNAL:
%  
% z = (x-mu)/sigma  
% 
% Takes as input the neuron activities over time and normalizes them

function z_data = z_score_normalization(data)

z_data = data;

for j = 2:size(data,2)
    mu = mean(data(:,j));
    sigma = std(data(:,j));
    for i = 1:size(data,1)
        z_data(i,j) = (data(i,j) - mu)/sigma;
    end
end