for j = 2:size(stress_test,2)

stress_test_sniff(:,j-1) = interp1(stress_test(:,1),stress_test(:,j), sniff(:,1));

end

for j = 2:size(obs_test,2)

obs_test_sniff(:,j-1) = interp1(obs_test(:,1),obs_test(:,j), sniff(:,1));

end

y = interp1(obs_activity_test(:,1),obs_activity_test(:,2), sniff(:,1));

model_sniff= fitglm(stress_test_sniff,y);

