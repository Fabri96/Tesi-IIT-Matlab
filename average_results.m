% Developed by Fabrizio Bernardi  

% Average considerations on the 4 datasets
addpath('zone analysis','normalizations','overall activity','statistics',...
    'activity detection','ROI analysis','correlation analysis');

clear all
close all

%%% FIRST BATCH

main;



corr_plots;

L2_errors.obs_stress_test.first = immse(obs_activity_test_stress,stress_activity_test2);

L2_errors.obs_neut_test.first  = immse(obs_activity_test_neutral,neutral_activity_test2);

L2_errors.obs_stress_hab.first  = immse(obs_activity_hab_stress,stress_activity_hab2);

L2_errors.obs_neut_hab.first  = immse(obs_activity_hab_neutral,neutral_activity_hab2);

L2_errors.obs_stress_test_contact.first = immse(obs_activity_test_stress(1:round(length(obs_activity_test_stress)/3)),stress_activity_test2(1:round(length(stress_activity_test2)/3)));

L2_errors.obs_neut_test_contact.first = immse(obs_activity_test_neutral(1:round(length(obs_activity_test_neutral)/3)),neutral_activity_test2(1:round(length(neutral_activity_test2)/3)));

Inf_errors.obs_stress_test.first = max(abs(obs_activity_test_stress-stress_activity_test2));

Inf_errors.obs_neut_test.first  = max(abs(obs_activity_test_neutral-neutral_activity_test2));

Inf_errors.obs_stress_hab.first  = max(abs(obs_activity_hab_stress-stress_activity_hab2));

Inf_errors.obs_neut_hab.first  = max(abs(obs_activity_hab_neutral-neutral_activity_hab2));

corr.obs_stress_test.first = max(abs(c));

corr.obs_neut_test.first = max(abs(c3));

corr.obs_stress_hab.first = max(abs(c2));

corr.obs_neut_hab.first = max(abs(c4));

corr_through_time;

corr.obs_stress_test_contact.first = res(1);

corr.obs_neut_test_contact.first = res2(1);


sniff_correlation;

corr.obs_stress_sniff.first = max(abs(c));

corr.obs_neut_sniff.first = max(abs(c2));


%%% SECOND BATCH

main2;



corr_plots;

L2_errors.obs_stress_test.second = immse(obs_activity_test_stress,stress_activity_test2);

L2_errors.obs_neut_test.second = immse(obs_activity_test_neutral,neutral_activity_test2);

L2_errors.obs_stress_hab.second = immse(obs_activity_hab_stress,stress_activity_hab2);

L2_errors.obs_neut_hab.second = immse(obs_activity_hab_neutral,neutral_activity_hab2);

L2_errors.obs_stress_test_contact.second = immse(obs_activity_test_stress(1:round(length(obs_activity_test_stress)/3)),stress_activity_test2(1:round(length(stress_activity_test2)/3)));

L2_errors.obs_neut_test_contact.second = immse(obs_activity_test_neutral(1:round(length(obs_activity_test_neutral)/3)),neutral_activity_test2(1:round(length(neutral_activity_test2)/3)));

Inf_errors.obs_stress_test.second = max(abs(obs_activity_test_stress-stress_activity_test2));

Inf_errors.obs_neut_test.second = max(abs(obs_activity_test_neutral-neutral_activity_test2));

Inf_errors.obs_stress_hab.second = max(abs(obs_activity_hab_stress-stress_activity_hab2));

Inf_errors.obs_neut_hab.second = max(abs(obs_activity_hab_neutral-neutral_activity_hab2));

corr.obs_stress_test.second = max(abs(c));

corr.obs_neut_test.second = max(abs(c3));

corr.obs_stress_hab.second = max(abs(c2));

corr.obs_neut_hab.second = max(abs(c4));

corr_through_time;

corr.obs_stress_test_contact.second = res(1);

corr.obs_neut_test_contact.second = res2(1);


sniff_correlation;

corr.obs_stress_sniff.second = max(abs(c));

corr.obs_neut_sniff.second = max(abs(c2));

%%% THIRD BATCH

main3;



corr_plots;

L2_errors.obs_stress_test.third = immse(obs_activity_test_stress,stress_activity_test2);

L2_errors.obs_neut_test.third = immse(obs_activity_test_neutral,neutral_activity_test2);

L2_errors.obs_stress_hab.third= immse(obs_activity_hab_stress,stress_activity_hab2);

L2_errors.obs_neut_hab.third = immse(obs_activity_hab_neutral,neutral_activity_hab2);

L2_errors.obs_stress_test_contact.third = immse(obs_activity_test_stress(1:round(length(obs_activity_test_stress)/3)),stress_activity_test2(1:round(length(stress_activity_test2)/3)));

L2_errors.obs_neut_test_contact.third = immse(obs_activity_test_neutral(1:round(length(obs_activity_test_neutral)/3)),neutral_activity_test2(1:round(length(neutral_activity_test2)/3)));

Inf_errors.obs_stress_test.third = max(abs(obs_activity_test_stress-stress_activity_test2));

Inf_errors.obs_neut_test.third = max(abs(obs_activity_test_neutral-neutral_activity_test2));

Inf_errors.obs_stress_hab.third= max(abs(obs_activity_hab_stress-stress_activity_hab2));

Inf_errors.obs_neut_hab.third = max(abs(obs_activity_hab_neutral-neutral_activity_hab2));

corr.obs_stress_test.third = max(abs(c));

corr.obs_neut_test.third = max(abs(c3));

corr.obs_stress_hab.third = max(abs(c2));

corr.obs_neut_hab.third = max(abs(c4));

corr_through_time;

corr.obs_stress_test_contact.third = res(1);

corr.obs_neut_test_contact.third = res2(1);


sniff_correlation;

corr.obs_stress_sniff.third = max(abs(c));

corr.obs_neut_sniff.third = max(abs(c2));


%%% FOURTH BATCH

main4;




corr_plots;

L2_errors.obs_stress_test.fourth = immse(obs_activity_test_stress,stress_activity_test2);

L2_errors.obs_neut_test.fourth = immse(obs_activity_test_neutral,neutral_activity_test2);

L2_errors.obs_stress_hab.fourth = immse(obs_activity_hab_stress,stress_activity_hab2);

L2_errors.obs_neut_hab.fourth = immse(obs_activity_hab_neutral,neutral_activity_hab2);

L2_errors.obs_stress_test_contact.fourth = immse(obs_activity_test_stress(1:round(length(obs_activity_test_stress)/3)),stress_activity_test2(1:round(length(stress_activity_test2)/3)));

L2_errors.obs_neut_test_contact.fourth = immse(obs_activity_test_neutral(1:round(length(obs_activity_test_neutral)/3)),neutral_activity_test2(1:round(length(neutral_activity_test2)/3)));

Inf_errors.obs_stress_test.fourth = max(abs(obs_activity_test_stress-stress_activity_test2));

Inf_errors.obs_neut_test.fourth = max(abs(obs_activity_test_neutral-neutral_activity_test2));

Inf_errors.obs_stress_hab.fourth = max(abs(obs_activity_hab_stress-stress_activity_hab2));

Inf_errors.obs_neut_hab.fourth = max(abs(obs_activity_hab_neutral-neutral_activity_hab2));

corr.obs_stress_test.fourth = max(abs(c));

corr.obs_neut_test.fourth = max(abs(c3));

corr.obs_stress_hab.fourth = max(abs(c2));

corr.obs_neut_hab.fourth = max(abs(c4));

corr_through_time;

corr.obs_stress_test_contact.fourth = res(1);

corr.obs_neut_test_contact.fourth = res2(1);

close all

figure

Y = [Inf_errors.obs_stress_hab.first  Inf_errors.obs_stress_test.first ;
    Inf_errors.obs_stress_hab.second  Inf_errors.obs_stress_test.second; 
    Inf_errors.obs_stress_hab.third  Inf_errors.obs_stress_test.third;
    Inf_errors.obs_stress_hab.fourth  Inf_errors.obs_stress_test.fourth];
bar(Y)

legend('habituation','test')
title('Infinity error between observer and stressed in different datasets')
set(gca,'FontSize',20)
figure

Y = [Inf_errors.obs_neut_hab.first  Inf_errors.obs_neut_test.first ;
    Inf_errors.obs_neut_hab.second  Inf_errors.obs_neut_test.second; 
    Inf_errors.obs_neut_hab.third  Inf_errors.obs_neut_test.third;
    Inf_errors.obs_neut_hab.fourth  Inf_errors.obs_neut_test.fourth];
bar(Y)

legend('habituation','test')
title('Infinity error between observer and neutral in different datasets')
set(gca,'FontSize',20)

figure

Y = [L2_errors.obs_stress_hab.first  L2_errors.obs_stress_test.first ;
    L2_errors.obs_stress_hab.second  L2_errors.obs_stress_test.second; 
    L2_errors.obs_stress_hab.third  L2_errors.obs_stress_test.third;
    L2_errors.obs_stress_hab.fourth  L2_errors.obs_stress_test.fourth];
bar(Y)

legend('habituation','test')
title('L2 error between observer and stressed in different datasets')
set(gca,'FontSize',20)
figure

Y = [L2_errors.obs_neut_hab.first  L2_errors.obs_neut_test.first ;
    L2_errors.obs_neut_hab.second  L2_errors.obs_neut_test.second; 
    L2_errors.obs_neut_hab.third  L2_errors.obs_neut_test.third;
    L2_errors.obs_neut_hab.fourth  L2_errors.obs_neut_test.fourth];
bar(Y)

legend('habituation','test')
title('L2 error between observer and neutral in different datasets')
set(gca,'FontSize',20)
figure
subplot(2,1,2)
aa= categorical({'Habituation','Test'});

bar(aa(1),mean([Inf_errors.obs_stress_hab.first,Inf_errors.obs_stress_hab.second]) ,'r')

hold on

bar(aa(2),mean([Inf_errors.obs_stress_test.first,Inf_errors.obs_stress_test.second]) ,'b')

legend('habituation','test')
title('Average Infinity error between observer and stressed (neutral observer)')
set(gca,'FontSize',20)
subplot(2,1,1)

aa= categorical({'Habituation','Test'});

bar(aa(1),mean([Inf_errors.obs_neut_hab.first,Inf_errors.obs_neut_hab.second]) ,'r')

hold on

bar(aa(2),mean([Inf_errors.obs_neut_test.first,Inf_errors.obs_neut_test.second]) ,'b')

legend('habituation','test')
title('Average Infinity error between observer and neutral (neutral observer)')
set(gca,'FontSize',20)
figure
subplot(2,1,2)
aa= categorical({'Habituation','Test'});

bar(aa(1),mean([Inf_errors.obs_stress_hab.third,Inf_errors.obs_stress_hab.fourth]) ,'r')

hold on

bar(aa(2),mean([Inf_errors.obs_stress_test.third,Inf_errors.obs_stress_test.fourth]) ,'b')

legend('habituation','test')
title('Average Infinity error between observer and stressed (stressed observer)')
set(gca,'FontSize',20)
subplot(2,1,1)

aa= categorical({'Habituation','Test'});

bar(aa(1),mean([Inf_errors.obs_neut_hab.third,Inf_errors.obs_neut_hab.fourth]) ,'r')

hold on

bar(aa(2),mean([Inf_errors.obs_neut_test.third,Inf_errors.obs_neut_test.fourth]) ,'b')

legend('habituation','test')
title('Average Infinity error between observer and neutral (stressed observer)')
set(gca,'FontSize',20)
figure

subplot(2,1,1)

aa= categorical({'Habituation','Test'});

bar(aa(1),mean([L2_errors.obs_neut_hab.first,L2_errors.obs_neut_hab.second]) ,'r')

hold on

bar(aa(2),mean([L2_errors.obs_neut_test.first,L2_errors.obs_neut_test.second]) ,'b')

legend('habituation','test')
title('Average L2 error between observer and neutral (neutral observer)')
set(gca,'FontSize',20)
subplot(2,1,2)

aa= categorical({'Habituation','Test'});

bar(aa(1),mean([L2_errors.obs_stress_hab.first,L2_errors.obs_stress_hab.second]) ,'r')

hold on

bar(aa(2),mean([L2_errors.obs_stress_test.first,L2_errors.obs_stress_test.second]) ,'b')

legend('habituation','test')
title('Average L2 error between observer and stressed (neutral observer)')
set(gca,'FontSize',20)
figure

subplot(2,1,1)

aa= categorical({'Habituation','Test'});

bar(aa(1),mean([L2_errors.obs_neut_hab.third,L2_errors.obs_neut_hab.fourth]) ,'r')

hold on

bar(aa(2),mean([L2_errors.obs_neut_test.third,L2_errors.obs_neut_test.fourth]) ,'b')

legend('habituation','test')
title('Average L2 error between observer and neutral (stressed observer)')
set(gca,'FontSize',20)
subplot(2,1,2)

aa= categorical({'Habituation','Test'});

bar(aa(1),mean([L2_errors.obs_stress_hab.third,L2_errors.obs_stress_hab.fourth]) ,'r')

hold on

bar(aa(2),mean([L2_errors.obs_stress_test.third,L2_errors.obs_stress_test.fourth]) ,'b')

legend('habituation','test')
title('Average L2 error between observer and stressed (stressed observer)')
set(gca,'FontSize',20)

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
    corr.obs_neut_hab.fourth  Inf_errors.obs_neut_test.fourth];
bar(Y)

legend('habituation','test')
title('Correlation between observer and neutral in different datasets')
set(gca,'FontSize',20)

figure

Y = [ corr.obs_stress_test.first  corr.obs_stress_test_contact.first ;
      corr.obs_stress_test.second  corr.obs_stress_test_contact.second; 
      corr.obs_stress_test.third  corr.obs_stress_test_contact.third;
      corr.obs_stress_test.fourth  corr.obs_stress_test_contact.fourth];
bar(Y)

legend('All test','First part of test')
title('Correlation at first contacts between observer and stressed in different datasets')
set(gca,'FontSize',20)
figure

Y = [ corr.obs_neut_test.first  corr.obs_neut_test_contact.first ;
      corr.obs_neut_test.second  corr.obs_neut_test_contact.second; 
      corr.obs_neut_test.third  corr.obs_neut_test_contact.third;
      corr.obs_neut_test.fourth  corr.obs_neut_test_contact.fourth];
bar(Y)

legend('All test','First part of test')
title('Correlation at first contacts between observer and neutral in different datasets')
set(gca,'FontSize',20)
figure

aa= categorical({'Habituation','Test','beginning of test','sniffing'});

bar(aa(1),mean([corr.obs_stress_hab.first,corr.obs_stress_hab.second]) ,'r')

hold on

bar(aa(2),mean([corr.obs_stress_test.first,corr.obs_stress_test.second]) ,'b')

bar(aa(3),mean([corr.obs_stress_test_contact.first,corr.obs_stress_test_contact.second]) ,'green')

bar(aa(4),mean([corr.obs_stress_sniff.first,corr.obs_stress_sniff.second]),'m')

legend('habituation','test','beginning of test','sniffing')
title('Average correlation between observer and stressed (neutral observer)')
set(gca,'FontSize',20)
figure

aa= categorical({'Habituation','Test','beginning of test','sniffing'});

bar(aa(1),mean([corr.obs_neut_hab.first,corr.obs_neut_hab.second]) ,'r')

hold on

bar(aa(2),mean([corr.obs_neut_test.first,corr.obs_neut_test.second]) ,'b')

bar(aa(3),mean([corr.obs_neut_test_contact.first,corr.obs_neut_test_contact.second]) ,'green')

bar(aa(4),mean([corr.obs_neut_sniff.first,corr.obs_neut_sniff.second]),'m')

legend('habituation','test','beginning of test','sniffing')
title('Average correlation between observer and neutral (neutral observer)')
set(gca,'FontSize',20)
figure

aa= categorical({'Habituation','Test','beginning of test'});

bar(aa(1),mean([corr.obs_stress_hab.third,corr.obs_stress_hab.fourth]) ,'r')

hold on

bar(aa(2),mean([corr.obs_stress_test.third,corr.obs_stress_test.fourth]) ,'b')

bar(aa(3),mean([corr.obs_stress_test_contact.third,corr.obs_stress_test_contact.fourth]) ,'green')



legend('habituation','test','beginning of test','sniffing')
title('Average correlation between observer and stressed (stressed observer)')
set(gca,'FontSize',20)
figure

aa= categorical({'Habituation','Test','beginning of test'});

bar(aa(1),mean([corr.obs_neut_hab.third,corr.obs_neut_hab.fourth]) ,'r')

hold on

bar(aa(2),mean([corr.obs_neut_test.third,corr.obs_neut_test.fourth]) ,'b')

bar(aa(3),mean([corr.obs_neut_test_contact.third,corr.obs_neut_test_contact.fourth]) ,'green')



legend('habituation','test','beginning of test')
title('Average correlation between observer and neutral (stressed observer)')
set(gca,'FontSize',20)



neuron_percentage_stress.test.first = 11.43;

neuron_percentage_stress.hab.first = 1.66;

neuron_percentage_neut.test.first = 23;

neuron_percentage_neut.hab.first = 4.5;

neuron_percentage_stress.test.second = 17.47;

neuron_percentage_stress.hab.second = 1.56;

neuron_percentage_neut.test.second = 2.71;

neuron_percentage_neut.hab.second = 3.62;

neuron_percentage_stress.test.third = 4.9;

neuron_percentage_stress.hab.third = 1.69;

neuron_percentage_neut.test.third = 14.7;

neuron_percentage_neut.hab.third = 1.7;

neuron_percentage_stress.test.fourth = 13.76;

neuron_percentage_stress.hab.fourth = 2.66;

neuron_percentage_neut.test.fourth = 44.3;

neuron_percentage_neut.hab.fourth = 18.9;

aa= categorical({'Habituation','Test'});

obs_stress_means = [mean([neuron_percentage_stress.hab.first neuron_percentage_stress.hab.second ...
    neuron_percentage_stress.hab.third neuron_percentage_stress.hab.fourth]) ...
    mean([neuron_percentage_stress.test.first neuron_percentage_stress.test.second ...
    neuron_percentage_stress.test.third neuron_percentage_stress.test.fourth])];

obs_neut_means = [mean([neuron_percentage_neut.hab.first neuron_percentage_neut.hab.second ...
    neuron_percentage_neut.hab.third neuron_percentage_neut.hab.fourth]) ...
    mean([neuron_percentage_neut.test.first neuron_percentage_neut.test.second ...
    neuron_percentage_neut.test.third neuron_percentage_neut.test.fourth])];

figure
plot(aa,obs_stress_means,'r','LineWidth',3)

figure
plot(aa,obs_neut_means,'b','LineWidth',3)
