% Developed by Fabrizio Bernardi 

% PLOT FOR SNIFFING ACTIVITY
%  
% INPUT --> observer activity and sniff data
% 
% OUTPUT --> plot of activity and sniffing


function sniff_plot(obs_data, stress_data,neutral_data, sniff)

obs_data_ad = interp1(obs_data(:,1),obs_data(:,2),sniff(2:end,1));

stress_data_ad = interp1(stress_data(:,1),stress_data(:,2),sniff(2:end,1));

neutral_data_ad = interp1(neutral_data(:,1),neutral_data(:,2),sniff(2:end,1));

stress_sniff = find(sniff(:,5)==1);

neutral_sniff = find(sniff(:,6)==1);

figure

subplot(3,1,1)

plot(sniff(2:end,1), obs_data_ad, 'r-*','MarkerIndices',stress_sniff ,...
    'MarkerSize',2,'MarkerEdgeColor','k')

hold on

plot(sniff(2:end,1), obs_data_ad, 'r-*','MarkerIndices',neutral_sniff ,...
    'MarkerSize',2,'MarkerEdgeColor','b')

legend ('Sniff with stressed','Sniff with neutral')
title('Observer activity and sniffing behaviors')

subplot(3,1,2)

plot(sniff(2:end,1), stress_data_ad, 'r-*','MarkerIndices',stress_sniff ,...
    'MarkerSize',2,'MarkerEdgeColor','k')

legend ('Sniff with observer')

title('Stressed activity and sniffing behaviors')

subplot(3,1,3)


plot(sniff(2:end,1), neutral_data_ad, 'r-*','MarkerIndices',neutral_sniff ,...
    'MarkerSize',2,'MarkerEdgeColor','b')

legend ('Sniff with observer')

title('Neutral activity and sniffing behaviors')
