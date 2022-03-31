% Developed by Fabrizio Bernardi  

% Average considerations on the 4 datasets
addpath('zone analysis','normalizations','overall activity','statistics',...
    'activity detection','ROI analysis','correlation analysis');

clear all
close all

%% FIRST BATCH

main_OASIS;

initial=0;

corr_plots;

L2_errors.obs_stress_test.first = immse(obs_activity_test_stress...
    -mean(obs_activity_test_stress),stress_activity_test2-mean(stress_activity_test2));

L2_errors.obs_neut_test.first  = immse(obs_activity_test_neutral,neutral_activity_test2);

L2_errors.obs_stress_hab.first  = immse(obs_activity_hab_stress,stress_activity_hab2);

L2_errors.obs_neut_hab.first  = immse(obs_activity_hab_neutral,neutral_activity_hab2);

L2_errors.obs_stress_test_contact.first = immse(obs_activity_test_stress(1:round(length(obs_activity_test_stress)/3)),stress_activity_test2(1:round(length(stress_activity_test2)/3)));

L2_errors.obs_neut_test_contact.first = immse(obs_activity_test_neutral(1:round(length(obs_activity_test_neutral)/3)),neutral_activity_test2(1:round(length(neutral_activity_test2)/3)));

corr.obs_stress_test.first = max(abs(c));

corr.obs_neut_test.first = max(abs(c3));

corr.obs_stress_hab.first = max(abs(c2));

corr.obs_neut_hab.first = max(abs(c4));

corr.obs_stress_cage.first = max(abs(c_cage_stress));

corr.obs_neut_cage.first = max(abs(c_cage_neutral));

initial=1;
corr_plots;
close all

corr.obs_stress_initial.first = max(abs(c));

corr.obs_neut_initial.first = max(abs(c3));

% corr_through_time;
% 
% corr.obs_stress_test_contact.first = res(1);
% 
% corr.obs_neut_test_contact.first = res2(1);


sniff_correlation;

corr.obs_stress_sniff.first = max(abs(c));

corr.obs_neut_sniff.first = max(abs(c2));


%% SECOND BATCH

main2_OASIS;


initial=0;
corr_plots;

L2_errors.obs_stress_test.second = immse(obs_activity_test_stress,stress_activity_test2);

L2_errors.obs_neut_test.second = immse(obs_activity_test_neutral,neutral_activity_test2);

L2_errors.obs_stress_hab.second = immse(obs_activity_hab_stress,stress_activity_hab2);

L2_errors.obs_neut_hab.second = immse(obs_activity_hab_neutral,neutral_activity_hab2);

L2_errors.obs_stress_test_contact.second = immse(obs_activity_test_stress(1:round(length(obs_activity_test_stress)/3)),stress_activity_test2(1:round(length(stress_activity_test2)/3)));

L2_errors.obs_neut_test_contact.second = immse(obs_activity_test_neutral(1:round(length(obs_activity_test_neutral)/3)),neutral_activity_test2(1:round(length(neutral_activity_test2)/3)));


corr.obs_stress_test.second = max(abs(c));

corr.obs_neut_test.second = max(abs(c3));

corr.obs_stress_hab.second = max(abs(c2));

corr.obs_neut_hab.second = max(abs(c4));

corr.obs_stress_cage.second = max(abs(c_cage_stress));

corr.obs_neut_cage.second = max(abs(c_cage_neutral));

initial=1;
corr_plots;
close all

corr.obs_stress_initial.second = max(abs(c));

corr.obs_neut_initial.second = max(abs(c3));



sniff_correlation;

corr.obs_stress_sniff.second = max(abs(c));

corr.obs_neut_sniff.second = max(abs(c2));

%%% THIRD BATCH

main3_OASIS;
initial=0;


corr_plots;

L2_errors.obs_stress_test.third = immse(obs_activity_test_stress,stress_activity_test2);

L2_errors.obs_neut_test.third = immse(obs_activity_test_neutral,neutral_activity_test2);

L2_errors.obs_stress_hab.third= immse(obs_activity_hab_stress,stress_activity_hab2);

L2_errors.obs_neut_hab.third = immse(obs_activity_hab_neutral,neutral_activity_hab2);

L2_errors.obs_stress_test_contact.third = immse(obs_activity_test_stress(1:round(length(obs_activity_test_stress)/3)),stress_activity_test2(1:round(length(stress_activity_test2)/3)));

L2_errors.obs_neut_test_contact.third = immse(obs_activity_test_neutral(1:round(length(obs_activity_test_neutral)/3)),neutral_activity_test2(1:round(length(neutral_activity_test2)/3)));



corr.obs_stress_test.third = max(abs(c));

corr.obs_neut_test.third = max(abs(c3));

corr.obs_stress_hab.third = max(abs(c2));

corr.obs_neut_hab.third = max(abs(c4));

corr.obs_stress_cage.third = max(abs(c_cage_stress));

corr.obs_neut_cage.third = max(abs(c_cage_neutral));

initial=1;
corr_plots;
close all

corr.obs_stress_initial.third = max(abs(c));

corr.obs_neut_initial.third = max(abs(c3));



sniff_correlation;

corr.obs_stress_sniff.third = max(abs(c));

corr.obs_neut_sniff.third = max(abs(c2));


%% FOURTH BATCH

main4_OASIS;

initial=0;


corr_plots;

L2_errors.obs_stress_test.fourth = immse(obs_activity_test_stress,stress_activity_test2);

L2_errors.obs_neut_test.fourth = immse(obs_activity_test_neutral,neutral_activity_test2);

L2_errors.obs_stress_hab.fourth = immse(obs_activity_hab_stress,stress_activity_hab2);

L2_errors.obs_neut_hab.fourth = immse(obs_activity_hab_neutral,neutral_activity_hab2);

L2_errors.obs_stress_test_contact.fourth = immse(obs_activity_test_stress(1:round(length(obs_activity_test_stress)/3)),stress_activity_test2(1:round(length(stress_activity_test2)/3)));

L2_errors.obs_neut_test_contact.fourth = immse(obs_activity_test_neutral(1:round(length(obs_activity_test_neutral)/3)),neutral_activity_test2(1:round(length(neutral_activity_test2)/3)));


corr.obs_stress_test.fourth = max(abs(c));

corr.obs_neut_test.fourth = max(abs(c3));

corr.obs_stress_hab.fourth = max(abs(c2));

corr.obs_neut_hab.fourth = max(abs(c4));

corr.obs_stress_cage.fourth = max(abs(c_cage_stress));

corr.obs_neut_cage.fourth = max(abs(c_cage_neutral));

initial=1;
corr_plots;
close all

corr.obs_stress_initial.fourth = max(abs(c));

corr.obs_neut_initial.fourth = max(abs(c3));
close all






% figure
% 
% Y = [L2_errors.obs_stress_hab.first  L2_errors.obs_stress_test.first ;
%     L2_errors.obs_stress_hab.second  L2_errors.obs_stress_test.second; 
%     L2_errors.obs_stress_hab.third  L2_errors.obs_stress_test.third;
%     L2_errors.obs_stress_hab.fourth  L2_errors.obs_stress_test.fourth];
% bar(Y)
% 
% legend('habituation','test')
% title('L2 error between observer and stressed in different datasets')
% set(gca,'FontSize',20)
% figure
% 
% Y = [L2_errors.obs_neut_hab.first  L2_errors.obs_neut_test.first ;
%     L2_errors.obs_neut_hab.second  L2_errors.obs_neut_test.second; 
%     L2_errors.obs_neut_hab.third  L2_errors.obs_neut_test.third;
%     L2_errors.obs_neut_hab.fourth  L2_errors.obs_neut_test.fourth];
% bar(Y)
% 
% legend('habituation','test')
% title('L2 error between observer and neutral in different datasets')
% set(gca,'FontSize',20)
% 
% 
% 
% figure
% 
% subplot(2,1,1)
% 
% aa= categorical({'Habituation','Test'});
% 
% bar(aa(1),mean([L2_errors.obs_neut_hab.first,L2_errors.obs_neut_hab.second]) ,'r')
% 
% hold on
% 
% bar(aa(2),mean([L2_errors.obs_neut_test.first,L2_errors.obs_neut_test.second]) ,'b')
% 
% legend('habituation','test')
% title('Average L2 error between observer and neutral (neutral observer)')
% set(gca,'FontSize',20)
% subplot(2,1,2)
% 
% aa= categorical({'Habituation','Test'});
% 
% bar(aa(1),mean([L2_errors.obs_stress_hab.first,L2_errors.obs_stress_hab.second]) ,'r')
% 
% hold on
% 
% bar(aa(2),mean([L2_errors.obs_stress_test.first,L2_errors.obs_stress_test.second]) ,'b')
% 
% legend('habituation','test')
% title('Average L2 error between observer and stressed (neutral observer)')
% set(gca,'FontSize',20)
% figure
% 
% subplot(2,1,1)
% 
% aa= categorical({'Habituation','Test'});
% 
% bar(aa(1),mean([L2_errors.obs_neut_hab.third,L2_errors.obs_neut_hab.fourth]) ,'r')
% 
% hold on
% 
% bar(aa(2),mean([L2_errors.obs_neut_test.third,L2_errors.obs_neut_test.fourth]) ,'b')
% 
% legend('habituation','test')
% title('Average L2 error between observer and neutral (stressed observer)')
% set(gca,'FontSize',20)
% subplot(2,1,2)
% 
% aa= categorical({'Habituation','Test'});
% 
% bar(aa(1),mean([L2_errors.obs_stress_hab.third,L2_errors.obs_stress_hab.fourth]) ,'r')
% 
% hold on
% 
% bar(aa(2),mean([L2_errors.obs_stress_test.third,L2_errors.obs_stress_test.fourth]) ,'b')
% 
% legend('habituation','test')
% title('Average L2 error between observer and stressed (stressed observer)')
% set(gca,'FontSize',20)

figure

Y = [corr.obs_stress_hab.first  corr.obs_stress_test.first ;
    corr.obs_stress_hab.second  corr.obs_stress_test.second; 
    corr.obs_stress_hab.third  corr.obs_stress_test.third;
    corr.obs_stress_hab.fourth  corr.obs_stress_test.fourth];
bar(Y)

legend('habituation','test')
title('Correlation between observer and stressed in different datasets')
set(gca,'FontSize',20)
figure

Y = [corr.obs_neut_hab.first  corr.obs_neut_test.first ;
    corr.obs_neut_hab.second  corr.obs_neut_test.second; 
    corr.obs_neut_hab.third  corr.obs_neut_test.third;
    corr.obs_neut_hab.fourth  corr.obs_neut_test.third];
bar(Y)

legend('habituation','test')
title('Correlation between observer and neutral in different datasets')
set(gca,'FontSize',20)


figure

subplot(1,2,1)
aa= categorical({'Cage','Habituation','Test','Test (initial)','Test (sniffing)'});

bar(aa(1),mean([corr.obs_stress_cage.first,corr.obs_stress_cage.second]) ,'c')
hold on
% plot(categorical({'Cage'}),corr.obs_stress_cage.first,'ro','MarkerSize',10)
% plot(categorical({'Cage'}),corr.obs_stress_cage.second,'ro','MarkerSize',10)
bar(aa(2),mean([corr.obs_stress_hab.first,corr.obs_stress_hab.second]) ,'r')
% plot(categorical({'Habituation'}),corr.obs_stress_hab.first,'ro','MarkerSize',10)
% plot(categorical({'Habituation'}),corr.obs_stress_hab.second,'ro','MarkerSize',10)
hold on

bar(aa(3),mean([corr.obs_stress_test.first,corr.obs_stress_test.second]) ,'b')
% plot(categorical({'Test'}),corr.obs_stress_test.first,'ro','MarkerSize',10)
% plot(categorical({'Test'}),corr.obs_stress_test.second,'ro','MarkerSize',10)

bar(aa(4),mean([corr.obs_stress_initial.first,corr.obs_stress_initial.second]) ,'green')
% plot(categorical({'Test (initial)'}),corr.obs_stress_initial.first,'ro','MarkerSize',10)
% plot(categorical({'Test (initial)'}),corr.obs_stress_initial.second,'ro','MarkerSize',10)

bar(aa(5),mean([corr.obs_stress_sniff.first,corr.obs_stress_sniff.second]),'m')
% plot(categorical({'Test (sniffing)'}),corr.obs_stress_sniff.first,'ro','MarkerSize',10)
% plot(categorical({'Test (sniffing)'}),corr.obs_stress_sniff.second,'ro','MarkerSize',10)

legend('Cage','Habituation','Test','Test (initial)','Test (sniffing)')
title('Average CC between observer and stressed ')
set(gca,'FontSize',15)
ylim([0,1])
grid
subplot(1,2,2)

aa= categorical({'Cage','Habituation','Test','Test (initial)','Test (sniffing)'});

bar(aa(1),mean([corr.obs_neut_cage.first,corr.obs_neut_cage.second]) ,'c')
hold on

bar(aa(2),mean([corr.obs_neut_hab.first,corr.obs_neut_hab.second]) ,'r')



bar(aa(3),mean([corr.obs_neut_test.first,corr.obs_neut_test.second]) ,'b')

bar(aa(4),mean([corr.obs_neut_initial.first,corr.obs_neut_initial.second]) ,'green')

bar(aa(5),mean([corr.obs_neut_sniff.first,corr.obs_neut_sniff.second]),'m')

legend('Cage','Habituation','Test','Test (initial)','Test (sniffing)')
title('Average CC between observer and neutral ')
set(gca,'FontSize',15)
ylim([0,1])

grid