X= obs_test(:,2:end);
% y1=stress_activity_test(:,2);
 y2=neutral_activity_test(:,2);

% model1 = fitlm(X,y1);
model1 = fitlm(X,y2);



for j = 2:(size(obs_test,2))

obs_test_stress(:,j-1) = interp1(obs_test(:,1),obs_test(:,j), right);

obs_test_neutral(:,j-1) = interp1(obs_test(:,1),obs_test(:,j), left);

end


% X2= obs_test_stress;
X2= obs_test_neutral;
X2(:,[ 6 7 13])=[];
% y2= stress_activity_test2;

y2 = neutral_activity_test2;
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