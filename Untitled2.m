

plot(stress_activity(:,1),stress_activity(:,2),'r-.',obs_activity(:,1),obs_activity(:,2),'b-.', ...
    'MarkerIndices',find(ad_test_zone(:,5)==1),'MarkerSize',2,'MarkerEdgeColor','k')

hold on

