% Developed by Fabrizio Bernardi 

% MIN-MAX NORMALIZATION FOR THE SIGNAL:
%  
% x' = (x-min(x))/(max(x)-min(x)) 
% 
% Takes as input the neuron activities over time and normalizes them

function min_max_data = min_max_normalization(data)

min_max_data = data;

for j = 2:size(data,2)
    minimum = min(data(:,j));
    maximum = max(data(:,j));
    for i = 1:size(data,1)
        min_max_data(i,j) = (data(i,j) - minimum)/(maximum-minimum);
    end
end
        
    
    