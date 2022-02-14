function [activity_near,activity_far,zone] = one_one_zones(activity,zone)

zone(:,1) = zone(:,1)+  activity(1,1);

activity_all= interp1(activity(:,1), activity(:,2), zone(:,1));

k1 = find(zone(:,4)==1);

k2 = find(zone(:,5)==1);

activity_far = activity_all(k2);

activity_near= activity_all(k1);