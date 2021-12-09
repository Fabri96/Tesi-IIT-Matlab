% Developed by Fabrizio Bernardi 

% List of subsequent activations of neurons
% 
% INPUT --> data of type neurons_activated 8struct with times intervals and
% list of neurons active in each interval
% 
% OUTPUT -> list of subsequent activations, recording of time occuring
% before the activation

function patterns = pattern_list(neuron_data,roi_data)
format long
k=1;
list = neuron_data.list;
for i=1:length(list)-1
    if(~isempty(list{i+1}) && ~isempty(list{i}))

    
    

        for j=1:length(list{i+1})
            if (~ismember(list{i+1}(j),list{i}))
                
                pairings1 =list{i};
                pairings2 =list{i+1}(j);
                patterns{k}.previous =  pairings1 ;
                patterns{k}.next = pairings2;
                patterns{k}.interval = [neuron_data.times(i) neuron_data.times(i+1)];
                for p=1:length(patterns{k}.previous)                   
                patterns{k}.amplitude_previous(p) = ...
                    find_amplitude(neuron_data.times(i) ,neuron_data.times(i+1),patterns{k}.previous(p),roi_data);
                end
                for p=1:length(patterns{k}.next)
                patterns{k}.amplitude_next(p) = ...
                    find_amplitude(neuron_data.times(i+1) ,neuron_data.times(i+2),patterns{k}.next(p),roi_data);
                end
                
                
                k=k+1;
            
            end
        end
    
    end

    
end





