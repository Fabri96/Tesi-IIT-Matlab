main3;
sniff_correlation;
close all

avg_test_stress = mean(obs_activity_test_stress);

avg_test_neut = mean(obs_activity_test_neutral);

avg_sniff_stress = mean(obs_activity_test_stress_sniff);

avg_sniff_neut = mean(obs_activity_test_neutral_sniff);



aa= categorical({'near stressed','near neutral','sniff stressed','sniff neutral'});

bar(aa(1),avg_test_stress  ,'r')

hold on

bar(aa(2),avg_test_neut ,'b')

bar(aa(3),avg_sniff_stress,'green')

bar(aa(4),avg_sniff_neut,'k')


title('Average activity of observer')
set(gca,'FontSize',15)
