% Developed by Fabrizio Bernardi 

% 3D PLOT OF CALCIUM ACTIVITY VS SPACE COORDINATES
%  
% 
% 
%



function space_plot(ad_zone)

x = ad_zone(:,2);

y = ad_zone(:,3);

k = boundary(x,y);

plot(x(k),y(k));

% [p,e,t] = initmesh('lshapeg','Hmax',0.1);

% p = decsg(gd)

% plot3(ad_zone(:,2), ad_zone(:,3),ad_zone(:,7),'r-')

%mesh(x(k), y(k), ad_zone(:,7))
