ang_dist_test_stress= angular_distance(obs_activity_test_stress,stress_activity_test2);

ang_dist_test_neut= angular_distance(obs_activity_test_neutral,neutral_activity_test2);

ang_dist_hab_stress= angular_distance(obs_activity_hab_stress,stress_activity_hab2);

ang_dist_hab_neut= angular_distance(obs_activity_hab_neutral,neutral_activity_hab2);
aa = categorical({'Habituation','Test'});

plot(aa,[ang_dist_hab_stress ang_dist_test_stress], 'r--o',LineWidth=2,MarkerSize=15)
hold on
plot(aa,[ang_dist_hab_neut ang_dist_test_neut], 'b--o',LineWidth=2,MarkerSize=15)
title("Angular distance in triplet " + num2str(dataset))
legend('obs vs stressed','with neutral')
ylim([0.1,0.3])
set(gca,'FontSize',20)