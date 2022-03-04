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

if(dataset == 1 || dataset == 3)

    pks_mat_obs_stress = pks_matrix(obs_test,stress_test,right,fs);

    pks_mat_obs_neutral = pks_matrix(obs_test,neutral_test,left,fs);

    pks_mat_obs_stress_hab = pks_matrix(obs_hab,stress_hab,right2,fs);

    pks_mat_obs_neutral_hab = pks_matrix(obs_hab,neutral_hab,left2,fs);

end

if(dataset == 2|| dataset == 4)

    pks_mat_obs_stress = pks_matrix(obs_test,stress_test,left,fs);

    pks_mat_obs_neutral = pks_matrix(obs_test,neutral_test,right,fs);

    pks_mat_obs_stress_hab = pks_matrix(obs_hab,stress_hab,left2,fs);

    pks_mat_obs_neutral_hab = pks_matrix(obs_hab,neutral_hab,right2,fs);
    
end

subplot(1,2,1)

heatmap(double(pks_mat_obs_stress_hab > 0.2))

xlabel('Neurons of stressed')
ylabel('Neurons of observer')
title('Peak synch during hab')
set(gca,'FontSize',20)
subplot(1,2,2)

heatmap(double(pks_mat_obs_stress > 0.2))

xlabel('Neurons of stressed')
ylabel('Neurons of observer')
title('Peak synch during test')
set(gca,'FontSize',20)


p1=pks_mat_obs_stress_hab(:);
p1=p1(p1~=0);
p2=pks_mat_obs_stress(:);
p2=p2(p2~=0);

m1=mean(p1);

m2=mean(p2);

aa= categorical({'Habituation','Test'});

figure
plot(aa,[m1 m2],'r--o',LineWidth=2,MarkerSize=15)

title('Average peak synch between neurons in obs vs stress')

figure

p3=pks_mat_obs_neutral_hab(:);
p3=p3(p3~=0);
p4=pks_mat_obs_neutral(:);
p4=p4(p4~=0);

m3=mean(p3);

m4=mean(p4);

aa= categorical({'Habituation','Test'});

figure
plot(aa,[m3 m4],'r--o',LineWidth=2,MarkerSize=15)

title('Average peak synch between neurons in obs vs neutral')

