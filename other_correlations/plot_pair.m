p_test_stress = sum(sum(a))/(size(a,1)*size(a,2));

p_test_neut = sum(sum(a1))/(size(a1,1)*size(a1,2));

p_hab_stress = sum(sum(a2))/(size(a2,1)*size(a2,2));

p_hab_neut = sum(sum(a3))/(size(a3,1)*size(a3,2));


aa = categorical({'Habituation','Test'});

plot(aa,[p_hab_stress p_test_stress], 'r--o',LineWidth=2,MarkerSize=15)
hold on
plot(aa,[p_hab_neut p_test_neut], 'b--o',LineWidth=2,MarkerSize=15)
title('Percentage of pairs expressing synchronization')
legend('obs vs stressed','obs vs neutral')

ylim([0,0.4])
set(gca,'FontSize',20)
