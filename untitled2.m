figure
for i=2:7

    subplot(2,3,i-1)

    plot(obs_test(:,1),obs_test(:,i),'b-')

end  


figure
for i=7:13

    subplot(2,3,i-6)

    plot(obs_test(:,1),obs_test(:,i),'b-')

end