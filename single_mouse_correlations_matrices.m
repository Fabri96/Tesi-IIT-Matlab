% Developed by Fabrizio Bernardi 

% Compute and analyze correlation matrices for neurons in all  mice
% 

 main3
 close all

m_detector_stress = mad_detector(stress_test);
m_detector_obs = mad_detector(obs_test);
m_detector_neutral = mad_detector(neutral_test);

m_detector_stress_cage = mad_detector(stress_cage);
m_detector_obs_cage = mad_detector(obs_cage);
m_detector_neutral_cage = mad_detector(neutral_cage);

m_detector_stress_hab = mad_detector(stress_hab);
m_detector_obs_hab = mad_detector(obs_hab);
m_detector_neutral_hab = mad_detector(neutral_hab);

dt = 0.15;

c_matrix_stress = corr_matrix_single_mouse(m_detector_stress,dt);

c_matrix_obs= corr_matrix_single_mouse(m_detector_obs,dt);

c_matrix_neutral= corr_matrix_single_mouse(m_detector_neutral,dt);


c_matrix_stress_cage = corr_matrix(m_detector_stress_cage,dt);

c_matrix_obs_cage= corr_matrix(m_detector_obs_cage,dt);

c_matrix_neutral_cage= corr_matrix(m_detector_neutral_cage,dt);

c_matrix_stress_hab = corr_matrix(m_detector_stress_hab,dt);

c_matrix_obs_hab= corr_matrix(m_detector_obs_hab,dt);

c_matrix_neutral_hab= corr_matrix(m_detector_neutral_hab,dt);

% figure
% 
% heatmap(c_matrix_stress)
% title('Correlation matrix in stressed during test')
% 
% figure
% 
% heatmap(c_matrix_obs)
% title('Correlation matrix in observer during test')
% 
% figure
% 
% heatmap(c_matrix_neutral_cage)
% title('Correlation matrix in neutral during test')
% 
% figure
% 
% heatmap(c_matrix_stress_cage)
% title('Correlation matrix in stressed during homecage')
% 
% figure
% 
% heatmap(c_matrix_obs_cage)
% title('Correlation matrix in observer during homecage')
% figure
% 
% heatmap(c_matrix_neutral_cage)
% title('Correlation matrix in neutral during homecage')
aa= categorical({'Cage','Habituation','Test'});

figure
plot(aa, [mean(c_matrix_stress_cage(:)) mean(c_matrix_stress_hab(:))  mean(c_matrix_stress(:))],'r-o','LineWidth',3)
title('Average interneuronal correlation in stressed')
set(gca,'FontSize',20)

figure
plot(aa, [mean(c_matrix_obs_cage(:)) mean(c_matrix_obs_hab(:)) mean(c_matrix_obs(:))],'k-o','LineWidth',3)
title('Average interneuronal correlation in observer')
set(gca,'FontSize',20)

figure
plot(aa, [mean(c_matrix_neutral_cage(:)) mean(c_matrix_neutral_hab(:)) mean(c_matrix_neutral(:))],'b-o','LineWidth',3)
title('Average interneuronal correlation in neutral')
set(gca,'FontSize',20)
