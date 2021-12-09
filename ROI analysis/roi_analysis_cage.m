% Developed by Fabrizio Bernardi 

% Analysis of position of neurons in the ROI for the 3 mice during
% homecage
% 
%
%     main 

clear stress_roi_data obs_roi_data neutral_roi_data A_obs A_stress A_neutral ...
    neurons_activated_stress neurons_activated_obs neurons_activated_neutral list

if (dataset == 1)

load('stress_ROI.mat')

load('obs_ROI.mat')

load('neutral_ROI.mat')

end

if (dataset == 2)
    
load('stress_ROI2.mat')

load('obs_ROI2.mat')

load('neutral_ROI2.mat')

stress_ROI = stress_ROI2;

obs_ROI = obs_ROI2;

neutral_ROI = neutral_ROI2;

neutral_test = neutral_test(:,[1:3 7:end]);
end

if (dataset == 3)
    
load('stress_ROI3.mat')

load('obs_ROI3.mat')

load('neutral_ROI3.mat')

stress_ROI = stress_ROI3;

obs_ROI = obs_ROI3;

neutral_ROI = neutral_ROI3;

end

if (dataset == 4)
    
load('stress_ROI4.mat')

load('obs_ROI4.mat')

load('neutral_ROI4.mat')

stress_ROI = stress_ROI4;

obs_ROI = obs_ROI4;

neutral_ROI = neutral_ROI4;

end

% stressed mouse data

stress_roi = stress_ROI;
k = find(stress_ROI(:,2) == "rejected");
stress_roi(k,:) = [];

stress_roi_data_cage = [];
 m_detector_stress_cage = mad_detector(stress_cage);

% m_detector_stress = activity_detector(stress_cage);
if(dataset==2)
    neutral_cage=neutral_cage(:,1:end-1);
end
for i = 1:size(stress_roi,1)
    
    stress_roi_data_cage(i).name = stress_roi(i,1);
    stress_roi_data_cage(i).x = double(stress_roi(i,6));
    stress_roi_data_cage(i).y = double(stress_roi(i,7));
    stress_roi_data_cage(i).size = double(stress_roi(i,9));
    stress_roi_data_cage(i).times = stress_cage(:,1);
    stress_roi_data_cage(i).activity = stress_cage(:,i+1);
    stress_roi_data_cage(i).detector = m_detector_stress_cage(:,i+1);
    
end

clear stress_roi
% observer mouse data

obs_roi = obs_ROI;
k = find(obs_ROI(:,2) == "rejected");
obs_roi(k,:) = [];

obs_roi_data_cage = [];

 m_detector_obs_cage = mad_detector(obs_cage);

% m_detector_obs = activity_detector(obs_cage);

for i = 1:size(obs_roi,1)
    
    obs_roi_data_cage(i).name = obs_roi(i,1);
    obs_roi_data_cage(i).x = double(obs_roi(i,6));
    obs_roi_data_cage(i).y = double(obs_roi(i,7));
    obs_roi_data_cage(i).size = double(obs_roi(i,9));
    obs_roi_data_cage(i).times = obs_cage(:,1);
    obs_roi_data_cage(i).activity = obs_cage(:,i+1);
    obs_roi_data_cage(i).detector = m_detector_obs_cage(:,i+1);
    
end

clear obs_roi

% neutral mouse data

neutral_roi = neutral_ROI;
k = find(neutral_ROI(:,2) == "rejected");
neutral_roi(k,:) = [];

neutral_roi_data = [];

 m_detector_neutral_cage = mad_detector(neutral_cage);

% m_detector_neutral = activity_detector(neutral_cage);


for i = 1:size(neutral_roi,1)
    
    neutral_roi_data(i).name = neutral_roi(i,1);
    neutral_roi_data(i).x = double(neutral_roi(i,6));
    neutral_roi_data(i).y = double(neutral_roi(i,7));
    neutral_roi_data(i).size = double(neutral_roi(i,9));
    neutral_roi_data(i).times = neutral_cage(:,1);
    neutral_roi_data(i).activity = neutral_cage(:,i+1);
    neutral_roi_data(i).detector = m_detector_neutral_cage(:,i+1);
    
    
end
clear neutral_roi

times = stress_roi_data_cage(1).times;

% list of  neurons of stressed active every 0.05*step seconds

step = 5; 

neurons_activated_stress_cage.times = obs_cage(1:step:end,1);

for j = 1:size(neurons_activated_stress_cage.times,1)-1
    list = [];

    for i=1:size(stress_roi_data_cage,2)
        b = stress_roi_data_cage(i).detector;
        k1 = find(times == neurons_activated_stress_cage.times(j));
        k2 = find(times == neurons_activated_stress_cage.times(j+1));
        if(sum(stress_roi_data_cage(i).detector(k1:k2))>(step -2))
            list = [list stress_roi_data_cage(i).name];
        end
        
    end
    neurons_activated_stress_cage.list{j} = list;
end


% for i = 1:length(neurons_activated_stress_cage.list)-1
% 
%     for j = 1:length(neurons_activated_stress_cage.list{i})
% 
%         curr_elem = neurons_activated_stress_cage.list{i}(j);
% 
%         for k = i+1:length(neurons_activated_stress_cage.list)
% 
%             if(~isempty(neurons_activated_stress_cage.list{k}))
% 
%              if(ismember(curr_elem,neurons_activated_stress_cage.list{k}))
%                  p = find(neurons_activated_stress_cage.list{k} == curr_elem);
%                  neurons_activated_stress_cage.list{k}(p)=[];
%              else
%                  break;
% 
%              end
%             end
%         end
%     end
%     
% end





% list of  neurons of observer active every 0.05*step s

neurons_activated_obs_cage.times = obs_cage(1:step:end,1);

for j = 1:size(neurons_activated_obs_cage.times,1)-1
    list = [];

    for i=1:size(obs_roi_data_cage,2)
        b = obs_roi_data_cage(i).detector;
        k1 = find(times == neurons_activated_obs_cage.times(j));
        k2 = find(times == neurons_activated_obs_cage.times(j+1));
        if(sum(obs_roi_data_cage(i).detector(k1:k2))>(step-1))
            list = [list obs_roi_data_cage(i).name];
        end
        
    end
    neurons_activated_obs_cage.list{j} = list;
end

% for i = 1:length(neurons_activated_obs_cage.list)-1
% 
%     for j = 1:length(neurons_activated_obs_cage.list{i})
% 
%         curr_elem = neurons_activated_obs_cage.list{i}(j);
% 
%         for k = i+1:length(neurons_activated_obs_cage.list)
% 
%             if(~isempty(neurons_activated_obs_cage.list{k}))
% 
%              if(ismember(curr_elem,neurons_activated_obs_cage.list{k}))
%                  p = find(neurons_activated_obs_cage.list{k} == curr_elem);
%                  neurons_activated_obs_cage.list{k}(p)=[];
%              else
%                  break;
% 
%              end
%             end
%         end
%     end
%     
% end


% list of  neurons of neutral active every 0.05*step s

neurons_activated_neutral_cage.times = obs_cage(1:step:end,1);

for j = 1:size(neurons_activated_neutral_cage.times,1)-1
    list = [];

    for i=1:size(neutral_roi_data,2)
        b = neutral_roi_data(i).detector;
        k1 = find(times == neurons_activated_neutral_cage.times(j));
        k2 = find(times == neurons_activated_neutral_cage.times(j+1));
        if(sum(neutral_roi_data(i).detector(k1:k2))>(step-1))
            list = [list neutral_roi_data(i).name];
        end
        
    end
    neurons_activated_neutral_cage.list{j} = list;
end
     
for i = 1:length(neurons_activated_neutral_cage.list)-1

    for j = 1:length(neurons_activated_neutral_cage.list{i})

        curr_elem = neurons_activated_neutral_cage.list{i}(j);

        for k = i+1:length(neurons_activated_neutral_cage.list)

            if(~isempty(neurons_activated_neutral_cage.list{k}))

             if(ismember(curr_elem,neurons_activated_neutral_cage.list{k}))
                 p = find(neurons_activated_neutral_cage.list{k} == curr_elem);
                 neurons_activated_neutral_cage.list{k}(p)=[];
             else
                 break;

             end
            end
        end
    end
    
end

% Build matrices A for 3 mice: row i is neuron, column k is list number k
% of activations. A(i,k) = 1 means that the neuron #i belongs to interval #k

A_stress_cage=zeros(size(stress_roi_data_cage,2),size(neurons_activated_stress_cage.list,2));
        
for i =1:size(stress_roi_data_cage,2)
    
    name = stress_roi_data_cage(i).name;
    
    for k = 1:size(neurons_activated_stress_cage.list,2)
        
         if(~isempty(neurons_activated_stress_cage.list{k}))
             
        if (ismember(name, neurons_activated_stress_cage.list{k}))
            
            A_stress_cage(i,k) = 1;
            
        end
        end
        
    end
    
end


A_obs_cage=zeros(size(obs_roi_data_cage,2),size(neurons_activated_obs_cage.list,2));
        
for i =1:size(obs_roi_data_cage,2)
    
    name = obs_roi_data_cage(i).name;
    
    for k = 1:size(neurons_activated_obs_cage.list,2)
        
        if(~isempty(neurons_activated_obs_cage.list{k}))
        
        if (ismember(name, neurons_activated_obs_cage.list{k}))
            
            A_obs_cage(i,k) = 1;           
            
        end
        end
        
    end
    
end


A_neutral_cage=zeros(size(neutral_roi_data,2),size(neurons_activated_neutral_cage.list,2));
        
for i =1:size(neutral_roi_data,2)
    
    name = neutral_roi_data(i).name;
    
    for k = 1:size(neurons_activated_neutral_cage.list,2)
        
         if(~isempty(neurons_activated_neutral_cage.list{k}))
             
        if (ismember(name, neurons_activated_neutral_cage.list{k}))
            
            A_neutral_cage(i,k) = 1;
            
        end    
        end
        
    end
    
end

% Find indices of A corresponding to observer close to stressed or neutral

% [ left2, right2 ,intermediate] = detect_areas(ad_cage_zone);
% 
% t = obs_cage(1:step:end,1);
% stress_t = [];
% 
% for i=1:length(right2)
%     i_stress = find(right2(i)>t);
%     i_stress = i_stress(end);
%     stress_t = [stress_t i_stress];
% end
% 
%  stress_t = unique(stress_t);  
%  stress_t = stress_t(1:end-1);
% 
% 
% neutral_t = [];
% 
% for i=2:length(left2)
%     i_neutral = find(left2(i)>t);
%     i_neutral = i_neutral(end);
%     neutral_t = [neutral_t i_neutral];
% end
% 
%  neutral_t = unique(neutral_t);  
%     neutral_t = neutral_t(1:end-1);

 
            
% For every active neuron  of observer, let's count when the neurons of
% the stressed are active too in same or near intervals 
% A_obs_stress_cage = A_obs_cage;
% 
% total_peaks_obs_stress_cage = (sum(sum(m_detector_stress_cage(:,2:end)))) /(step);
% 
% for i = 1:size(A_obs_stress_cage,1)
%     
%     for j = 1:size(A_stress_cage,1)
%         indices = find(A_obs_stress_cage(i,:) == 1 );
%         if(isempty(indices))
%             Obs_stress_connections_cage(i,j)=0;
%         else
% 
%          
%                 if(j>1 && j < size(A_stress_cage,1))
%         Obs_stress_connections_cage(i,j) = ((sum(A_obs_stress_cage(i,indices) == A_stress_cage(j,indices))) + ...
%            (sum(A_obs_stress_cage(i,indices) == A_stress_cage(j-1,indices))) + ...
%            (sum(A_obs_stress_cage(i,indices) == A_stress_cage(j+1,indices))))/total_peaks_obs_stress_cage;
% 
%                 else
%                 if(j==1 || j== size(A_stress_cage,1))
%         Obs_stress_connections_cage(i,j) = (sum(A_obs_stress_cage(i,indices) == A_stress_cage(j,indices)))/total_peaks_obs_stress_cage;
% 
%                 end
%                 end
%             end
%             end
% 
% 
%         end
% 
% 
% 
%     
% 
% 
% % For every active neuron  of observer, let's count when the neurons of
% % the neutral are active too in same or near intervals    
% 
% A_obs_neutral_cage = A_obs_cage;
% 
% 
% total_peaks_obs_neut_cage =(sum(sum(m_detector_neutral_cage(:,2:end)))) /(step);
% 
% for i = 1:size(A_obs_neutral_cage,1)
%     
%     for j = 1:size(A_neutral_cage,1)
%         indices = find(A_obs_neutral_cage(i,:) == 1 );
%         if(isempty(indices))
%             Obs_neutral_connections_cage(i,j)=0;
%         else
% 
%          
%                 if(j>1 && j < size(A_neutral_cage,1))
%         Obs_neutral_connections_cage(i,j) = ((sum(A_obs_neutral_cage(i,indices) == A_neutral_cage(j,indices))) + ...
%            (sum(A_obs_neutral_cage(i,indices) == A_neutral_cage(j-1,indices))) + ...
%            (sum(A_obs_neutral_cage(i,indices) == A_neutral_cage(j+1,indices))))/total_peaks_obs_neut_cage;
% 
%                 else
%                 if(j==1 || j== size(A_neutral_cage,1))
%         Obs_neutral_connections_cage(i,j) = ((sum(A_obs_neutral_cage(i,indices) == A_neutral_cage(j,indices))))/total_peaks_obs_neut_cage;
% 
%                 end
%                 end
%             end
%             end
% 
% 
%         end
% 
% 
% figure
% 
% heatmap(Obs_stress_connections_cage)
% 
% xlabel ('Neurons of stressed mouse')
% 
% ylabel ('Neurons of observer mouse')
% 
% title('Simultaneous peaks between observer and stressed during homecage')
% 
% set(gca,'FontSize',20)
% 
% figure
% 
% heatmap(Obs_neutral_connections_cage)
% 
% xlabel ('Neurons of neutral mouse')
% 
% ylabel ('Neurons of observer mouse')
% 
% title('Simultaneous peaks between observer and neutral during homecage')
% 
% set(gca,'FontSize',20)



