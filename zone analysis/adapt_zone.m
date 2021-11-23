% Developed by Fabrizio Bernardi  

% Adapt the zone files to the mice activity files:
% 
% - times in zone file start will start like observer times and finish at
%   the minimum between the 2
% 
% - add last column as activity of observer at specified time and position
%

function ad_zone = adapt_zone(zone, activity)

% if(dataset ==3)
% sniff_diff = 1446.1 - 1440.8; 
% end


zone(:,1) = zone(:,1) + activity(1,1); % now times start at same value

zone = zone(2:end,:);

minimum = min(zone(end,1), activity(end,1));


k= find(zone(:,1) > minimum);

if(~isempty(k))
k= k(1) -1;
values = interp1(activity(:,1),activity(:,2),zone(1:k,1)); 

ad_zone = [zone(1:k,:) values];

else

values = interp1(activity(:,1),activity(:,2),zone(:,1));
ad_zone = [zone(:,:) values];

end

%  ad_zone(:,1) = ad_zone(:,1) - sniff_diff;