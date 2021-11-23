% Developed by Fabrizio Bernardi  

% Plots of Pearson correlations and cross correlations between observer and

% stressed and observer and neutral. The correlation is computed on the
% 
% times when the 2 mice were close (obtained through function detect_areas)
% 
% 

close all

% dataset = 4; %select the dataset you are working on

% obs_activity_hab = mice_activity(obs_hab);
% 
%  neutral_activity_hab = mice_activity(neutral_hab);
% 
%  stress_activity_hab = mice_activity(stress_hab);

 
% right = right(20:end);
% 
% left = left(7:end);
% [ left, right ,intermediate] = detect_areas_test(ad_test_zone);



if(dataset == 1 || dataset == 3)


% ad_hab_zone = adapt_zone(hab_zone,obs_activity_hab);


%%%%% Let's extract mice activities during the different phases of the test

% observer activity when he is close to stressed
obs_activity_test_stress = interp1(obs_activity_test(:,1),obs_activity_test(:,2), right);

% observer activity when he is close to neutral
obs_activity_test_neutral = interp1(obs_activity_test(:,1),obs_activity_test(:,2), left);

% stressed activity when he is close to observer
stress_activity_test2 = interp1(stress_activity_test(:,1),stress_activity_test(:,2), right);

% neutral activity when he is close to observer
neutral_activity_test2 = interp1(neutral_activity_test(:,1),neutral_activity_test(:,2), left);

% observer activity when he is in intermediate zone
obs_stress_interm_test = interp1(obs_activity_test(:,1),obs_activity_test(:,2), intermediate);

% stressed activity when observer is in intermediate zone
stress_interm_test = interp1(stress_activity_test(:,1),stress_activity_test(:,2), intermediate);

% observer activity when he is in intermediate zone
obs_neutral_intermediate_test = interp1(obs_activity_test(:,1),obs_activity_test(:,2), intermediate);

% neutral activity when observer is in intermediate zone
neutral_intermediate_test = interp1(neutral_activity_test(:,1),neutral_activity_test(:,2), intermediate);

% observer activity when he is near neutral
obs_stress_opposite_test = interp1(obs_activity_test(:,1),obs_activity_test(:,2), left);

% stressed activity when observer is near neutral
stress_opposite_test = interp1(stress_activity_test(:,1),stress_activity_test(:,2), left);

% observer activity when he is near stressed
obs_neutral_opposite_test = interp1(obs_activity_test(:,1),obs_activity_test(:,2), right);

% neutral activity when observer is near stressed
neutral_opposite_test = interp1(neutral_activity_test(:,1),neutral_activity_test(:,2), right);



%%%%% Let's extract mice activities during the different phases of the habituation


% [ left2, right2 ,intermediate2] = detect_areas(ad_hab_zone);

obs_activity_hab_stress = interp1(obs_activity_hab(:,1),obs_activity_hab(:,2), right2);

obs_activity_hab_neutral = interp1(obs_activity_hab(:,1),obs_activity_hab(:,2), left2);

stress_activity_hab2 = interp1(stress_activity_hab(:,1),stress_activity_hab(:,2), right2);

neutral_activity_hab2 = interp1(neutral_activity_hab(:,1),neutral_activity_hab(:,2), left2);

obs_stress_interm_hab = interp1(obs_activity_hab(:,1),obs_activity_hab(:,2), intermediate2);

stress_interm_hab = interp1(stress_activity_hab(:,1),stress_activity_hab(:,2), intermediate2);

obs_stress_opposite_hab = interp1(obs_activity_hab(:,1),obs_activity_hab(:,2), left2);

stress_opposite_hab = interp1(stress_activity_hab(:,1),stress_activity_hab(:,2), left2);

obs_neutral_opposite_hab = interp1(obs_activity_hab(:,1),obs_activity_hab(:,2), right2);

neutral_opposite_hab = interp1(neutral_activity_hab(:,1),neutral_activity_hab(:,2), right2);

obs_neutral_intermediate_hab = interp1(obs_activity_hab(:,1),obs_activity_hab(:,2), intermediate2);

neutral_intermediate_hab = interp1(neutral_activity_hab(:,1),neutral_activity_hab(:,2), intermediate2);


end

if(dataset ==2)

ad_hab_zone = adapt_zone(hab_zone2,obs_activity_hab);

    %%%%% Let's extract mice activities during the different phases of the test

% observer activity when he is close to stressed
obs_activity_test_stress = interp1(obs_activity_test(:,1),obs_activity_test(:,2), left);

% observer activity when he is close to neutral
obs_activity_test_neutral = interp1(obs_activity_test(:,1),obs_activity_test(:,2), right);

% stressed activity when he is close to observer
stress_activity_test2 = interp1(stress_activity_test(:,1),stress_activity_test(:,2), left);

% neutral activity when he is close to observer
neutral_activity_test2 = interp1(neutral_activity_test(:,1),neutral_activity_test(:,2), right);

% observer activity when he is in intermediate zone
obs_stress_interm_test = interp1(obs_activity_test(:,1),obs_activity_test(:,2), intermediate);

% stressed activity when observer is in intermediate zone
stress_interm_test = interp1(stress_activity_test(:,1),stress_activity_test(:,2), intermediate);

% observer activity when he is in intermediate zone
obs_neutral_intermediate_test = interp1(obs_activity_test(:,1),obs_activity_test(:,2), intermediate);

% neutral activity when observer is in intermediate zone
neutral_intermediate_test = interp1(neutral_activity_test(:,1),neutral_activity_test(:,2), intermediate);

% observer activity when he is near neutral
obs_stress_opposite_test = interp1(obs_activity_test(:,1),obs_activity_test(:,2), right);

% stressed activity when observer is near neutral
stress_opposite_test = interp1(stress_activity_test(:,1),stress_activity_test(:,2), right);

% observer activity when he is near stressed
obs_neutral_opposite_test = interp1(obs_activity_test(:,1),obs_activity_test(:,2), left);

% neutral activity when observer is near stressed
neutral_opposite_test = interp1(neutral_activity_test(:,1),neutral_activity_test(:,2), left);



%%%%% Let's extract mice activities during the different phases of the habituation


[ left2, right2 ,intermediate2] = detect_areas(ad_hab_zone);

obs_activity_hab_stress = interp1(obs_activity_hab(:,1),obs_activity_hab(:,2), left2);

obs_activity_hab_neutral = interp1(obs_activity_hab(:,1),obs_activity_hab(:,2), right2);

stress_activity_hab2 = interp1(stress_activity_hab(:,1),stress_activity_hab(:,2), left2);

neutral_activity_hab2 = interp1(neutral_activity_hab(:,1),neutral_activity_hab(:,2), right2);

obs_stress_interm_hab = interp1(obs_activity_hab(:,1),obs_activity_hab(:,2), intermediate2);

stress_interm_hab = interp1(stress_activity_hab(:,1),stress_activity_hab(:,2), intermediate2);

obs_stress_opposite_hab = interp1(obs_activity_hab(:,1),obs_activity_hab(:,2), right2);

stress_opposite_hab = interp1(stress_activity_hab(:,1),stress_activity_hab(:,2), right2);

obs_neutral_opposite_hab = interp1(obs_activity_hab(:,1),obs_activity_hab(:,2), left2);

neutral_opposite_hab = interp1(neutral_activity_hab(:,1),neutral_activity_hab(:,2), left2);

obs_neutral_intermediate_hab = interp1(obs_activity_hab(:,1),obs_activity_hab(:,2), intermediate2);

neutral_intermediate_hab = interp1(neutral_activity_hab(:,1),neutral_activity_hab(:,2), intermediate2);


end

if(dataset ==4)

ad_hab_zone = adapt_zone(hab_zone,obs_activity_hab);

    %%%%% Let's extract mice activities during the different phases of the test

% observer activity when he is close to stressed
obs_activity_test_stress = interp1(obs_activity_test(:,1),obs_activity_test(:,2), left);

% observer activity when he is close to neutral
obs_activity_test_neutral = interp1(obs_activity_test(:,1),obs_activity_test(:,2), right);

% stressed activity when he is close to observer
stress_activity_test2 = interp1(stress_activity_test(:,1),stress_activity_test(:,2), left);

% neutral activity when he is close to observer
neutral_activity_test2 = interp1(neutral_activity_test(:,1),neutral_activity_test(:,2), right);

% observer activity when he is in intermediate zone
obs_stress_interm_test = interp1(obs_activity_test(:,1),obs_activity_test(:,2), intermediate);

% stressed activity when observer is in intermediate zone
stress_interm_test = interp1(stress_activity_test(:,1),stress_activity_test(:,2), intermediate);

% observer activity when he is in intermediate zone
obs_neutral_intermediate_test = interp1(obs_activity_test(:,1),obs_activity_test(:,2), intermediate);

% neutral activity when observer is in intermediate zone
neutral_intermediate_test = interp1(neutral_activity_test(:,1),neutral_activity_test(:,2), intermediate);

% observer activity when he is near neutral
obs_stress_opposite_test = interp1(obs_activity_test(:,1),obs_activity_test(:,2), right);

% stressed activity when observer is near neutral
stress_opposite_test = interp1(stress_activity_test(:,1),stress_activity_test(:,2), right);

% observer activity when he is near stressed
obs_neutral_opposite_test = interp1(obs_activity_test(:,1),obs_activity_test(:,2), left);

% neutral activity when observer is near stressed
neutral_opposite_test = interp1(neutral_activity_test(:,1),neutral_activity_test(:,2), left);



%%%%% Let's extract mice activities during the different phases of the habituation


[ left2, right2 ,intermediate2] = detect_areas(ad_hab_zone);

obs_activity_hab_stress = interp1(obs_activity_hab(:,1),obs_activity_hab(:,2), left2);

obs_activity_hab_neutral = interp1(obs_activity_hab(:,1),obs_activity_hab(:,2), right2);

stress_activity_hab2 = interp1(stress_activity_hab(:,1),stress_activity_hab(:,2), left2);

neutral_activity_hab2 = interp1(neutral_activity_hab(:,1),neutral_activity_hab(:,2), right2);

obs_stress_interm_hab = interp1(obs_activity_hab(:,1),obs_activity_hab(:,2), intermediate2);

stress_interm_hab = interp1(stress_activity_hab(:,1),stress_activity_hab(:,2), intermediate2);

obs_stress_opposite_hab = interp1(obs_activity_hab(:,1),obs_activity_hab(:,2), right2);

stress_opposite_hab = interp1(stress_activity_hab(:,1),stress_activity_hab(:,2), right2);

obs_neutral_opposite_hab = interp1(obs_activity_hab(:,1),obs_activity_hab(:,2), left2);

neutral_opposite_hab = interp1(neutral_activity_hab(:,1),neutral_activity_hab(:,2), left2);

obs_neutral_intermediate_hab = interp1(obs_activity_hab(:,1),obs_activity_hab(:,2), intermediate2);

neutral_intermediate_hab = interp1(neutral_activity_hab(:,1),neutral_activity_hab(:,2), intermediate2);


end











% bar(1,y(2),'b')
% 
% hold on
% bar(-1,y(1),'r')
% 
% legend('Pearson correlation during test ','Pearson correlation during hab ')
% 
% 
% ylabel('Pearson correlation')
% title('Pearson correlation between observer and stressed')


 [c,lags] = xcorr(obs_activity_test_stress,stress_activity_test2,'normalized');
%   [c,lags] = xcorr(obs_activity_test_stress(1:round(length(obs_activity_test_stress)/5)),...
%       stress_activity_test2(1:round(length(stress_activity_test2)/5)),'normalized');

 [c2,lags2] = xcorr(obs_activity_hab_stress,stress_activity_hab2,'normalized');

%   [c2,lags2] = xcorr(obs_activity_hab_stress(1:round(length(obs_activity_hab_stress)/5)),...
%      stress_activity_hab2(1:round(length(obs_activity_hab_stress)/5)),'normalized');

  [c3,lags3] = xcorr(obs_activity_test_neutral,neutral_activity_test2,'normalized');

% [c3,lags3] = xcorr(obs_activity_test_neutral(1:round(length(obs_activity_test_neutral)/5)),...
%      neutral_activity_test2(1:round(length(neutral_activity_test2)/5)),'normalized');

[c4,lags4] = xcorr(obs_activity_hab_neutral,neutral_activity_hab2,'normalized');

%  [c4,lags4] = xcorr(obs_activity_hab_neutral(1:round(length(obs_activity_hab_neutral)/5)),...
%      neutral_activity_hab2(1:round(length(obs_activity_hab_neutral)/5)),'normalized');


 subplot(1,2,1)



 stem(lags,c,'b')
 hold on
 stem(lags2,c2,'r')
 legend('CC during test','CC during habituation')
xlabel('lags')
ylabel('cross-correlation')


title('Cross-correlations between observer and stressed')

subplot(1,2,2)

stem(lags3,c3,'b')
hold on
stem(lags4,c4,'r')

legend('CC during test','CC during habituation')
xlabel('lags')
ylabel('cross-correlation')


title('Cross-correlations between observer and neutral')

figure

% y = [abs(corr(obs_activity_hab_neutral,neutral_activity_hab2)) 
%     abs(corr(obs_activity_test_neutral ,neutral_activity_test2))];
% 
% 
% 
% subplot(1,2,1)
% 
% 
% 
% bar(1,y(2),'b')
% 
% hold on
% bar(-1,y(1),'r')
% 
% legend('Pearson correlation during test ','Pearson correlation during hab ')
% 
% 
% ylabel('Pearson correlation')
% title('Pearson correlation between observer and neutral')


 






figure




subplot(1,2,1)

[c5,lags5] = xcorr(obs_stress_interm_test,stress_interm_test,'normalized');

[c6,lags6] = xcorr(obs_stress_interm_hab,stress_interm_hab,'normalized');


 stem(lags5,c5,'b')
 hold on
 stem(lags6,c6,'r')
legend('CC during test','CC during habituation')
xlabel('lags')
ylabel('cross-correlation')


title('Cross-correlations between observer and stressed when in intermediate zones')

subplot(1,2,2)

[c7,lags7] = xcorr(obs_stress_opposite_test,stress_opposite_test,'normalized');

[c8,lags8] = xcorr(obs_stress_opposite_hab,stress_opposite_hab,'normalized');




 stem(lags7,c7,'b')
 hold on
 stem(lags8,c8,'r')
legend('CC during test','CC during habituation')
xlabel('lags')
ylabel('cross-correlation')


title('Cross-correlations between observer and stressed when in opposite zones')




figure

subplot(1,2,1)

[c9,lags9] = xcorr(obs_neutral_intermediate_test,neutral_intermediate_test,'normalized');

[c10,lags10] = xcorr(obs_neutral_intermediate_hab,neutral_intermediate_hab,'normalized');




 stem(lags9,c9,'b')
 hold on
 stem(lags10,c10,'r')
legend('CC during test','CC during habituation')
xlabel('lags')
ylabel('cross-correlation')


title('Cross-correlations between observer and neutral when in intermediate zones')

subplot(1,2,2)

[c11,lags11] = xcorr(obs_neutral_opposite_test,neutral_opposite_test,'normalized');

[c12,lags12] = xcorr(obs_neutral_opposite_hab,neutral_opposite_hab,'normalized');




 stem(lags11,c11,'b')
 hold on
 stem(lags12,c12,'r')
legend('CC during test','CC during habituation')
xlabel('lags')
ylabel('cross-correlation')


title('Cross-correlations between observer and neutral when in opposite zones')




% figure


% [cc,lagss] = xcorr(stress_activity_test(:,2),neutral_activity_test(:,2),'normalized');
% 
% [cc2,lagss2] = xcorr(stress_activity_hab(:,2),neutral_activity_hab(:,2),'normalized');
% 
% 
% 
% 
%  stem(lagss,cc,'b')
%  hold on
%  stem(lagss2,cc2,'r')
% legend('CC during test','CC during habituation')
% xlabel('lags')
% ylabel('cross-correlation')
% 
% 
% title('Cross-correlations between stressed and neutral ')

