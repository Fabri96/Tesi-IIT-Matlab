% Developed by Fabrizio Bernardi 

% Mean and variance behaviour along neurons from data


function mean_and_var(data)

figure
means = mean(data(:,2:end));

deviations = var(data(:,2:end));

subplot(1,2,1)
plot ( means, 'r-o','Linewidth',3)

title('mean neuronal activities')

subplot(1,2,2)

plot ( deviations, 'b-o','Linewidth',3)

title('variances of neuronal activities')