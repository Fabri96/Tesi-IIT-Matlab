% Developed by Fabrizio Bernardi  

% Plots of cross correlations between observer and

% stressed and observer and neutral. The correlation is computed on the
% 
% times when the 2 mice were close (obtained through function detect_areas)
% 
% 

close all


initial = 0; % Consider onl first part 
lag_selection =1;

mark=0;

 maxlag= 200/fs;
nn=4;
nn2=4;

if(dataset == 1 || dataset == 3 || dataset==5)


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





if(lag_selection ==1)
[c,lags] = xcov(obs_activity_test_stress,stress_activity_test2,maxlag,'coeff');

[c2,lags2] = xcov(obs_activity_hab_stress,stress_activity_hab2,maxlag,'coeff');

[c3,lags3] = xcov(obs_activity_test_neutral,neutral_activity_test2,maxlag,'normalized');

[c4,lags4] = xcov(obs_activity_hab_neutral,neutral_activity_hab2,maxlag,'normalized');

else
    [c,lags] = xcov(obs_activity_test_stress,stress_activity_test2,'coeff');

[c2,lags2] = xcov(obs_activity_hab_stress,stress_activity_hab2,'coeff');

[c3,lags3] = xcov(obs_activity_test_neutral,neutral_activity_test2,'normalized');

[c4,lags4] = xcov(obs_activity_hab_neutral,neutral_activity_hab2,'normalized');
end
if(initial==1)

    [c,lags] = xcov(obs_activity_test_stress(1:round(end/nn)),stress_activity_test2(1:round(end/nn)),maxlag,'normalized');

    [c2,lags2] = xcov(obs_activity_hab_stress(1:round(end/nn)),stress_activity_hab2(1:round(end/nn)),maxlag,'normalized');

    [c3,lags3] = xcov(obs_activity_test_neutral(1:round(end/nn2)),neutral_activity_test2(1:round(end/nn2)),maxlag,'normalized');

    [c4,lags4] = xcov(obs_activity_hab_neutral(1:round(end/nn2)),neutral_activity_hab2(1:round(end/nn2)),maxlag,'normalized');

end

if(mark==1)

    [c,lags] = xcov(obs_activity_test_stress,stress_activity_test2,'normalized');

    [c2,lags2] = xcov(obs_activity_hab(:,2),stress_activity_hab(:,2),6000,'normalized');

    [c3,lags3] = xcov(obs_activity_test_neutral,neutral_activity_test2,'normalized');

    [c4,lags4] = xcov(obs_activity_hab(:,2),neutral_activity_hab(:,2),6000,'normalized');

end

 subplot(1,2,1)
% rand_test1 = phaseRandomize(obs_activity_test_stress');
% rand_test2 = phaseRandomize(stress_activity_test2');
% [c_r ,lags_r]=xcorr(rand_test1,rand_test2,'normalized');

%  stem(lags,c,'b')

[c_cage_stress,lags_cage_stress] = xcov(obs_activity_cage(:,2),stress_activity_cage(:,2),maxlag,'normalized');

[c_cage_neutral,lags_cage_neutral] = xcov(obs_activity_cage(:,2),neutral_activity_cage(:,2),maxlag,'normalized');

%% PLOTS

plot(lags*fs,c,'b-o',MarkerSize=2)
 hold on
%  stem(lags2,c2,'r')
plot(lags2*fs,c2,'r-o',MarkerSize=2)
hold on
plot(lags_cage_stress*fs,c_cage_stress,'g-o',MarkerSize=2)
 legend('CC during test','CC during habituation','CC during homecage')
xlabel('lags (s)')
ylabel('cross-correlation')


title('CC between observer and stressed')
set(gca,'FontSize',15)
ylim([-0.3 1])
grid
% xlim([-200 200])
if(initial==1)
xlim([-100 100])
end
subplot(1,2,2)

% stem(lags3,c3,'b')
plot(lags3*fs,c3,'b-o',MarkerSize=2)
hold on
% stem(lags4,c4,'r')
plot(lags4*fs,c4,'r-o',MarkerSize=2)
hold on
plot(lags_cage_neutral*fs,c_cage_neutral,'g-o',MarkerSize=2)
legend('CC during test','CC during habituation','CC during homecage')
xlabel('lags (s)')
ylabel('cross-correlation')
grid
% xlim([-200 200])
if(initial==1)
xlim([-100 100])
end

title('CC between observer and neutral')
set(gca,'FontSize',15)
ylim([-0.3 1])





figure




subplot(1,2,1)

[c5,lags5] = xcov(obs_stress_interm_test,stress_interm_test,'normalized');

[c6,lags6] = xcov(obs_stress_interm_hab,stress_interm_hab,'normalized');


plot(lags5*fs,c5,'b-o',MarkerSize=2)
hold on
% stem(lags4,c4,'r')
plot(lags6*fs,c6,'r-o',MarkerSize=2)
hold on
plot(lags_cage_stress*fs,c_cage_stress,'g-o',MarkerSize=2)
legend('CC during test','CC during habituation','CC during homecage')
xlabel('lags (s)')
ylabel('cross-correlation')
grid
xlim([-200 200])
if(initial==1)
xlim([-100 100])
end

title('CC between observer and stressed when in intermediate')
set(gca,'FontSize',15)
ylim([-0.3 1])

subplot(1,2,2)
% 
[c7,lags7] = xcov(obs_stress_opposite_test,stress_opposite_test,'normalized');

[c8,lags8] = xcov(obs_stress_opposite_hab,stress_opposite_hab,'normalized');
% 
% 
% 
% 
plot(lags7*fs,c7,'b-o',MarkerSize=2)
hold on
% stem(lags4,c4,'r')
plot(lags8*fs,c8,'r-o',MarkerSize=2)
hold on
plot(lags_cage_stress*fs,c_cage_stress,'g-o',MarkerSize=2)
legend('CC during test','CC during habituation','CC during homecage')
xlabel('lags (s)')
ylabel('cross-correlation')
grid
xlim([-200 200])
if(initial==1)
xlim([-100 100])
end

title('CC between observer and stressed when in opposite')
set(gca,'FontSize',15)
ylim([-0.3 1])


figure

subplot(1,2,1)

[c9,lags9] = xcov(obs_neutral_intermediate_test,neutral_intermediate_test,'normalized');

[c10,lags10] = xcov(obs_neutral_intermediate_hab,neutral_intermediate_hab,'normalized');




plot(lags9*fs,c9,'b-o',MarkerSize=2)
hold on
% stem(lags4,c4,'r')
plot(lags10*fs,c10,'r-o',MarkerSize=2)
hold on
plot(lags_cage_neutral*fs,c_cage_neutral,'g-o',MarkerSize=2)
legend('CC during test','CC during habituation','CC during homecage')
xlabel('lags (s)')
ylabel('cross-correlation')
grid
xlim([-200 200])
if(initial==1)
xlim([-100 100])
end

title('CC between observer and neutral when in intermediate')
set(gca,'FontSize',15)
ylim([-0.3 1])
% 
subplot(1,2,2)
% 
[c11,lags11] = xcov(obs_neutral_opposite_test,neutral_opposite_test,'normalized');

[c12,lags12] = xcov(obs_neutral_opposite_hab,neutral_opposite_hab,'normalized');




plot(lags11*fs,c11,'b-o',MarkerSize=2)
hold on
% stem(lags4,c4,'r')
plot(lags12*fs,c12,'r-o',MarkerSize=2)
hold on
plot(lags_cage_neutral*fs,c_cage_neutral,'g-o',MarkerSize=2)
legend('CC during test','CC during habituation','CC during homecage')
xlabel('lags (s)')
ylabel('cross-correlation')
grid
xlim([-200 200])
if(initial==1)
xlim([-100 100])
end

title('CC between observer and neutral when in opposite')
set(gca,'FontSize',15)
ylim([-0.3 1])


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

