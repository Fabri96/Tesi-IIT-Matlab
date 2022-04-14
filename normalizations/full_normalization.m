% FULL SD NORMALIZATION FOR THE SIGNAL:
%  
% z = x/sigma  
% 
% Takes as input the neuron activities over
% time and normalizes them, considering times
% from cage to test

function [new_test_data, new_hab_data ,new_cage_data] =...
     full_normalization(test_data, hab_data, cage_data)

test_length = size(test_data,1)
hab_length = size(hab_data,1)
cage_length = size(cage_data,1)

my_data = [cage_data; hab_data; test_data];
size(my_data)
full_data = my_data;

for j = 2:size(my_data,2)
    
    sigma = std(my_data(:,j));
    
    for i = 1:size(my_data,1)
        full_data(i,j) = my_data(i,j)/sigma;
    end
end

new_cage_data = full_data(1: cage_length,:);

new_hab_data = full_data(cage_length+1: cage_length+hab_length,:);

new_test_data = full_data(cage_length+hab_length+1:...
    cage_length+hab_length+test_length,:);