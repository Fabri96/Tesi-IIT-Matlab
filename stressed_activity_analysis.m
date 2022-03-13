% Developed by Fabrizio Bernardi  

% Analysis of activity of stressed mouse during different phases


main_OASIS;
close all

obs_cage_act1 = mean(obs_activity_cage(:,2));
obs_hab_act1 = mean(obs_activity_hab(:,2));
obs_test_act1 = mean(obs_activity_test(:,2));

neutral_cage_act1 = mean(neutral_activity_cage(:,2));
neutral_hab_act1 = mean(neutral_activity_hab(:,2));
neutral_test_act1 = mean(neutral_activity_test(:,2));

stress_cage_act1 = mean(stress_activity_cage(:,2));
stress_hab_act1 = mean(stress_activity_hab(:,2));
stress_test_act1 = mean(stress_activity_test(:,2));



main2_OASIS;
close all

obs_cage_act2 = mean(obs_activity_cage(:,2));
obs_hab_act2 = mean(obs_activity_hab(:,2));
obs_test_act2 = mean(obs_activity_test(:,2));

neutral_cage_act2 = mean(neutral_activity_cage(:,2));
neutral_hab_act2 = mean(neutral_activity_hab(:,2));
neutral_test_act2 = mean(neutral_activity_test(:,2));

stress_cage_act2 = mean(stress_activity_cage(:,2));
stress_hab_act2 = mean(stress_activity_hab(:,2));
stress_test_act2 = mean(stress_activity_test(:,2));

% main3_OASIS;
% 
% hab_act3 = stress_activity_hab(:,2);
% test_act3 = stress_activity_test(:,2);
% 
% main4_OASIS;
% 
% hab_act4 = stress_activity_hab(:,2);
% test_act4 = stress_activity_test(:,2);

% close all
% subplot(1,2,1)

% g1 = repmat({'Habituation'},length(hab_act1),1);
% g2 = repmat({'Test'},length(test_act1),1);
% 
% g = [g1; g2];
% x=[hab_act1; test_act1];
% boxplot(x,g)
% title('Activities of stressed in I dataset')
% ylim([0 2])
% set(gca,'FontSize',15)
% 
% subplot(1,2,2)
% 
% 
% g1 = repmat({'Habituation'},length(hab_act2),1);
% g2 = repmat({'Test'},length(test_act2),1);
% 
% g = [g1; g2];
% x=[hab_act2; test_act2];
% boxplot(x,g)
% title('Activities of stressed in II dataset')
% ylim([0 2])
% set(gca,'FontSize',15)

% subplot(2,2,3)
% 
% g1 = repmat({'Habituation'},length(hab_act3),1);
% g2 = repmat({'Test'},length(test_act3),1);
% 
% g = [g1; g2];
% x=[hab_act3; test_act3];
% boxplot(x,g)
% title('Stressed activity in III dataset')
% set(gca,'FontSize',15)
% 
% 
% subplot(2,2,4)
% 
% g1 = repmat({'Habituation'},length(hab_act4),1);
% g2 = repmat({'Test'},length(test_act4),1);
% 
% g = [g1; g2];
% x=[hab_act4; test_act4];
% boxplot(x,g)
% title('Stressed activity in IV dataset')
% set(gca,'FontSize',15)
% 
% 
% 
figure

stress_avg_cage = mean([stress_cage_act1 ; stress_cage_act2]);

stress_avg_hab = mean([stress_hab_act1 ; stress_hab_act2]);

stress_avg_test = mean([stress_test_act1;stress_test_act2]);

neutral_avg_cage = mean([neutral_cage_act1 ; neutral_cage_act2]);

neutral_avg_hab = mean([neutral_hab_act1 ; neutral_hab_act2]);

neutral_avg_test = mean([neutral_test_act1;neutral_test_act2]);

obs_avg_cage = mean([obs_cage_act1 ; obs_cage_act2]);

obs_avg_hab = mean([obs_hab_act1 ; obs_hab_act2]);

obs_avg_test = mean([obs_test_act1;obs_test_act2]);

aa= categorical({'Habituation','Test'});
plot(aa,[stress_avg_hab,stress_avg_test],...
    'r--o',LineWidth=2,MarkerSize=15)
grid on
hold on
plot(aa,[obs_avg_hab,obs_avg_test],...
    'k--o',LineWidth=2,MarkerSize=15)
plot(aa,[neutral_avg_hab,neutral_avg_test],...
    'b--o',LineWidth=2,MarkerSize=15)

title('Average activity of mice')
ylabel('\DeltaF/F')
legend('Stressed','Observer','Neutral')
ylim([0.5 1])
set(gca,'FontSize',20)


