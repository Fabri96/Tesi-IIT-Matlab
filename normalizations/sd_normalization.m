% SD NORMALIZATION FOR THE SIGNAL:
%  
% z = x/sigma  
% 
% Takes as input the neuron activities over time and normalizes them

function sd_data = sd_normalization(data)

sd_data = data;

for j = 2:size(data,2)
    
    sigma = std(data(:,j));
    
    for i = 1:size(data,1)
        sd_data(i,j) = data(i,j)/sigma;
    end
end