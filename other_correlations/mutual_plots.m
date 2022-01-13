I = MutualInformation(obs_activity_test_stress,stress_activity_test2);

I2 = MutualInformation(obs_activity_hab_stress,stress_activity_hab2);

I3 = MutualInformation(obs_activity_test_neutral,neutral_activity_test2);

I4 = MutualInformation(obs_activity_hab_neutral,neutral_activity_hab2);


subplot(1,2,1)

plot([I I2], 'r-o')

subplot(1,2,2)

plot([I3 I4], 'b-o')