% Developed by Fabrizio Bernardi  

% Analysis of activity of stressed mouse during different phases


main;
hab_act1 = stress_activity_hab(:,2);
test_act1 = stress_activity_test(:,2);

main2;
hab_act2 = stress_activity_hab(:,2);
test_act2 = stress_activity_test(:,2);

main3;

hab_act3 = stress_activity_hab(:,2);
test_act3 = stress_activity_test(:,2);
main4;

hab_act4 = stress_activity_hab(:,2);
test_act4 = stress_activity_test(:,2);

close all
subplot(2,2,1)

g1 = repmat({'Habituation'},length(hab_act1),1);
g2 = repmat({'Test'},length(test_act1),1);

g = [g1; g2];
x=[hab_act1; test_act1];
boxplot(x,g)
title('Stressed activity in I dataset')

set(gca,'FontSize',15)

subplot(2,2,2)


g1 = repmat({'Habituation'},length(hab_act2),1);
g2 = repmat({'Test'},length(test_act2),1);

g = [g1; g2];
x=[hab_act2; test_act2];
boxplot(x,g)
title('Stressed activity in II dataset')

set(gca,'FontSize',15)

subplot(2,2,3)

g1 = repmat({'Habituation'},length(hab_act3),1);
g2 = repmat({'Test'},length(test_act3),1);

g = [g1; g2];
x=[hab_act3; test_act3];
boxplot(x,g)
title('Stressed activity in III dataset')
set(gca,'FontSize',15)


subplot(2,2,4)

g1 = repmat({'Habituation'},length(hab_act4),1);
g2 = repmat({'Test'},length(test_act4),1);

g = [g1; g2];
x=[hab_act4; test_act4];
boxplot(x,g)
title('Stressed activity in IV dataset')
set(gca,'FontSize',15)



figure

avg_hab = mean([hab_act1 ; hab_act2; hab_act3 ;hab_act4]);

avg_test = mean([test_act1;test_act2;test_act3;test_act4]);

maxim_hab = mean([max(hab_act1) max(hab_act2) max(hab_act3) max(hab_act4)]);

maxim_test = mean([max(test_act1) max(test_act2) max(test_act3) max(test_act4)]);



aa= categorical({'Habituation','Test'});
plot(aa,[avg_hab,avg_test],'r-o','LineWidth',4)
grid on
hold on
plot(aa,[maxim_hab,maxim_test],'b-o','LineWidth',4)
title('Average activity of stressed mice')

legend('Mean activity','Peak activity')

set(gca,'FontSize',20)