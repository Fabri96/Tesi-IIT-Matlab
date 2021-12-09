addpath('zone analysis','normalizations','overall activity','statistics',...
    'activity detection');

addpath('DATA_FIRST');

if(dataset==1)

load('D_stress.mat')
load('D_obs.mat')
load('D_neutral.mat')

end

if(dataset==2)

load('D_stress2.mat')
load('D_obs2.mat')
load('D_neutral2.mat')

D_stress = D_stress2;

D_obs = D_obs2;

D_neutral = D_neutral2;

end

if(dataset==3)

load('D_stress3.mat')
load('D_obs3.mat')
load('D_neutral3.mat')

D_stress = D_stress3;

D_obs = D_obs3;

D_neutral = D_neutral3;

end

if(dataset==4)

load('D_stress4.mat')
load('D_obs4.mat')
load('D_neutral4.mat')

D_stress = D_stress4;

D_obs = D_obs4;

D_neutral = D_neutral4;

end

roi_analysis;
close all
AA_neutral_test = [zeros(size(A_neutral,2),1) A_neutral'];
AA_obs_test = [zeros(size(A_obs ,2),1) A_obs'];
AA_stress_test = [zeros(size(A_stress,2),1) A_stress'];


dt = 0.8;
c_matrix_neutral= corr_matrix_single_mouse(AA_neutral_test,dt);

c_matrix_obs= corr_matrix_single_mouse(AA_obs_test,dt);

c_matrix_stress= corr_matrix_single_mouse(AA_stress_test,dt);

figure
plot(D_obs(:),c_matrix_obs(:),'ko')
title('Scatter plot of peak correlation vs distance in observer')
xlabel('Distance between pairs of neurons')
ylabel('Peak Correlation index')
set(gca,'FontSize',20)

neutral_linear_model = fitlm(D_obs(:),c_matrix_obs(:));
neutral_linear_model.Rsquared
corr(D_obs(:),c_matrix_obs(:))

figure
plot(D_stress(:),c_matrix_stress(:),'ro')
title('Scatter plot of peak correlation vs distance in stressed')
xlabel('Distance between pairs of neurons')
ylabel('Peak Correlation index')
set(gca,'FontSize',20)

neutral_linear_model = fitlm(D_stress(:),c_matrix_stress(:));
neutral_linear_model.Rsquared
corr(D_stress(:),c_matrix_stress(:))

figure
plot(D_neutral(:),c_matrix_neutral(:),'bo')
title('Scatter plot of peak correlation vs distance in neutral')
xlabel('Distance between pairs of neurons')
ylabel('Peak Correlation index')
set(gca,'FontSize',20)

neutral_linear_model = fitlm(D_neutral(:),c_matrix_neutral(:));
neutral_linear_model.Rsquared
corr(D_neutral(:),c_matrix_neutral(:))

