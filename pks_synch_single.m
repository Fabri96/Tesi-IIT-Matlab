if(dataset==1)
    fs = 0.129;
end

if(dataset==2)
    fs=0.05;
end

if(dataset==3)
    fs=0.1273;
end

if(dataset==4)
    fs=0.1264;
end

close all
if(dataset == 1 || dataset == 3)

    pks_mat_obs = pks_matrix(obs_test,obs_test,right,fs);

    pks_mat_neutral = pks_matrix(neutral_test,neutral_test,left,fs);

    pks_mat_stress = pks_matrix(stress_test,stress_test,right,fs);

    pks_mat_obs_hab = pks_matrix(obs_hab,obs_hab,right2,fs);

    pks_mat_neutral_hab = pks_matrix(neutral_hab,neutral_hab,left2,fs);

    pks_mat_stress_hab = pks_matrix(stress_hab,stress_hab,right2,fs);

end

if(dataset == 2|| dataset == 4)

    pks_mat_obs = pks_matrix(obs_test,obs_test,left,fs);

    pks_mat_neutral = pks_matrix(neutral_test,neutral_test,right,fs);

    pks_mat_stress = pks_matrix(stress_test,stress_test,left,fs);

    pks_mat_obs_hab = pks_matrix(obs_hab,obs_hab,left2,fs);

    pks_mat_neutral_hab = pks_matrix(neutral_hab,neutral_hab,right2,fs);

    pks_mat_stress_hab = pks_matrix(stress_hab,stress_hab,left2,fs);
    
end

% figure
% subplot(1,2,1)
% 
% heatmap(double(pks_mat_obs_stress_hab) > 0.6)
% 
% xlabel('Neurons of stressed')
% ylabel('Neurons of observer')
% title('Peak synch during hab')
% set(gca,'FontSize',20)
% subplot(1,2,2)
% 
% heatmap(double(pks_mat_obs_stress > 0.6))
% 
% xlabel('Neurons of stressed')
% ylabel('Neurons of observer')
% title('Peak synch during test')
% set(gca,'FontSize',20)
% 
% figure
% subplot(1,2,1)
% 
% heatmap(double(pks_mat_obs_neutral_hab > 0.6))
% 
% xlabel('Neurons of neutral')
% ylabel('Neurons of observer')
% title('Peak synch during hab')
% set(gca,'FontSize',20)
% subplot(1,2,2)
% 
% heatmap(double(pks_mat_obs_neutral > 0.6))
% 
% xlabel('Neurons of neutral')
% ylabel('Neurons of observer')
% title('Peak synch during test')
% set(gca,'FontSize',20)

%% observer
p1=pks_mat_obs_hab(:);
% p1=p1(p1~=0);
p2=pks_mat_obs(:);
% p2=p2(p2~=0);
anov_obs = anova1([p1(:) p2(:)]);
m1=mean(p1);

m2=mean(p2);

%% neutral
p3=pks_mat_neutral_hab(:);
% p3=p3(p3~=0);
p4=pks_mat_neutral(:);
% p4=p4(p4~=0);
anov_neut = anova1([p3(:) p4(:)]);
m3=mean(p3);

m4=mean(p4);

%% stressed
p5=pks_mat_stress_hab(:);
% p1=p1(p1~=0);
p6=pks_mat_stress(:);
% p2=p2(p2~=0);
anov_stress = anova1([p5(:) p6(:)]);
m5=mean(p5);

m6=mean(p6);

%% plots
aa= categorical({'Habituation','Test'});

figure
plot(aa,[m1 m2],'k--o',LineWidth=2,MarkerSize=15)


hold on

plot(aa,[m3 m4],'b--o',LineWidth=2,MarkerSize=15)

plot(aa,[m5 m6],'r--o',LineWidth=2,MarkerSize=15)

ylim([0 2])
grid
legend('obs', ' neutral','stressed')

title ('Average peak synchronization in same mouse')

set(gca,'FontSize',20)