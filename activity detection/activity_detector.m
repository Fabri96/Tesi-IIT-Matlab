% Developed by Fabrizio Bernardi 

% TRESHOLD FOR ACTIVITY
%  
% t = mu + 2*sigma
% 
% All above this line is considered active
% 
% INPUT --> matrix you want to investigate
% 
% 
% OUTPUT --> binary matrix with activations
% 
 


function detector = activity_detector(data)



detector = data;



for j = 2:size(data,2)
    mu = mean(data(:,j));
    sigma = std(data(:,j));
    for i = 1:size(data,1)
        
        if data(i,j) >= mu + 2*sigma
            
            detector(i,j)= 1;
            
        else
            
            detector(i,j)= 0;
            
        end
        
    end
end



    
    
    