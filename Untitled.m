


% n=[2 4:9 13];
 n=[3:5 8 10];
% m=[1:7 9 12:13];
m=[1 2 4 6 7 10];
obs_neut_activity = mean(obs_test(:,n+1)');
neut_activity = mean(neutral_test(:,m+1)');


% nn=[1 2 5:9 11 13];
nn=[3 5 6 9 10 13 15 16];
% mm = [1 3 13 18 19 22 26 30:32 34 40 42 44 52];
mm = [4 6 13:15 28 32 34];
obs_str_activity = mean(obs_test(:,nn+1)');
str_activity = mean(stress_test(:,mm+1)');

[c,lags] = xcorr(obs_str_activity,str_activity,'normalized');

[c2,lags2] = xcorr(obs_neut_activity,neut_activity,'normalized');

subplot(1,2,1)

stem(lags,c,'r')
xlabel('lags')
ylabel('cross-correlation')
title('Cross correlation with stressed after neuron filtering')
set(gca,'FontSize',15)

subplot(1,2,2)

stem(lags2,c2,'b')
xlabel('lags')
ylabel('cross-correlation')
title('Cross correlation with neutral after neuron filtering')
set(gca,'FontSize',15)

