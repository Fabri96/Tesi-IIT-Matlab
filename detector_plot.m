% Developed by Fabrizio Bernardi 

% PLOT FOR ACTIVITY DETECTOR
%  
% INPUT --> data matrix, detector matrix computed using the
% treshold and neuron you want to analyze
% 
% OUTPUT --> plots 


function detector_plot(data, detector, number)

active =[];

inactive = [];

mu = mean(data(:,number));
sigma = std(data(:,number));


plot(data(:,1), data(:,number), 'b-*','MarkerIndices',find(detector(:,number)==1),...
    'MarkerSize',2,'MarkerEdgeColor','k')

hold on
yline(mu + 2*sigma,'r')

xlabel('time (s)')
ylabel('Calcium activity')



