% Developed by Fabrizio Bernardi 

% ACTIVITY ON THE OBSERVER BASED ON ZONES
%  
% Creates partitions of zone_adapted based on observer's position
% 
% Plot of observer's activity, different colors for each case

function zone_plot(zone_adapted,dataset)

left = [];

right = [];

nostim = [];

if(dataset ~=5)
for i = 1: size(zone_adapted,1)
    
    if (zone_adapted(i,4) == 1)
        
        left = [ left ;zone_adapted(i,:)];
    end
        
    if (zone_adapted(i,5) == 1)
            
            right = [right ;zone_adapted(i,:)];
    end
            
    if (zone_adapted(i,6) == 1)
                
                nostim = [nostim ; zone_adapted(i,:)];
    end
    
end
    
                
 plot(left(:,1),left(:,7),'b.',right(:,1),right(:,7),'r.',nostim(:,1),nostim(:,7),'g.');

end

if(dataset==5)
for i = 1: size(zone_adapted,1)
    
    if (zone_adapted(i,4) == 1)
        
        left = [ left ;zone_adapted(i,:)];
    end
        
    if (zone_adapted(i,5) == 1)
            
            right = [right ;zone_adapted(i,:)];
    end
            
    if (zone_adapted(i,6) == 1)
                
                nostim = [nostim ; zone_adapted(i,:)];
    end
    
end
    
                
 plot(left(:,1),left(:,10),'b.',right(:,1),right(:,10),'r.',nostim(:,1),nostim(:,10),'g.');
end
% hold on
% 
% plot(left(:,1),zeros(size(left(:,1)))+2,'b.',right(:,1),zeros(size(right(:,1)))+2,...
%     'r.',nostim(:,1),zeros(size(nostim(:,1)))+2,'g.')

if(dataset==1 || dataset ==3 || dataset==5)

legend('near to neutral', 'near to stressed','intermediate zone')

else

    legend('near to stressed', 'near to neutral','intermediate zone')
end

            
            