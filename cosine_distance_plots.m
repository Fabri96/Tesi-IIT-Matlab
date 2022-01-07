cos_dist_test_stress= cosine_distance(obs_activity_test_stress,stress_activity_test2);

cos_dist_test_neut= cosine_distance(obs_activity_test_neutral,neutral_activity_test2);

cos_dist_hab_stress= cosine_distance(obs_activity_hab_stress,stress_activity_hab2);

cos_dist_hab_neut= cosine_distance(obs_activity_hab_neutral,neutral_activity_hab2);


plot([cos_dist_hab_stress cos_dist_test_stress], 'r-o')
hold on
plot([cos_dist_hab_neut cos_dist_test_neut], 'b-o')