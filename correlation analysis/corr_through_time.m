
clear res
clear res2
clear res3

num=5; % fix the number of partitions you want to consider

% dataset=4; % select the dataset you are working on


if(dataset==1 || dataset==3)

for i = 1:num
obs_test_stress{i} = interp1(obs_activity_test(:,1),obs_activity_test(:,2),...
    right(1:round(i*length(right)/num)));

stress_test2{i} = interp1(stress_activity_test(:,1),stress_activity_test(:,2), ...
    right(1:round(i*length(right)/num)));

obs_test_neutr{i} = interp1(obs_activity_test(:,1),obs_activity_test(:,2),...
    left(1:round(i*length(left)/num)));

neutr_test2{i} = interp1(neutral_activity_test(:,1),neutral_activity_test(:,2), ...
    left(1:round(i*length(left)/num)));

obs_hab_stress{i} = interp1(obs_activity_hab(:,1),obs_activity_hab(:,2),...
    right2(1:round(i*length(right2)/num)));

stress_hab2{i} = interp1(stress_activity_hab(:,1),stress_activity_hab(:,2), ...
    right2(1:round(i*length(right2)/num)));

[c,lags] = xcorr(obs_test_stress{i},stress_test2{i},'normalized');

[c2,lags] = xcorr(obs_test_neutr{i},neutr_test2{i},'normalized');

[c3,lags] = xcorr(obs_hab_stress{i},stress_hab2{i},'normalized');

res(i) = max(abs(c));

res2(i) = max(abs(c2));

res3(i) = max(abs(c3));
end

figure

subplot(1,2,1)

plot([1:1:num],res,'b-o','LineWidth',3)
xlabel('Phases of the test')
ylabel('cross correlation')
title('Cross correlation evolution between observer and stressed during the test')

subplot(1,2,2)
plot([1:1:num],res2,'r-o','LineWidth',3)
xlabel('Phases of the test')
ylabel('cross correlation')
title('Cross correlation evolution between observer and neutral during the test')

figure

plot([1:1:num],res3,'r-o','LineWidth',3)

hold on

plot([num+1:1:2*num],res,'b-o','LineWidth',3)

xlim([0,7])

legend('habituation','test')

title('Cross correlation evolution between observer and stressed during the experiment')

end




if(dataset==2)

for i = 1:num
obs_test_stress{i} = interp1(obs_activity_test(:,1),obs_activity_test(:,2),...
    left(1:round(i*length(left)/num)));

stress_test2{i} = interp1(stress_activity_test(:,1),stress_activity_test(:,2), ...
    left(1:round(i*length(left)/num)));

obs_test_neutr{i} = interp1(obs_activity_test(:,1),obs_activity_test(:,2),...
    right(1:round(i*length(right)/num)));

neutr_test2{i} = interp1(neutral_activity_test(:,1),neutral_activity_test(:,2), ...
    right(1:round(i*length(right)/num)));

obs_hab_stress{i} = interp1(obs_activity_hab(:,1),obs_activity_hab(:,2),...
    left2(1:round(i*length(left2)/num)));

stress_hab2{i} = interp1(stress_activity_hab(:,1),stress_activity_hab(:,2), ...
    left2(1:round(i*length(left2)/num)));

[c,lags] = xcorr(obs_test_stress{i},stress_test2{i},'normalized');

[c2,lags] = xcorr(obs_test_neutr{i},neutr_test2{i},'normalized');

[c3,lags] = xcorr(obs_hab_stress{i},stress_hab2{i},'normalized');

res(i) = max(abs(c));

res2(i) = max(abs(c2));

res3(i) = max(abs(c3));
end

figure
subplot(1,2,1)
plot([1:1:num],res,'b-o','LineWidth',3)
xlabel('Phases of the test')
ylabel('cross correlation')
title('Cross correlation evolution between observer and stressed during the test')

subplot(1,2,2)

plot([1:1:num],res2,'r-o','LineWidth',3)
xlabel('Phases of the test')
ylabel('cross correlation')
title('Cross correlation evolution between observer and neutral during the test')

figure

plot([1:1:num],res3,'r-o','LineWidth',3)

hold on

plot([num+1:1:2*num],res,'b-o','LineWidth',3)

xlim([0,7])

legend('habituation','test')

title('Cross correlation evolution between observer and stressed during the experiment')

end

if(dataset==4)

for i = 1:num
obs_test_stress{i} = interp1(obs_activity_test(:,1),obs_activity_test(:,2),...
    left(1:round(i*length(left)/num)));

stress_test2{i} = interp1(stress_activity_test(:,1),stress_activity_test(:,2), ...
    left(1:round(i*length(left)/num)));

obs_test_neutr{i} = interp1(obs_activity_test(:,1),obs_activity_test(:,2),...
    right(1:round(i*length(right)/num)));

neutr_test2{i} = interp1(neutral_activity_test(:,1),neutral_activity_test(:,2), ...
    right(1:round(i*length(right)/num)));

obs_hab_stress{i} = interp1(obs_activity_hab(:,1),obs_activity_hab(:,2),...
    left2(1:round(i*length(left2)/num)));

stress_hab2{i} = interp1(stress_activity_hab(:,1),stress_activity_hab(:,2), ...
    left2(1:round(i*length(left2)/num)));

[c,lags] = xcorr(obs_test_stress{i},stress_test2{i},'normalized');

[c2,lags] = xcorr(obs_test_neutr{i},neutr_test2{i},'normalized');

[c3,lags] = xcorr(obs_hab_stress{i},stress_hab2{i},'normalized');

res(i) = max(abs(c));

res2(i) = max(abs(c2));

res3(i) = max(abs(c3));
end

figure
subplot(1,2,1)

plot([1:1:num],res,'b-o','LineWidth',3)
xlabel('Phases of the test')
ylabel('cross correlation')
title('Cross correlation evolution between observer and stressed during the test')

subplot(1,2,2)

plot([1:1:num],res2,'r-o','LineWidth',3)
xlabel('Phases of the test')
ylabel('cross correlation')
title('Cross correlation evolution between observer and neutral during the test')

figure

plot([1:1:num],res3,'r-o','LineWidth',3)

hold on

plot([num+1:1:2*num],res,'b-o','LineWidth',3)

xlim([0,7])

legend('habituation','test')

title('Cross correlation evolution between observer and stressed during the experiment')

end

