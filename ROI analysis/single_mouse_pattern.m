addpath('zone analysis','normalizations','overall activity','statistics',...
    'activity detection');

addpath('DATA_FIRST');
load('D_stress.mat')
load('D_obs.mat')
load('D_neutral.mat')

m_detector_neutral = mad_detector(neutral_test);

m_detector_obs = mad_detector(obs_test);

m_detector_stress = mad_detector(stress_test);


% Analysis for observer mouse

obs_pairs_activation = zeros(size(A_obs,1));

for i = 1:size(A_obs,1)
    
    for j = 4:size(A_obs,1)-3
        indices = find(A_obs(i,:) == 1);
        obs_pairs_activation(i,j) = sum(A_obs(i,indices) == A_obs(j,indices)) + ...
            sum(A_obs(i,indices) == A_obs(j-1,indices)) + ...
             sum(A_obs(i,indices) == A_obs(j+1,indices)) + ...
            sum(A_obs(i,indices) == A_obs(j-2,indices)) + ...
             sum(A_obs(i,indices) == A_obs(j+2,indices)) + ...
            sum(A_obs(i,indices) == A_obs(j-3,indices)) + ...
             sum(A_obs(i,indices) == A_obs(j+3,indices));
        
    end
    

end
D_obs = tril(D_obs);

obs_pairs_activation = tril(obs_pairs_activation);



figure

dd = [];
act = [];
for i = 1:size(obs_pairs_activation,1)

    for j =1:size(obs_pairs_activation,2)

if(D_obs(i,j) ~= 0 && obs_pairs_activation(i,j) ~= 0)
        dd = [dd D_obs(i,j)];
        act = [act obs_pairs_activation(i,j)];
end

    end
end

plot(dd,act,'bo')
title('Scatter plot of activation vs distance in observer')
xlabel('Distance between pairs of neurons')
ylabel('Frequency of simultaneous activation')

obs_linear_model = fitlm(dd,act);

obs_linear_model.Rsquared

corr(dd',act')
% Analysis for stressed mouse

stress_pairs_activation = zeros(size(A_stress,1));

for i = 1:size(A_stress,1)
    
    for j = 4:size(A_stress,1)-3
        indices = find(A_stress(i,:) == 1);
        stress_pairs_activation(i,j) = sum(A_stress(i,indices) == A_stress(j,indices)) + ...
            sum(A_stress(i,indices) == A_stress(j-1,indices)) + ...
             sum(A_stress(i,indices) == A_stress(j+1,indices)) + ...
            sum(A_stress(i,indices) == A_stress(j-2,indices)) + ...
             sum(A_stress(i,indices) == A_stress(j+2,indices)) + ...
            sum(A_stress(i,indices) == A_stress(j-3,indices)) + ...
             sum(A_stress(i,indices) == A_stress(j+3,indices));
        
    end
    
end

D_stress = tril(D_stress);

stress_pairs_activation = tril(stress_pairs_activation);



figure

dd = [];
act = [];
for i = 1:size(stress_pairs_activation,1)

    for j =1:size(stress_pairs_activation,2)

if(D_stress(i,j) ~= 0 && stress_pairs_activation(i,j) ~= 0)
        dd = [dd D_stress(i,j)];
        act = [act stress_pairs_activation(i,j)];
end

    end
end

plot(dd,act,'ro')
title('Scatter plot of activation vs distance in stressed')
xlabel('Distance between pairs of neurons')
ylabel('Frequency of simultaneous activation')

stressed_linear_model = fitlm(dd,act);

stressed_linear_model.Rsquared
corr(dd',act')

% Analysis for neutral mouse

neutral_pairs_activation = zeros(size(A_neutral,1));

for i = 1:size(A_neutral,1)
    
    for j = 4:size(A_neutral,1)-3
        indices = find(A_neutral(i,:) == 1);
        neutral_pairs_activation(i,j) = sum(A_neutral(i,indices) == A_neutral(j,indices)) + ...
            sum(A_neutral(i,indices) == A_neutral(j-1,indices)) + ...
             sum(A_neutral(i,indices) == A_neutral(j+1,indices)) + ...
            sum(A_neutral(i,indices) == A_neutral(j-2,indices)) + ...
             sum(A_neutral(i,indices) == A_neutral(j+2,indices)) + ...
            sum(A_neutral(i,indices) == A_neutral(j-3,indices)) + ...
             sum(A_neutral(i,indices) == A_neutral(j+3,indices));
        
    end
    
end

D_neutral = tril(D_neutral);

neutral_pairs_activation = tril(neutral_pairs_activation);

figure

dd = [];
act = [];
for i = 1:size(neutral_pairs_activation,1)

    for j =1:size(neutral_pairs_activation,2)

if(D_neutral(i,j) ~= 0 && neutral_pairs_activation(i,j) ~= 0 )
        dd = [dd D_neutral(i,j)];
        act = [act neutral_pairs_activation(i,j)];
end

    end
end

plot(dd,act,'ko')
title('Scatter plot of activation vs distance in neutral')
xlabel('Distance between pairs of neurons')
ylabel('Frequency of simultaneous activation')

neutral_linear_model = fitlm(dd,act);
neutral_linear_model.Rsquared
corr(dd',act')

