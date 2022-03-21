% main2;

main3_OASIS;
corr_plots;
sniff_correlation;
close all

avg_test_stress1 = mean(obs_activity_test_stress);

stress_close1 = mean(stress_activity_test2);

stress_sniff1 = mean(stress_activity_test2_sniff);

stress_far1 = mean(stress_interm_test);

neutral_close1 = mean(neutral_activity_test2);

neutral_sniff1 = mean(neutral_activity_test2_sniff);

neutral_far1 = mean(neutral_intermediate_test);

avg_test_neut1 = mean(obs_activity_test_neutral);

avg_interm1 = mean(obs_stress_interm_test);

avg_sniff_stress1 = mean(obs_activity_test_stress_sniff);

avg_sniff_neut1 = mean(obs_stress_interm_test);


main4_OASIS;
corr_plots;
sniff_correlation;
close all

avg_test_stress2 = mean(obs_activity_test_stress);

avg_test_neut2 = mean(obs_activity_test_neutral);

stress_close2 = mean(stress_activity_test2);

stress_sniff2 = mean(stress_activity_test2_sniff);

stress_far2 = mean(stress_interm_test);

neutral_close2 = mean(neutral_activity_test2);

neutral_sniff2 = mean(neutral_activity_test2_sniff);

neutral_far2 = mean(neutral_intermediate_test);


avg_interm2 = mean(obs_stress_interm_test);

avg_sniff_stress2 = mean(obs_activity_test_stress_sniff);

avg_sniff_neut2 = mean(obs_activity_test_neutral_sniff);


avg_test_stress = (avg_test_stress1 +avg_test_stress2)/2;

avg_test_neut = (avg_test_neut1 +avg_test_neut2)/2;

avg_sniff_stress = (avg_sniff_stress1 +avg_sniff_stress2)/2;

avg_sniff_neut = (avg_sniff_neut1 +avg_sniff_neut2)/2;

avg_interm = (avg_interm1 +avg_interm2)/2;

avg_stress_close = (stress_close1+stress_close2)/2;

avg_stress_far = (stress_far1+stress_far2)/2;

avg_stress_sniff = (stress_sniff1+stress_sniff2)/2;

avg_neutral_close = (neutral_close1+neutral_close2)/2;

avg_neutral_far = (neutral_far1+neutral_far2)/2;

avg_neutral_sniff = (neutral_sniff1+neutral_sniff2)/2;

figure

subplot(1,3,1)

aa= categorical({'near stressed','near neutral','sniff stressed','sniff neutral','intermediate'});

bar(aa(1),avg_test_stress  ,'r')

hold on

bar(aa(2),avg_test_neut ,'b')

bar(aa(3),avg_sniff_stress,'green')

bar(aa(4),avg_sniff_neut,'k')

bar(aa(5),avg_interm,'c')
ylabel('\DeltaF/F')
ylim([0 1])
grid

title('Average activity of observer')
set(gca,'FontSize',15)


subplot(1,3,2)
% figure

aa= categorical({'near','far','sniff'});

bar(aa(1),avg_stress_close  ,'r')

hold on

bar(aa(2),avg_stress_far ,'b')

bar(aa(3),avg_stress_sniff,'green')

ylabel('\DeltaF/F')
grid
ylim([0 1])
title('Average activity of stressed')
set(gca,'FontSize',15)

subplot(1,3,3)
% figure

aa= categorical({'near','far','sniff'});

bar(aa(1),avg_neutral_close  ,'r')

hold on

bar(aa(2),avg_neutral_far ,'b')

bar(aa(3),avg_neutral_sniff,'green')

ylabel('\DeltaF/F')
grid
ylim([0 1])
title('Average activity of neutral')
set(gca,'FontSize',15)

