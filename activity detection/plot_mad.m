% Developed by Fabrizio Bernardi 

% PLOT FOR MAD DETECTOR
%  
% INPUT --> data matrix, neuron (number) you want to analyze
% 
% OUTPUT --> plots


function plot_mad(data, number)

data = [data(:,1) data(:,number)];
[mad_treshold,times] = mad_tresh(data);

plot(times,mad_treshold,'r-')

hold on

plot (data(:,1),data(:,2),'b-')

xlabel('time (s)')
ylabel('\DeltaF/F')