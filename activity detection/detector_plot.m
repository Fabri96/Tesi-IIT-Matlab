% Developed by Fabrizio Bernardi 

% PLOT FOR ACTIVITY DETECTOR
%  
% INPUT --> data matrix, neuron (number) you want to analyze (column of
% data)
% 
% OUTPUT --> plots 


function detector_plot(data, number)

% detector = activity_detector(data);

 mu = mean(data(:,number)); 
sigma = std(data(:,number));

% regions = find(detector(:,number)==1);

plot(data(:,1), data(:,number), 'b-')
% plot(data(:,1), data(:,number), 'b-*','MarkerIndices',regions ,...
%     'MarkerSize',2,'MarkerEdgeColor','k')

hold on
yline(mu + 2*sigma,'r--', 'Linewidth',4)

xlabel('time(s)')
ylabel('Calcium activity')





