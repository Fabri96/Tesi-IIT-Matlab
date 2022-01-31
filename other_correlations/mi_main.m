
 nn=2;

Y = round(obs_activity_test_stress,nn);
Y2 = round(stress_activity_test2,nn);

Y3 = round(obs_activity_hab_stress,nn);
Y4 = round(stress_activity_hab2,nn);

Y5 = round(obs_activity_test_neutral,nn);
Y6 = round(neutral_activity_test2,nn);

Y7 = round(obs_activity_hab_neutral,nn);
Y8 = round(neutral_activity_hab2,nn);

I2 = MutualInformation(Y,Y2);

I = MutualInformation(Y3,Y4);

I3 = MutualInformation(Y7,Y8);

I4 = MutualInformation(Y5,Y6);

figure

plot([I I2],'r-o',LineWidth=2,MarkerSize=15)

hold on

plot([I3 I4],'b-o',LineWidth=2,MarkerSize=15)

title('Mutual information')
legend('obs vs stressed', 'obs vs neutral')

set(gca,'FontSize',20)

