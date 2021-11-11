% Developed by Fabrizio Bernardi 

% Analysis of position of neurons in the ROI for the 3 mice
% 
%

load('stress_ROI.mat')

load('obs_ROI.mat')

load('neutral_ROI.mat')

% stressed mouse data

stress_roi = stress_ROI;
k = find(stress_ROI(:,2) == "rejected");
stress_roi(k,:) = [];

stress_roi_data = [];
m_detector_stress = mad_detector(stress_test);

for i = 1:size(stress_roi,1)
    
    stress_roi_data(i).name = stress_roi(i,1);
    stress_roi_data(i).x = double(stress_roi(i,6));
    stress_roi_data(i).y = double(stress_roi(i,7));
    stress_roi_data(i).size = double(stress_roi(i,9));
    stress_roi_data(i).times = stress_test(:,1);
    stress_roi_data(i).activity = stress_test(:,i+1);
    stress_roi_data(i).detector = m_detector_stress(:,i+1);
    
end

clear stress_roi
% observer mouse data

obs_roi = obs_ROI;
k = find(obs_ROI(:,2) == "rejected");
obs_roi(k,:) = [];

obs_roi_data = [];

m_detector_obs = mad_detector(obs_test);

for i = 1:size(obs_roi,1)
    
    obs_roi_data(i).name = obs_roi(i,1);
    obs_roi_data(i).x = double(obs_roi(i,6));
    obs_roi_data(i).y = double(obs_roi(i,7));
    obs_roi_data(i).size = double(obs_roi(i,9));
    obs_roi_data(i).times = obs_test(:,1);
    obs_roi_data(i).activity = obs_test(:,i+1);
    obs_roi_data(i).detector = m_detector_obs(:,i+1);
    
end

clear obs_roi

% neutral mouse data

neutral_roi = neutral_ROI;
k = find(neutral_ROI(:,2) == "rejected");
neutral_roi(k,:) = [];

neutral_roi_data = [];

m_detector_neutral = mad_detector(neutral_test);


for i = 1:size(neutral_roi,1)
    
    neutral_roi_data(i).name = neutral_roi(i,1);
    neutral_roi_data(i).x = double(neutral_roi(i,6));
    neutral_roi_data(i).y = double(neutral_roi(i,7));
    neutral_roi_data(i).size = double(neutral_roi(i,9));
    neutral_roi_data(i).times = neutral_test(:,1);
    neutral_roi_data(i).activity = neutral_test(:,i+1);
    neutral_roi_data(i).detector = m_detector_neutral(:,i+1);
    
    
end
clear neutral_roi

times = stress_roi_data(1).times;

% list of  neurons of stressed active every 0.25 s

neurons_activated_stress.times = obs_test(1:5:end,1);

for j = 1:size(neurons_activated_stress.times,1)-1
    list = [];

    for i=1:size(stress_roi_data,2)
        b = stress_roi_data(i).detector;
        k1 = find(times == neurons_activated_stress.times(j));
        k2 = find(times == neurons_activated_stress.times(j+1));
        if(sum(stress_roi_data(i).detector(k1:k2))>1)
            list = [list stress_roi_data(i).name];
        end
        
    end
    neurons_activated_stress.list{j} = list;
end

% list of  neurons of observer active every 0.25 s

neurons_activated_obs.times = obs_test(1:5:end,1);

for j = 1:size(neurons_activated_obs.times,1)-1
    list = [];

    for i=1:size(obs_roi_data,2)
        b = obs_roi_data(i).detector;
        k1 = find(times == neurons_activated_obs.times(j));
        k2 = find(times == neurons_activated_obs.times(j+1));
        if(sum(obs_roi_data(i).detector(k1:k2))>1)
            list = [list obs_roi_data(i).name];
        end
        
    end
    neurons_activated_obs.list{j} = list;
end

% list of  neurons of neutral active every 0.25 s

neurons_activated_neutral.times = obs_test(1:5:end,1);

for j = 1:size(neurons_activated_neutral.times,1)-1
    list = [];

    for i=1:size(neutral_roi_data,2)
        b = neutral_roi_data(i).detector;
        k1 = find(times == neurons_activated_neutral.times(j));
        k2 = find(times == neurons_activated_neutral.times(j+1));
        if(sum(neutral_roi_data(i).detector(k1:k2))>1)
            list = [list neutral_roi_data(i).name];
        end
        
    end
    neurons_activated_neutral.list{j} = list;
end
     


% Build matrices A for 3 mice: row i is neuron, column k is list number k
% of activations. A(i,k) = 1 means that the neuron #i belongs to list #k

A_stress=zeros(size(stress_roi_data,2),size(neurons_activated_stress.list,2));
        
for i =1:size(stress_roi_data,2)
    
    name = stress_roi_data(i).name;
    
    for k = 1:size(neurons_activated_stress.list,2)
        
         if(~isempty(neurons_activated_stress.list{k}))
             
        if (ismember(name, neurons_activated_stress.list{k}))
            
            A_stress(i,k) = 1;
            
        end
        end
        
    end
    
end


A_obs=zeros(size(obs_roi_data,2),size(neurons_activated_obs.list,2));
        
for i =1:size(obs_roi_data,2)
    
    name = obs_roi_data(i).name;
    
    for k = 1:size(neurons_activated_obs.list,2)
        
        if(~isempty(neurons_activated_obs.list{k}))
        
        if (ismember(name, neurons_activated_obs.list{k}))
            
            A_obs(i,k) = 1;           
            
        end
        end
        
    end
    
end


A_neutral=zeros(size(neutral_roi_data,2),size(neurons_activated_neutral.list,2));
        
for i =1:size(neutral_roi_data,2)
    
    name = neutral_roi_data(i).name;
    
    for k = 1:size(neurons_activated_neutral.list,2)
        
         if(~isempty(neurons_activated_neutral.list{k}))
             
        if (ismember(name, neurons_activated_neutral.list{k}))
            
            A_neutral(i,k) = 1;
            
        end    
        end
        
    end
    
end
            
            
% For every active neuron  of stressed, let's count when the neurons of
% the observer are active too           

for i = 1:size(A_stress,1)
    
    for j = 1:size(A_obs,1)
        indices = find(A_stress(i,:) == 1);
        res(i,j) = sum(A_stress(i,indices) == A_obs(j,indices) )/length(indices);
        
    end
    
end
    
    
