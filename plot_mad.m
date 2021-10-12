
function plot_mad(data)

[mad_treshold,np,pn,times] = mad_tresh(data);

plot(times,mad_treshold,'r-')

hold on

plot (data(:,1),data(:,2),'b-')