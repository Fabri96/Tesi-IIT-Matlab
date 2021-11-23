% Developed by Fabrizio Bernardi  

% Average considerations on the 4 datasets


main;

L2_errors_.obs_stress_test.first = immse(obs_activity_test(right,2),stress_activity_test(right,2));

L2_errors.obs_neut_test.first = immse(obs_activity_test(left,2),neutral_activity_test(left,2));

L2_errors_.obs_stress_hab.first = immse(obs_activity_hab(right2,2),stress_activity_hab(right2,2));

L2_errors.obs_neut_hab.first = immse(obs_activity_hab(left2,2),neutral_activity_hab(left2,2));

corr_plots;