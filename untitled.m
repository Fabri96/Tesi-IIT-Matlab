

subplot(1,2,1)

plot(obs_test(:,1),(obs_test(:,3)-min(obs_test(:,3)))/...
   (max(obs_test(:,3)) - min(obs_test(:,3))) ,'b')

xlabel('time (s)')

ylabel('\DeltaF/F')

title ('min-max signal')

set(gca,'FontSize',20)

subplot(1,2,2)

plot(obs_test(:,1),(obs_test(:,3)-mean(obs_test(:,3)))/std(obs_test(:,3)),'b')

xlabel('time (s)')

ylabel('\DeltaF/F')

title ('z-score signal')

set(gca,'FontSize',20)