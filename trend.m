close all

N=100;

trend_obs_stress = movmean(obs_activity_test_stress,N);

trend_obs_neutral = movmean(obs_activity_test_neutral,N);

trend_stress = movmean(stress_activity_test2,N);

trend_neutral = movmean(neutral_activity_test2,N);

trend_obs_stress_hab = movmean(obs_activity_hab_stress,N);

trend_obs_neutral_hab = movmean(obs_activity_hab_neutral,N);

trend_stress_hab = movmean(stress_activity_hab2,N);

trend_neutral_hab = movmean(neutral_activity_hab2,N);

[c,lags] = xcov(trend_neutral,trend_obs_neutral,'normalized');

[c2,lags2] = xcov(trend_neutral_hab,trend_obs_neutral_hab,'normalized');

[c3,lags3] = xcov(trend_obs_stress,trend_stress,'normalized');

[c4,lags4] = xcov(trend_obs_stress_hab,trend_stress_hab,'normalized');



p = corr(trend_neutral,trend_obs_neutral);

p2 = corr(trend_neutral_hab,trend_obs_neutral_hab);

p3 = corr(trend_obs_stress,trend_stress);

p4 = corr(trend_obs_stress_hab,trend_stress_hab);


subplot(1,2,1)

plot(lags,c,'b-o',MarkerSize=2)

hold on

plot(lags2,c2,'r-o',MarkerSize=2)
grid
legend('test','hab')

title('cc in ons vs neutral')
ylim([-0.4 1])
set(gca,'FontSize',20)
subplot(1,2,2)

plot(lags3,c3,'b-o',MarkerSize=2)
grid
hold on

plot(lags4,c4,'r-o',MarkerSize=2)
legend('test','hab')
title('cc in ons vs stress')
ylim([-0.4 1])
set(gca,'FontSize',20)
figure

aa= categorical({'Habituation','Test'});

plot(aa, [p2 p],'b--o',LineWidth=2,MarkerSize=15)

hold on

plot(aa,[p4 p3],'r--o',LineWidth=2,MarkerSize=15)
grid
legend('obs vs neutral','obs vs stress')
title ('Pearson cc from hab to test')
set(gca,'FontSize',20)
ylim([-0.5 1])