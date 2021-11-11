addpath('zone analysis','normalizations','overall activity','statistics',...
    'activity detection');

addpath('DATA_FIRST');
load('D_stress.mat')
load('D_obs.mat')
load('D_neutral.mat')

m_detector_neutral = mad_detector(neutral_test);

m_detector_obs = mad_detector(obs_test);

m_detector_stress = mad_detector(stress_test);
obs_pairs_activation = zeros(size(A_obs,1));
for i = 1:size(A_obs,1)
    
    for j = 1:size(A_obs,1)
        indices = find(A_obs(i,:) == 1);
        obs_pairs_activation(i,j) = sum(A_obs(i,indices) == A_obs(j,indices));
        
    end
    
end