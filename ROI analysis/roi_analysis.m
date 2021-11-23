% Developed by Fabrizio Bernardi 

% Analysis of position of neurons in the ROI for the 3 mice
% 
%
    main 

load('stress_ROI.mat')

load('obs_ROI.mat')

load('neutral_ROI.mat')

% stressed mouse data

stress_roi = stress_ROI;
k = find(stress_ROI(:,2) == "rejected");
stress_roi(k,:) = [];

stress_roi_data = [];
 m_detector_stress = mad_detector(stress_test);

% m_detector_stress = activity_detector(stress_test);

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

% m_detector_obs = activity_detector(obs_test);

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

% m_detector_neutral = activity_detector(neutral_test);


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

% list of  neurons of stressed active every 1/step seconds

step = 4; 

neurons_activated_stress.times = obs_test(1:step:end,1);

for j = 1:size(neurons_activated_stress.times,1)-1
    list = [];

    for i=1:size(stress_roi_data,2)
        b = stress_roi_data(i).detector;
        k1 = find(times == neurons_activated_stress.times(j));
        k2 = find(times == neurons_activated_stress.times(j+1));
        if(sum(stress_roi_data(i).detector(k1:k2))>(step -1))
            list = [list stress_roi_data(i).name];
        end
        
    end
    neurons_activated_stress.list{j} = list;
end


for i = 1:length(neurons_activated_stress.list)-1

    for j = 1:length(neurons_activated_stress.list{i})

        curr_elem = neurons_activated_stress.list{i}(j);

        for k = i+1:length(neurons_activated_stress.list)

            if(~isempty(neurons_activated_stress.list{k}))

             if(ismember(curr_elem,neurons_activated_stress.list{k}))
                 p = find(neurons_activated_stress.list{k} == curr_elem);
                 neurons_activated_stress.list{k}(p)=[];
             else
                 break;

             end
            end
        end
    end
    
end





% list of  neurons of observer active every 1/step s

neurons_activated_obs.times = obs_test(1:step:end,1);

for j = 1:size(neurons_activated_obs.times,1)-1
    list = [];

    for i=1:size(obs_roi_data,2)
        b = obs_roi_data(i).detector;
        k1 = find(times == neurons_activated_obs.times(j));
        k2 = find(times == neurons_activated_obs.times(j+1));
        if(sum(obs_roi_data(i).detector(k1:k2))>(step-1))
            list = [list obs_roi_data(i).name];
        end
        
    end
    neurons_activated_obs.list{j} = list;
end

for i = 1:length(neurons_activated_obs.list)-1

    for j = 1:length(neurons_activated_obs.list{i})

        curr_elem = neurons_activated_obs.list{i}(j);

        for k = i+1:length(neurons_activated_obs.list)

            if(~isempty(neurons_activated_obs.list{k}))

             if(ismember(curr_elem,neurons_activated_obs.list{k}))
                 p = find(neurons_activated_obs.list{k} == curr_elem);
                 neurons_activated_obs.list{k}(p)=[];
             else
                 break;

             end
            end
        end
    end
    
end


% list of  neurons of neutral active every 1/step s

neurons_activated_neutral.times = obs_test(1:step:end,1);

for j = 1:size(neurons_activated_neutral.times,1)-1
    list = [];

    for i=1:size(neutral_roi_data,2)
        b = neutral_roi_data(i).detector;
        k1 = find(times == neurons_activated_neutral.times(j));
        k2 = find(times == neurons_activated_neutral.times(j+1));
        if(sum(neutral_roi_data(i).detector(k1:k2))>(step-1))
            list = [list neutral_roi_data(i).name];
        end
        
    end
    neurons_activated_neutral.list{j} = list;
end
     
for i = 1:length(neurons_activated_neutral.list)-1

    for j = 1:length(neurons_activated_neutral.list{i})

        curr_elem = neurons_activated_neutral.list{i}(j);

        for k = i+1:length(neurons_activated_neutral.list)

            if(~isempty(neurons_activated_neutral.list{k}))

             if(ismember(curr_elem,neurons_activated_neutral.list{k}))
                 p = find(neurons_activated_neutral.list{k} == curr_elem);
                 neurons_activated_neutral.list{k}(p)=[];
             else
                 break;

             end
            end
        end
    end
    
end

% Build matrices A for 3 mice: row i is neuron, column k is list number k
% of activations. A(i,k) = 1 means that the neuron #i belongs to interval #k

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

% Find indices of A corresponding to observer close to stressed or neutral

[ left, right ,intermediate] = detect_areas(ad_test_zone);

t = obs_test(1:step:end,1);
stress_t = [];

for i=1:length(right)
    i_stress = find(right(i)>t);
    i_stress = i_stress(end);
    stress_t = [stress_t i_stress];
end

 stress_t = unique(stress_t);   


neutral_t = [];

for i=1:length(left)
    i_neutral = find(left(i)>t);
    i_neutral = i_neutral(end);
    neutral_t = [neutral_t i_neutral];
end

 neutral_t = unique(neutral_t);  
    

 for i = 1:size(A_obs,1)
    
    for j = 2:size(A_stress,1)-1
        indices = find(A_obs(i,:) == 1 );
        prova(i,j) = (sum(A_obs(i,indices) == A_stress(j,indices)) + ...
           sum(A_obs(i,indices) == A_stress(j-1,indices)) + ...
           sum(A_obs(i,indices) == A_stress(j+1,indices))) /(3*length(indices));
        
    end
    
end
            
% For every active neuron  of observer, let's count when the neurons of
% the stressed are active too in same or near intervals 
A_obs_stress = A_obs(:,stress_t);
A_stress = A_stress(:,stress_t);

for i = 1:size(A_obs_stress,1)
    
    for j = 1:size(A_stress,1)
        indices = find(A_obs_stress(i,:) == 1 );
        if(isempty(indices))
            Obs_stress_connections(i,j)=0;
        else
            if(j>3 && j < size(A_stress,1)-2)
           Obs_stress_connections(i,j) = (sum(A_obs_stress(i,indices) == A_stress(j,indices))) + ...
           (sum(A_obs_stress(i,indices) == A_stress(j-1,indices))) + ...
           (sum(A_obs_stress(i,indices) == A_stress(j+1,indices)))+ ...
           (sum(A_obs_stress(i,indices) == A_stress(j-2,indices))) + ...
           (sum(A_obs_stress(i,indices) == A_stress(j+2,indices))) + ...
           (sum(A_obs_stress(i,indices) == A_stress(j-3,indices))) + ...
           (sum(A_obs_stress(i,indices) == A_stress(j+3,indices)));
            

        else 
            if(j>2 && j < size(A_stress,1)-1)
        Obs_stress_connections(i,j) = (sum(A_obs_stress(i,indices) == A_stress(j,indices))) + ...
           (sum(A_obs_stress(i,indices) == A_stress(j-1,indices))) + ...
           (sum(A_obs_stress(i,indices) == A_stress(j+1,indices)))+ ...
           (sum(A_obs_stress(i,indices) == A_stress(j-2,indices))) + ...
           (sum(A_obs_stress(i,indices) == A_stress(j+2,indices)));

            else   
                if(j>1 && j < size(A_stress,1))
        Obs_stress_connections(i,j) = (sum(A_obs_stress(i,indices) == A_stress(j,indices))) + ...
           (sum(A_obs_stress(i,indices) == A_stress(j-1,indices))) + ...
           (sum(A_obs_stress(i,indices) == A_stress(j+1,indices)));

                else
                if(j==1 || j== size(A_stress,1))
        Obs_stress_connections(i,j) = (sum(A_obs_stress(i,indices) == A_stress(j,indices)));

                end
                end
            end
            end


        end




        end
        
    end
    


% For every active neuron  of observer, let's count when the neurons of
% the neutral are active too in same or near intervals    

A_obs_neutral = A_obs(:,neutral_t);
A_neutral = A_neutral(:,neutral_t);

for i = 1:size(A_obs_neutral,1)
    
    for j = 2:size(A_neutral,1)-1
        indices = find(A_obs_neutral(i,:) == 1 );
        Obs_neutral_connections(i,j) = (sum(A_obs_neutral(i,indices) == A_neutral(j,indices)) + ...
           sum(A_obs_neutral(i,indices) == A_neutral(j-1,indices)) + ...
           sum(A_obs_neutral(i,indices) == A_neutral(j+1,indices)));
        
    end
    
end



