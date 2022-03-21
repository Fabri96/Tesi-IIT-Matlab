main3_OASIS
pks_matrix_plot;
close all

m1_first = m1;
m2_first = m2;
m3_first = m3;
m4_first = m4;


main4_OASIS
pks_matrix_plot;
close all

m1_second = m1;
m2_second = m2;
m3_second = m3;
m4_second = m4;


aa= categorical({'Habituation','Test'});

figure
plot(aa,[(m1_first+m1_second)/2 (m2_first+m2_second)/2],'r--o',LineWidth=2,MarkerSize=15)


hold on

plot(aa,[(m3_first+m3_second)/2 (m4_first+m4_second)/2],'b--o',LineWidth=2,MarkerSize=15)

ylim([0 0.6])
grid
legend('obs vs stress', 'obs vs neutral')

title ('Average peak synchronization between neurons (self-exp)')

set(gca,'FontSize',20)

