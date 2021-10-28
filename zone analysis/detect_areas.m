% Developed by Fabrizio Bernardi  

% Takes a zone file (adapted) and it returns the partitition of the times
% corresponding to vicinance to left, right or none
% 



function [ left, right ,intermediate] = detect_areas(zone_adapted)


left = [];

right = [];

intermediate = [];


for i = 1: size(zone_adapted,1)
    
    if (zone_adapted(i,4) == 1)
        
        left = [ left ;zone_adapted(i,1)];
    end
        
    if (zone_adapted(i,5) == 1)
            
            right = [right ;zone_adapted(i,1)];
    end
            
    if (zone_adapted(i,6) == 1)
                
                intermediate = [intermediate ; zone_adapted(i,1)];
    end
    
end