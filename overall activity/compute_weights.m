% Developed by Fabrizio Bernardi 

% COMPUTE WEIGHTS CONSIDERING ACTIVITY AND VICINANCE TO DEMONSTRATORS
%  

function weights = compute_weights(data,ad_zone, mouse)

if (strcmp(mouse,'obs'))

ad_neurons(:,1) = ad_zone(:,1);

for j = 2:size(data,2)
    
    ad_neurons(:,j) = interp1(data(:,1),data(:,j),ad_zone(:,1));
    
end


neurons_detector =  mad_detector(ad_neurons);

for j =2:size(neurons_detector,2)
    
    indices = find(neurons_detector(:,j)==1);
    
    weights(j-1) = sum(ad_zone(indices,4) ==1) + sum( ad_zone(indices,5) == 1);
    
end
end

if (strcmp(mouse,'stress'))
    
 ad_neurons(:,1) = ad_zone(:,1);

for j = 2:size(data,2)
    
    ad_neurons(:,j) = interp1(data(:,1),data(:,j),ad_zone(:,1));
    
end

neurons_detector =  mad_detector(ad_neurons);

for j =2:size(neurons_detector,2)
    
    indices = find(neurons_detector(:,j)==1);
    
    weights(j-1) =  sum( ad_zone(indices,5) == 1);
    
end
end

if (strcmp(mouse,'neutral'))

ad_neurons(:,1) = ad_zone(:,1);

for j = 2:size(data,2)
    
    ad_neurons(:,j) = interp1(data(:,1),data(:,j),ad_zone(:,1));
    
end

neurons_detector =  mad_detector(ad_neurons);

for j =2:size(neurons_detector,2)
    
    indices = find(neurons_detector(:,j)==1);
    
    weights(j-1) = sum(ad_zone(indices,4) ==1) ;
    
end
end