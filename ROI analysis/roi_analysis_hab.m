% Developed by Fabrizio Bernardi 

% Analysis of position of neurons in the ROI for the 3 mice during
% habituation
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

neutral_ROI(3,:)=[];


% v = neutral_ROI(1,:);
% neutral_ROI(1,:) = neutral_ROI(5,:);
% neutral_ROI(5,:) = v;
% 
% v = neutral_ROI(2,:);
% neutral_ROI(2,:) = neutral_ROI(8,:);
% neutral_ROI(8,:) = v;
% 
% v = neutral_ROI(3,:);
% neutral_ROI(3,:) = neutral_ROI(11,:);
% neutral_ROI(11,:) = v;
% 
% v = neutral_ROI(4,:);
% neutral_ROI(4,:) = neutral_ROI( 6,:);
% neutral_ROI(6,:) = v;
% 
% v = neutral_ROI(5,:);
% neutral_ROI(5,:) = neutral_ROI( 7,:);
% neutral_ROI(7,:) = v;
% 
% v = neutral_ROI(6,:);
% neutral_ROI(6,:) = neutral_ROI(14,:);
% neutral_ROI(14,:) = v;
% 
% v = neutral_ROI(7,:);
% neutral_ROI(7,:) = neutral_ROI(2,:);
% neutral_ROI(2,:) = v;
% 
% v = neutral_ROI(8,:);
% neutral_ROI(8,:) = neutral_ROI(1,: );
% neutral_ROI(1,:) = v;
% 
% 
% v = neutral_ROI(9,:);
% neutral_ROI(9,:) = neutral_ROI(10,:);
% neutral_ROI(10,:) = v;
% 
% v = neutral_ROI(10,:);
% neutral_ROI(10,:) = neutral_ROI(13,:);
% neutral_ROI(13,:) = v;
% 
% v = neutral_ROI(11,:);
% neutral_ROI(11,:) = neutral_ROI(4,:);
% neutral_ROI(4,:) = v;
% 
% v = neutral_ROI(12,:);
% neutral_ROI(12,:) = neutral_ROI(9,:);
% neutral_ROI(9,:) = v;
% 
% v = neutral_ROI(13,:);
% neutral_ROI(13,:) = neutral_ROI(12,:);
% neutral_ROI(12,:) = v;


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

stress_roi_data_hab = [];
 m_detector_stress_hab = mad_detector(stress_hab);

% m_detector_stress = activity_detector(stress_hab);

for i = 1:size(stress_roi,1)
    
    stress_roi_data_hab(i).name = stress_roi(i,1);
    stress_roi_data_hab(i).x = double(stress_roi(i,6));
    stress_roi_data_hab(i).y = double(stress_roi(i,7));
    stress_roi_data_hab(i).size = double(stress_roi(i,9));
    stress_roi_data_hab(i).times = stress_hab(:,1);
    stress_roi_data_hab(i).activity = stress_hab(:,i+1);
    stress_roi_data_hab(i).detector = m_detector_stress_hab(:,i+1);
    
end

clear stress_roi
% observer mouse data

obs_roi = obs_ROI;
k = find(obs_ROI(:,2) == "rejected");
obs_roi(k,:) = [];

obs_roi_data_hab = [];

 m_detector_obs_hab = mad_detector(obs_hab);

% m_detector_obs = activity_detector(obs_hab);

for i = 1:size(obs_roi,1)
    
    obs_roi_data_hab(i).name = obs_roi(i,1);
    obs_roi_data_hab(i).x = double(obs_roi(i,6));
    obs_roi_data_hab(i).y = double(obs_roi(i,7));
    obs_roi_data_hab(i).size = double(obs_roi(i,9));
    obs_roi_data_hab(i).times = obs_hab(:,1);
    obs_roi_data_hab(i).activity = obs_hab(:,i+1);
    obs_roi_data_hab(i).detector = m_detector_obs_hab(:,i+1);
    
end

clear obs_roi

% neutral mouse data

neutral_roi = neutral_ROI;
k = find(neutral_ROI(:,2) == "rejected");
neutral_roi(k,:) = [];

neutral_roi_data = [];

 m_detector_neutral_hab = mad_detector(neutral_hab);
% 
% % m_detector_neutral = activity_detector(neutral_hab);


for i = 1:size(neutral_roi,1)
    
    neutral_roi_data(i).name = neutral_roi(i,1);
    neutral_roi_data(i).x = double(neutral_roi(i,6));
    neutral_roi_data(i).y = double(neutral_roi(i,7));
    neutral_roi_data(i).size = double(neutral_roi(i,9));
    neutral_roi_data(i).times = neutral_hab(:,1);
    neutral_roi_data(i).activity = neutral_hab(:,i+1);
    neutral_roi_data(i).detector = m_detector_neutral_hab(:,i+1);
    
    
end
clear neutral_roi

times = stress_roi_data_hab(1).times;

% list of  neurons of stressed active every 0.05*step seconds

% step = 15; 

neurons_activated_stress_hab.times = obs_hab(1:step:end,1);

for j = 1:size(neurons_activated_stress_hab.times,1)-1
    list = [];

    for i=1:size(stress_roi_data_hab,2)
        b = stress_roi_data_hab(i).detector;
        k1 = find(times == neurons_activated_stress_hab.times(j));
        k2 = find(times == neurons_activated_stress_hab.times(j+1));
        if(sum(stress_roi_data_hab(i).detector(k1:k2))>(step -2))
            list = [list stress_roi_data_hab(i).name];
        end
        
    end
    neurons_activated_stress_hab.list{j} = list;
end


% for i = 1:length(neurons_activated_stress_hab.list)-1
% 
%     for j = 1:length(neurons_activated_stress_hab.list{i})
% 
%         curr_elem = neurons_activated_stress_hab.list{i}(j);
% 
%         for k = i+1:length(neurons_activated_stress_hab.list)
% 
%             if(~isempty(neurons_activated_stress_hab.list{k}))
% 
%              if(ismember(curr_elem,neurons_activated_stress_hab.list{k}))
%                  p = find(neurons_activated_stress_hab.list{k} == curr_elem);
%                  neurons_activated_stress_hab.list{k}(p)=[];
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

neurons_activated_obs_hab.times = obs_hab(1:step:end,1);

for j = 1:size(neurons_activated_obs_hab.times,1)-1
    list = [];

    for i=1:size(obs_roi_data_hab,2)
        b = obs_roi_data_hab(i).detector;
        k1 = find(times == neurons_activated_obs_hab.times(j));
        k2 = find(times == neurons_activated_obs_hab.times(j+1));
        if(sum(obs_roi_data_hab(i).detector(k1:k2))>(step-1))
            list = [list obs_roi_data_hab(i).name];
        end
        
    end
    neurons_activated_obs_hab.list{j} = list;
end

% for i = 1:length(neurons_activated_obs_hab.list)-1
% 
%     for j = 1:length(neurons_activated_obs_hab.list{i})
% 
%         curr_elem = neurons_activated_obs_hab.list{i}(j);
% 
%         for k = i+1:length(neurons_activated_obs_hab.list)
% 
%             if(~isempty(neurons_activated_obs_hab.list{k}))
% 
%              if(ismember(curr_elem,neurons_activated_obs_hab.list{k}))
%                  p = find(neurons_activated_obs_hab.list{k} == curr_elem);
%                  neurons_activated_obs_hab.list{k}(p)=[];
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

neurons_activated_neutral_hab.times = obs_hab(1:step:end,1);

for j = 1:size(neurons_activated_neutral_hab.times,1)-1
    list = [];

    for i=1:size(neutral_roi_data,2)
        b = neutral_roi_data(i).detector;
        k1 = find(times == neurons_activated_neutral_hab.times(j));
        k2 = find(times == neurons_activated_neutral_hab.times(j+1));
        if(sum(neutral_roi_data(i).detector(k1:k2))>(step-1))
            list = [list neutral_roi_data(i).name];
        end
        
    end
    neurons_activated_neutral_hab.list{j} = list;
end
     
% for i = 1:length(neurons_activated_neutral_hab.list)-1
% 
%     for j = 1:length(neurons_activated_neutral_hab.list{i})
% 
%         curr_elem = neurons_activated_neutral_hab.list{i}(j);
% 
%         for k = i+1:length(neurons_activated_neutral_hab.list)
% 
%             if(~isempty(neurons_activated_neutral_hab.list{k}))
% 
%              if(ismember(curr_elem,neurons_activated_neutral_hab.list{k}))
%                  p = find(neurons_activated_neutral_hab.list{k} == curr_elem);
%                  neurons_activated_neutral_hab.list{k}(p)=[];
%              else
%                  break;
% 
%              end
%             end
%         end
%     end
    
% end

% Build matrices A for 3 mice: row i is neuron, column k is list number k
% of activations. A(i,k) = 1 means that the neuron #i belongs to interval #k

A_stress_hab=zeros(size(stress_roi_data_hab,2),size(neurons_activated_stress_hab.list,2));
        
for i =1:size(stress_roi_data_hab,2)
    
    name = stress_roi_data_hab(i).name;
    
    for k = 1:size(neurons_activated_stress_hab.list,2)
        
         if(~isempty(neurons_activated_stress_hab.list{k}))
             
        if (ismember(name, neurons_activated_stress_hab.list{k}))
            
            A_stress_hab(i,k) = 1;
            
        end
        end
        
    end
    
end


A_obs_hab=zeros(size(obs_roi_data_hab,2),size(neurons_activated_obs_hab.list,2));
        
for i =1:size(obs_roi_data_hab,2)
    
    name = obs_roi_data_hab(i).name;
    
    for k = 1:size(neurons_activated_obs_hab.list,2)
        
        if(~isempty(neurons_activated_obs_hab.list{k}))
        
        if (ismember(name, neurons_activated_obs_hab.list{k}))
            
            A_obs_hab(i,k) = 1;           
            
        end
        end
        
    end
    
end


A_neutral_hab=zeros(size(neutral_roi_data,2),size(neurons_activated_neutral_hab.list,2));
        
for i =1:size(neutral_roi_data,2)
    
    name = neutral_roi_data(i).name;
    
    for k = 1:size(neurons_activated_neutral_hab.list,2)
        
         if(~isempty(neurons_activated_neutral_hab.list{k}))
             
        if (ismember(name, neurons_activated_neutral_hab.list{k}))
            
            A_neutral_hab(i,k) = 1;
            
        end    
        end
        
    end
    
end
% 
% % Find indices of A corresponding to observer close to stressed or neutral

[ left2, right2 ,intermediate] = detect_areas(ad_hab_zone);

t = obs_hab(1:step:end,1);
stress_t = [];

for i=1:length(right2)
    i_stress = find(right2(i)>t);
    i_stress = i_stress(end);
    stress_t = [stress_t i_stress];
end

 stress_t = unique(stress_t);  
 stress_t = stress_t(1:end-1);


neutral_t = [];

for i=2:length(left2)
    i_neutral = find(left2(i)>t);
    i_neutral = i_neutral(end);
    neutral_t = [neutral_t i_neutral];
end

 neutral_t = unique(neutral_t);  
    neutral_t = neutral_t(1:end-1);
% 
%  for i = 1:size(A_obs_hab,1)
%     
%     for j = 2:size(A_stress_hab,1)-1
%         indices = find(A_obs_hab(i,:) == 1 );
%         prova(i,j) = (sum(A_obs_hab(i,indices) == A_stress_hab(j,indices)) + ...
%            sum(A_obs_hab(i,indices) == A_stress_hab(j-1,indices)) + ...
%            sum(A_obs_hab(i,indices) == A_stress_hab(j+1,indices))) /(3*length(indices));
%         
%     end
%     
% end
%             
% % For every active neuron  of observer, let's count when the neurons of
% % the stressed are active too in same or near intervals 
A_obs_stress_hab = A_obs_hab(:,stress_t);
A_stress_hab = A_stress_hab(:,stress_t);
% total_peaks_obs_stress_hab = (sum(sum(m_detector_stress_hab(:,2:end)))) /(step);
% 
% for i = 1:size(A_obs_stress_hab,1)
%     
%     for j = 1:size(A_stress_hab,1)
%         indices = find(A_obs_stress_hab(i,:) == 1 );
%         if(isempty(indices))
%             Obs_stress_connections_hab(i,j)=0;
%         else
% 
%          
%                 if(j>1 && j < size(A_stress_hab,1))
%         Obs_stress_connections_hab(i,j) = ((sum(A_obs_stress_hab(i,indices) == A_stress_hab(j,indices))) + ...
%            (sum(A_obs_stress_hab(i,indices) == A_stress_hab(j-1,indices))) + ...
%            (sum(A_obs_stress_hab(i,indices) == A_stress_hab(j+1,indices))))/total_peaks_obs_stress_hab;
% 
%                 else
%                 if(j==1 || j== size(A_stress_hab,1))
%         Obs_stress_connections_hab(i,j) = (sum(A_obs_stress_hab(i,indices) == A_stress_hab(j,indices)))/total_peaks_obs_stress_hab;
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
A_obs_neutral_hab = A_obs_hab(:,neutral_t);
A_neutral_hab = A_neutral_hab(:,neutral_t);
% 
% total_peaks_obs_neut_hab =(sum(sum(m_detector_neutral_hab(:,2:end)))) /(step);
% 
% for i = 1:size(A_obs_neutral_hab,1)
%     
%     for j = 1:size(A_neutral_hab,1)
%         indices = find(A_obs_neutral_hab(i,:) == 1 );
%         if(isempty(indices))
%             Obs_neutral_connections_hab(i,j)=0;
%         else
% 
%          
%                 if(j>1 && j < size(A_neutral_hab,1))
%         Obs_neutral_connections_hab(i,j) = ((sum(A_obs_neutral_hab(i,indices) == A_neutral_hab(j,indices))) + ...
%            (sum(A_obs_neutral_hab(i,indices) == A_neutral_hab(j-1,indices))) + ...
%            (sum(A_obs_neutral_hab(i,indices) == A_neutral_hab(j+1,indices))))/total_peaks_obs_neut_hab;
% 
%                 else
%                 if(j==1 || j== size(A_neutral_hab,1))
%         Obs_neutral_connections_hab(i,j) = ((sum(A_obs_neutral_hab(i,indices) == A_neutral_hab(j,indices))))/total_peaks_obs_neut_hab;
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
% heatmap(Obs_stress_connections_hab)
% 
% xlabel ('Neurons of stressed mouse')
% 
% ylabel ('Neurons of observer mouse')
% 
% title('Simultaneous peaks between observer and stressed during habituation')
% 
% set(gca,'FontSize',20)
% 
% figure
% 
% heatmap(Obs_neutral_connections_hab)
% 
% xlabel ('Neurons of neutral mouse')
% 
% ylabel ('Neurons of observer mouse')
% 
% title('Simultaneous peaks between observer and neutral during habituation')
% 
% set(gca,'FontSize',20)



