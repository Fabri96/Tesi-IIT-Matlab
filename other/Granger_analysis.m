% Developed by Fabrizio Bernardi 

% Granger causality analysis 
% 

  main4;
close all
alpha=0.05;
max_lag=40;

[F1,c_v1] = granger_cause(obs_activity_hab_stress,stress_activity_hab2,alpha,max_lag);
[F2,c_v2] = granger_cause(obs_activity_test_stress,stress_activity_test2,alpha,max_lag);
[F3,c_v3] = granger_cause(obs_activity_hab_neutral,neutral_activity_hab2,alpha,max_lag);
[F4,c_v4] = granger_cause(obs_activity_test_neutral,neutral_activity_test2,alpha,max_lag);

aa= categorical({'Habituation','Test'});
subplot(1,2,1)

plot(aa,[F1 F2],'b-o','LineWidth',5)
yline(c_v1,'r','LineWidth',5)
legend('F-stat','Causality treshold')
title('Granger causality between observer and stressed')
set(gca,'FontSize',14)
subplot(1,2,2)

plot(aa,[F3 F4],'k-o','LineWidth',5)
yline(c_v1,'r','LineWidth',5)
legend('F-stat','Causality treshold')
title('Granger causality between observer and neutral')
set(gca,'FontSize',14)
