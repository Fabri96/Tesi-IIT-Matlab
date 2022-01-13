subplot(1,2,1)
heatmap(double(c_matrix_stress_hab>1.4))
ylabel('Neurons of observer')
xlabel('Neurons of stressed')
title('Peak correlations during hab')
set(gca,'FontSize',15)

subplot(1,2,2)
heatmap(double(c_matrix_stress_test>1.5))
ylabel('Neurons of observer')
xlabel('Neurons of stressed')
title('Peak correlations during test')
set(gca,'FontSize',15)

figure

subplot(1,2,1)
heatmap(double(c_matrix_neutral_hab>1.5))
ylabel('Neurons of observer')
xlabel('Neurons of neutral')
title('Peak correlations during hab')
set(gca,'FontSize',15)

subplot(1,2,2)
heatmap(double(c_matrix_neutral_test>1.4))
ylabel('Neurons of observer')
xlabel('Neurons of neutral')
title('Peak correlations during test')
set(gca,'FontSize',15)


a=double(c_matrix_stress_test>1.5);
a1=double(c_matrix_neutral_test>1.4);