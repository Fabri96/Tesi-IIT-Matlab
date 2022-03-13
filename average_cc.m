main_OASIS;
corr_plots;
close all

c_first = c;
lags_first = lags;

c2_first = c2;
lags2_first = lags2;

c3_first = c3;
lags3_first = lags3;

c4_first = c4;
lags4_first = lags4;

c5_first = c_cage_stress;
lags5_first = lags_cage_stress;

c6_first = c_cage_stress;
lags6_first = lags_cage_stress;

main2_OASIS;
corr_plots;
close all

c_second = c;
lags_second = lags;

c2_second = c2;
lags2_second = lags2;

c3_second = c3;
lags3_second = lags3;

c4_second = c4;
lags4_second = lags4;

c5_second = c_cage_stress;
lags5_second = lags_cage_stress;

c6_second = c_cage_neutral;
lags6_second = lags_cage_neutral;

fs1=0.125;
fs2=0.05;

c_second_new = interp1(lags_second*fs2,c_second,lags_first*fs1);

c2_second_new = interp1(lags2_second*fs2,c2_second,lags2_first*fs1);

c3_second_new = interp1(lags3_second*fs2,c3_second,lags3_first*fs1);

c4_second_new = interp1(lags4_second*fs2,c4_second,lags4_first*fs1);

c5_second_new = interp1(lags5_second*fs2,c5_second,lags5_first*fs1);

c6_second_new = interp1(lags6_second*fs2,c6_second,lags6_first*fs1);

avg_neutral = (c3_first + c3_second_new')/2;

avg_neutral_hab = (c4_first + c4_second_new')/2;

avg_stress= (c_first + c_second_new')/2;

avg_stress_hab = (c2_first + c2_second_new')/2;

avg_stress_cage = (c5_first + c5_second_new')/2;

avg_neutral_cage = (c6_first + c6_second_new')/2;


%% PLOTS
subplot(1,2,1)
plot(lags_first*fs1,avg_stress,'b-o',MarkerSize=2)
 hold on
%  stem(lags2,c2,'r')
plot(lags_first*fs1,avg_stress_hab,'r-o',MarkerSize=2)
hold on
plot(lags_first*fs1,avg_stress_cage,'g-o',MarkerSize=2)

 legend('CC during test','CC during habituation','CC during homecage')
xlabel('lags (s)')
ylabel('cross-correlation')

title('CC between observer and stressed (beginning)')
set(gca,'FontSize',15)
ylim([-0.3 1])
grid

subplot(1,2,2)
plot(lags_first*fs1,avg_neutral,'b-o',MarkerSize=2)
 hold on
%  stem(lags2,c2,'r')
plot(lags_first*fs1,avg_neutral_hab,'r-o',MarkerSize=2)
hold on
plot(lags_first*fs1,avg_neutral_cage,'g-o',MarkerSize=2)

 legend('CC during test','CC during habituation','CC during homecage')
xlabel('lags (s)')
ylabel('cross-correlation')

title('CC between observer and neutral (beginning)')
set(gca,'FontSize',15)
ylim([-0.3 1])
grid