
function plot_mad(data, number)

data = [data(:,1) data(:,number)];
[mad_treshold,times] = mad_tresh(data);

plot(times,mad_treshold,'r-')

hold on

plot (data(:,1),data(:,2),'b-')

ylabel('Calcium activity')

xlabel('times(s)')