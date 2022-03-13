subplot(1,2,1)

plot(obs_activity_test_neutral-mean(obs_activity_test_neutral),'r')
hold on
plot(neutral_activity_test2-mean(neutral_activity_test2),'b')
title ('Activities of neutral and observer during test')
xlabel('time')
ylabel('\DeltaF/F')
grid
set(gca,'FontSize',15)

subplot(1,2,2)

plot(obs_activity_hab_neutral-mean(obs_activity_hab_neutral),'r')
hold on
plot(neutral_activity_hab2-mean(neutral_activity_hab2),'b')
title ('Activities of neutral and observer during hab')
xlabel('time')
ylabel('\DeltaF/F')
grid
set(gca,'FontSize',15)