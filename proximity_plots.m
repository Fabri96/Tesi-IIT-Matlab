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




subplot(2,1,1)

aa= categorical({'near stressed','near neutral','intermediate'});

bar(aa(1),(435+555)/2  ,'r')

hold on

bar(aa(2),(295+152)/2 ,'b')

bar(aa(3),181.5 ,'green')


ylabel('time (s)')
legend('near stressed','near neutral','intermediate')
title('Average time spent near others mice by standard observer')
set(gca,'FontSize',15)
ylim([0 ,600])
subplot(2,1,2)

aa= categorical({'near stressed','near neutral','intermediate'});

bar(aa(1),(327+229)/2  ,'r')

hold on

bar(aa(2),(422+278)/2 ,'b')

bar(aa(3),272,'green')

ylim([0 ,600])
ylabel('time (s)')
legend('near stressed','near neutral','intermediate')
title('Average time spent near others mice in self-experience')
set(gca,'FontSize',15)