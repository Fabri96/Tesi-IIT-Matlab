function w_activity = weighted_activity(data, weights)

w_activity = zeros(size(data,1),2); % 2 columns, times and mean activity

w_activity(:,1) = data(:,1); % first column with times

for i = 1:size(data,1)  %second column with the means of neuron's activities
    w_activity(i,2) = (data(i,2:end)*weights') /sum(weights);
end