



clear stress_test2 stress_hab2

for j = 2:size(stress_test,2)

stress_test2(:,j-1) = interp1(stress_test(:,1),stress_test(:,j), right);

end

for j = 2:size(stress_hab,2)

stress_hab2(:,j-1) = interp1(stress_hab(:,1),stress_hab(:,j), right2);

end




y_test=obs_activity_test_stress;
x_test=stress_activity_test2;

% X_test=stress_test2;

model_test = fitglm(x_test,y_test);

y_hab=obs_activity_hab_stress;

x_hab=stress_activity_hab2;
X_hab=stress_hab2;

model_hab = fitglm(x_hab,y_hab);

clear neutral_test2 neutral_hab2

for j = 2:size(neutral_test,2)

neutral_test2(:,j-1) = interp1(neutral_test(:,1),neutral_test(:,j), right);

end

for j = 2:size(neutral_hab,2)

neutral_hab2(:,j-1) = interp1(neutral_hab(:,1),neutral_hab(:,j), right2);

end




y_test=obs_activity_test_neutral;
x_test=neutral_activity_test2;

% X_test=neutral_test2;

model_test_neut = fitglm(x_test,y_test);

y_hab=obs_activity_hab_neutral;

x_hab=neutral_activity_hab2;
X_hab=neutral_hab2;

model_hab_neut = fitglm(x_hab,y_hab);

