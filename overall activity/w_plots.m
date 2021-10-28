obs_weights = compute_weights(obs_test,ad_test_zone, 'obs');

stress_weights = compute_weights(stress_test,ad_test_zone, 'stress');

neutral_weights = compute_weights(neutral_test,ad_test_zone, 'neutral');

w_activity_obs = weighted_activity(obs_test, obs_weights);

w_activity_stress = weighted_activity(stress_test, stress_weights);

w_activity_neutral = weighted_activity(neutral_test, neutral_weights);

subplot(3,1,1)

plot(w_activity_obs(:,1),w_activity_obs(:,2),'r-')

subplot(3,1,2)

plot(w_activity_stress(:,1),w_activity_stress(:,2),'b-')

subplot(3,1,3)

plot(w_activity_neutral(:,1),w_activity_neutral(:,2),'g-')



