% Developed by Fabrizio Bernardi 

% MAD TRESHOLD FOR ACTIVITY
% 
% All above the line obtained through MAD algorithm is considered active
% 
% INPUT --> matrix you want to investigate
% 
% 
% OUTPUT --> binary matrix with activations

function m_detector = mad_detector(data)

m_detector(:,1) = data(:,1);

for j = 2:size(data,2)
    
    local_data = [data(:,1) data(:,j)];
    
    [mad_treshold,times] = mad_tresh(local_data);
 
    
    interp_treshold = interp1(times, mad_treshold , local_data(:,1));
    
    for i = 1:size(local_data,1)
        
        if local_data(i,2) >= interp_treshold(i)
            
            m_detector(i,j)= 1;
            
        else
            
            m_detector(i,j)= 0;
        end
    end
end
            
            















