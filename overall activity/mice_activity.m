% Developed by Fabrizio Bernardi 

% Takes as input the (normalized) matrix of neural activity in one mice and returns the
% mean of all neurons activity at a specific time
% 
% 


function m_activity = mice_activity(data)

m_activity = zeros(size(data,1),2); % 2 columns, times and mean activity

m_activity(:,1) = data(:,1); % first column with times

for i = 1:size(data,1)  %second column with the means of neuron's activities
    m_activity(i,2) = mean(data(i,2:end));
end


% plot(m_activity(:,1),m_activity(:,2),'g-')