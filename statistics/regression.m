X= obs_test(:,2:end);
y1=stress_activity_test(:,2);
% y2=neutral_activity_test(:,2);

model1 = fitlm(X,y1);
% model2 = fitlm(X,y2);

[ left, right ,intermediate] = detect_areas(ad_test_zone);

obs_activity_test_stress = interp1(obs_activity_test(:,1),obs_activity_test(:,2), left);

obs_activity_test_neutral = interp1(obs_activity_test(:,1),obs_activity_test(:,2), right);

stress_activity_test2 = interp1(stress_activity_test(:,1),stress_activity_test(:,2), left);

neutral_activity_test2 = interp1(neutral_activity_test(:,1),neutral_activity_test(:,2), right);

for j = 2:(size(obs_test,2))

obs_test_stress(:,j-1) = interp1(obs_test(:,1),obs_test(:,j), left);

end


X2= obs_test_stress;
y2= stress_activity_test2;
model2 = fitlm(X2,y2);
 an1=anova(model2);
 
 

 
% a=sort(an1{1:end-1,1});
% val = [];
% 
% for k=8:length(a)
%     k = find(an1{:,1}==a(k));
%     val = [ val k];
% end
% val2=sort(val);
% model2 = fitlm(obs_test_stress(:,val2),y2);
%      