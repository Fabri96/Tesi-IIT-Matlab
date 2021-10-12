% Developed by Fabrizio Bernardi 

% Plot of the correlation matrix of the neurons in data



function plot_correlation(data)

data=data(:,2:end);

correl = corr(data);

heatmap(correl);

title('Pearson correlation between neurons')