x = ad_test_zone(:,2);

y = ad_test_zone(:,3);

p =  find(x>325);
p2 =  find(y < 230);


zone1 = intersect(p,p2);

p = find(x >293);
p2 = find(y >230);
p3 = find(y <280);

zone2 = intersect(p,intersect(p2,p3));

p = find(y>280);
p2 =  find(x > 293);

zone3 = intersect(p,p2);

p = find(x <293);
p2 = find(y >230);
p3 = find(y <280);

zone5 = intersect(p,intersect(p2,p3));

p =  find(x<293);
p2 =  find(y >280);

zone4 = intersect(p,p2);

p =  find(x<293);
p2 =  find(y<230);

zone6 = intersect(p,p2);

plot(ad_test_zone(zone1,2),ad_test_zone(zone1,3),'b')
hold on
plot(ad_test_zone(zone2,2),ad_test_zone(zone2,3),'r')
plot(ad_test_zone(zone3,2),ad_test_zone(zone3,3),'g')
plot(ad_test_zone(zone4,2),ad_test_zone(zone4,3),'y')
plot(ad_test_zone(zone5,2),ad_test_zone(zone5,3),'c')
plot(ad_test_zone(zone6,2),ad_test_zone(zone6,3),'k')

legend('zone1','zone2','zone3','zone4','zone5','zone6')


obs_stress_zone1 = interp1(obs_activity_test(:,1),obs_activity_test(:,2), ad_test_zone(zone1,1));
obs_stress_zone2 = interp1(obs_activity_test(:,1),obs_activity_test(:,2), ad_test_zone(zone2,1));
obs_stress_zone3 = interp1(obs_activity_test(:,1),obs_activity_test(:,2), ad_test_zone(zone2,1));
obs_stress_zone4 = interp1(obs_activity_test(:,1),obs_activity_test(:,2), ad_test_zone(zone3,1));
obs_stress_zone5 = interp1(obs_activity_test(:,1),obs_activity_test(:,2), ad_test_zone(zone5,1));
obs_stress_zone6 = interp1(obs_activity_test(:,1),obs_activity_test(:,2), ad_test_zone(zone6,1));

stress_zone1 = interp1(stress_activity_test(:,1),stress_activity_test(:,2), ad_test_zone(zone1,1));
stress_zone2 = interp1(stress_activity_test(:,1),stress_activity_test(:,2), ad_test_zone(zone2,1));
stress_zone3 = interp1(stress_activity_test(:,1),stress_activity_test(:,2), ad_test_zone(zone2,1));
stress_zone4 = interp1(stress_activity_test(:,1),stress_activity_test(:,2), ad_test_zone(zone3,1));
stress_zone5 = interp1(stress_activity_test(:,1),stress_activity_test(:,2), ad_test_zone(zone5,1));
stress_zone6 = interp1(stress_activity_test(:,1),stress_activity_test(:,2), ad_test_zone(zone6,1));

res =[];
[c1,~] = xcorr(obs_stress_zone1,stress_zone1,'normalized');

res = [res max(abs(c1))];

[c2,~] = xcorr(obs_stress_zone2,stress_zone2,'normalized');

res = [res max(abs(c2))];

[c3,~] = xcorr(obs_stress_zone3,stress_zone3,'normalized');

res = [res max(abs(c3))];

[c4,~] = xcorr(obs_stress_zone4,stress_zone4,'normalized');

res = [res max(abs(c4))];

[c5,~] = xcorr(obs_stress_zone5,stress_zone5,'normalized');

res = [res max(abs(c5))];

[c6,~] = xcorr(obs_stress_zone6,stress_zone6,'normalized');

res = [res max(abs(c6))];


figure

plot([1:6],res,'r-o')
