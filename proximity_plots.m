% aa= categorical({'standard','self-exp'});
% 
% bar(aa(1),(435+555)/2 ,'r')
% 
% hold on
% 
% bar(aa(2),(327+229)/2 ,'b')
% ylim([0 500])
% ylabel('time (s)')
% title('Proximity times with stressed')
% set(gca,'FontSize',20)
% figure
% 
% aa= categorical({'standard','self-exp'});
% 
% bar(aa(1),(295+152)/2 ,'r')
% 
% hold on
% 
% bar(aa(2),(422+278)/2 ,'b')
% ylim([0 500])
% ylabel('time (s)')
% title('Proximity times with neutral')
% set(gca,'FontSize',20)

main3_OASIS;
close all
t_obs_stress1 = length(obs_activity_test_stress)*fs;

t_obs_neut1 = length(obs_activity_test_neutral)*fs;

t_interm1 = length(intermediate)*fs;

t_obs_stress1_hab = length(obs_activity_hab_stress)*fs;

t_obs_neut1_hab = length(obs_activity_hab_neutral)*fs;

t_interm1_hab = length(intermediate2)*fs;

main4_OASIS;
close all
t_obs_stress2 = length(obs_activity_test_stress)*fs;

t_obs_neut2 = length(obs_activity_test_neutral)*fs;

t_interm2 = length(intermediate)*fs;

t_obs_stress2_hab = length(obs_activity_hab_stress)*fs;

t_obs_neut2_hab = length(obs_activity_hab_neutral)*fs;

t_interm2_hab = length(intermediate2)*fs;


figure

subplot(1,2,1)
aa= categorical({'near stressed','near neutral','intermediate'});

bar(aa(1),(t_obs_stress1+t_obs_stress2)/2  ,'r')

hold on

bar(aa(2),(t_obs_neut1+t_obs_neut2)/2 ,'b')

bar(aa(3),(t_interm1+t_interm2)/2 ,'green')

grid
ylabel('time (s)')
legend('near stressed','near neutral','intermediate')
title('Test')
set(gca,'FontSize',15)
ylim([0 ,600])


subplot(1,2,2)
aa= categorical({'near stressed','near neutral','intermediate'});

bar(aa(1),(t_obs_stress1_hab+t_obs_stress2_hab)/2  ,'r')

hold on

bar(aa(2),(t_obs_neut1_hab+t_obs_neut2_hab)/2 ,'b')

bar(aa(3),(t_interm1_hab+t_interm2_hab)/2 ,'green')

grid
ylabel('time (s)')
legend('near stressed','near neutral','intermediate')
title('Habituation')
set(gca,'FontSize',15)
ylim([0 ,600])

sgt=sgtitle('Average time spent near other mice')

sgt.FontSize = 20;