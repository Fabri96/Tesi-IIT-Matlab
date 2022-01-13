nn=200;
minn=min(obs_activity_test_stress,stress_activity_test2);

maxx=max(obs_activity_test_stress,stress_activity_test2);

E=[minn:(maxx-minn)/200:maxx];
Y = discretize(obs_activity_test_stress,E);
Y2 = discretize(stress_activity_test2,E);


minn2=min(obs_activity_hab_stress,stress_activity_hab2);

maxx2=max(obs_activity_hab_stress,stress_activity_hab2);

E2=[minn2:(maxx2-minn2)/200:maxx2];
Y3 = discretize(obs_activity_hab_stress,E2);
Y4 = discretize(stress_activity_hab2,E2);

Y(isnan(Y))=rand(1);
Y2(isnan(Y2))=rand(1);
Y3(isnan(Y3))=rand(1);
Y4(isnan(Y4))=rand(1);
I2 = MutualInformation(Y,Y2);

I = MutualInformation(Y3,Y4);

plot([I I2],'r-o')