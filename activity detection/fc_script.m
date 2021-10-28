m_detector_obs_test = mad_detector(obs_activity_test);

m_detector_stress_test = mad_detector(stress_activity_test);

m_detector_obs_hab = mad_detector(obs_activity_hab);

m_detector_stress_hab = mad_detector(stress_activity_hab);

T1 = obs_activity_test(end,1) - obs_activity_test(1,1);

dt1 = obs_activity_test(2,1) - obs_activity_test(1,1);

T2 = obs_activity_hab(end,1) - obs_activity_hab(1,1);

dt2 = obs_activity_hab(2,1) - obs_activity_hab(1,1);


Firing_corr1 = firing_correlation(m_detector_obs_test(:,2),m_detector_stress_test(:,2),T1,dt1);

Firing_corr2 = firing_correlation(m_detector_obs_hab(:,2),m_detector_stress_hab(:,2),T2,dt2);


