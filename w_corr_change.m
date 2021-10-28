ad_hab_zone = adapt_zone(test_zone,obs_test);

obs_test_weights = compute_weights(obs_test,ad_test_zone, 'obs');

stress_test_weights = compute_weights(stress_test,ad_test_zone, 'stress');

neutral_test_weights = compute_weights(neutral_test,ad_test_zone, 'neutral');

w_activity_test_obs = weighted_activity(obs_test, obs_test_weights);

w_activity_test_stress = weighted_activity(stress_test, stress_test_weights);

w_activity_test_neutral = weighted_activity(neutral_test, neutral_test_weights);

[ left, right ,intermediate] = detect_areas(ad_test_zone);

obs_hab_weights = compute_weights(obs_hab,ad_hab_zone(2:end,:), 'obs');

stress_hab_weights = compute_weights(stress_hab,ad_hab_zone(2:end,:), 'stress');

neutral_hab_weights = compute_weights(neutral_hab,ad_hab_zone(2:end,:), 'neutral');

w_activity_hab_obs = weighted_activity(obs_hab, obs_hab_weights);

w_activity_hab_stress = weighted_activity(stress_hab, stress_hab_weights);

w_activity_hab_neutral = weighted_activity(neutral_hab, neutral_hab_weights);

w_activity_test_obs1 = interp1(w_activity_test_obs(:,1),w_activity_test_obs(:,2), left);

w_activity_test_obs2 = interp1(w_activity_test_obs(:,1),w_activity_test_obs(:,2), right);

w_activity_test_stress2 = interp1(w_activity_test_stress(:,1),w_activity_test_stress(:,2), right);


% correlations_change(w_activity_test_obs,w_activity_test_stress,w_activity_test_neutral,...
%     w_activity_hab_obs,w_activity_hab_stress,w_activity_hab_neutral)
