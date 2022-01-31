
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
    time_stress_test = length(obs_activity_test_stress)*fs;

    time_neutral_test = length(obs_activity_test_neutral)*fs;

    time_stress_hab = length(obs_activity_hab_stress)*fs;

    time_neutral_hab = length(obs_activity_hab_neutral)*fs;

figure
aa= categorical({'Habituation','Test'});

plot(aa,[time_stress_hab time_stress_test ],'r--o',LineWidth=1,MarkerSize=20)

hold on

plot (aa,[ time_neutral_hab time_neutral_test],'b--o',LineWidth=1,MarkerSize=20)

legend('stress','neutral')
ylabel('time (s)')
title('Proximity times with demonstrators')

set(gca,'FontSize',20)