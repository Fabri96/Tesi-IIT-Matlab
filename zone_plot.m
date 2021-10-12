% Developed by Fabrizio Bernardi 

% ACTIVITY ON THE OBSERVER BASED ON ZONES
%  
% Creates partitions of ad_test_zone based on observer's position
% 
% Plot of observer's activity, different colors for each case


left = [];

right = [];

nostim = [];


for i = 1: size(ad_test_zone,1)
    
    if (ad_test_zone(i,4) == 1)
        
        left = [ left ;ad_test_zone(i,:)];
    end
        
    if (ad_test_zone(i,5) == 1)
            
            right = [right ;ad_test_zone(i,:)];
    end
            
    if (ad_test_zone(i,6) == 1)
                
                nostim = [nostim ; ad_test_zone(i,:)];
    end
    
end
    
                
 plot(left(:,1),left(:,7),'b.',right(:,1),right(:,7),'r.',nostim(:,1),nostim(:,7),'g.');


hold on

plot(left(:,1),zeros(size(left(:,1)))+2,'b.',right(:,1),zeros(size(right(:,1)))+2,...
    'r.',nostim(:,1),zeros(size(nostim(:,1)))+2,'g.')


legend('near to neutral', 'near to stressed','intermediate zone','','','')

            
            