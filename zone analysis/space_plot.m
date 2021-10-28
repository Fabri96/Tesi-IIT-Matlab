% Developed by Fabrizio Bernardi 

% 3D PLOT OF CALCIUM ACTIVITY VS SPACE COORDINATES
%  
% 
% 
%



function [X,Y] = space_plot(ad_zone)

x = ad_zone(:,2);

y = ad_zone(:,3);

k = boundary(x,y);

plot(x(k),y(k));

T = delaunayTriangulation([x y]);

% triplot(T)
% hold on




for  i = 1:size(T.Points,1)
    
    n = find(ad_zone(:,2) == T.Points(i,1) & ad_zone(:,3)==T.Points(i,2));
    
    n=n(1);
    
    z(i) = ad_zone(n,7);
    
end

a1 = T.Points(:,1);

a1 = a1(1:100:end);

a2 = T.Points(:,2);

a2 = a2(1:100:end);

z = z(1:100:end);

[X,Y] = meshgrid(a1,a2);

% X = X(1:100:end,1:100:end);
% 
% Y = Y(1:100:end,1:100:end);
% 
% Z = Z(1:100:end,1:100:end);

T2 = delaunayTriangulation([X Y]);


trisurf(T2,X,Y,Y)
% plot3(T.Points(:,1),T.Points(:,2),z')

% [p,e,t] = initmesh('lshapeg','Hmax',0.1);

% p = decsg(gd)

% plot3(ad_zone(:,2), ad_zone(:,3),ad_zone(:,7),'r-')

%mesh(x(k), y(k), ad_zone(:,7))
