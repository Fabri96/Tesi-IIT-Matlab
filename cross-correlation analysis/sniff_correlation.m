% Developed by Fabrizio Bernardi  

% Plots of the correlation during sniffing

lag_selection=0;
initial = 0;

if(dataset==1 || dataset ==3)

stress_sniff = find(sniff(:,5)==1);

% stress_sniff = stress_sniff(1:round(length(stress_sniff)/3));

neutral_sniff = find(sniff(:,6)==1);
% neutral_sniff = neutral_sniff(1:round(length(neutral_sniff)/3));

end

if(dataset==2 || dataset ==4)

stress_sniff = find(sniff(:,6)==1);

neutral_sniff = find(sniff(:,5)==1);

end
s = sniff(stress_sniff,1);

s2 = sniff(neutral_sniff,1);
if(dataset==4)
s =  s + obs_activity_test(1,1) ;  
s2 = s2 + obs_activity_test(1,1) ; 
end
obs_activity_test_stress_sniff = interp1(obs_activity_test(:,1),obs_activity_test(:,2), s);

obs_activity_test_neutral_sniff = interp1(obs_activity_test(:,1),obs_activity_test(:,2), s2);

stress_activity_test2_sniff = interp1(stress_activity_test(:,1),stress_activity_test(:,2), s);

neutral_activity_test2_sniff = interp1(neutral_activity_test(:,1),neutral_activity_test(:,2), s2);

if(lag_selection==1)
[c,lags] = xcov(obs_activity_test_stress_sniff,stress_activity_test2_sniff,maxlag,'normalized');

[c2,lags2] = xcov(obs_activity_test_neutral_sniff,neutral_activity_test2_sniff,maxlag,'normalized');

else

    [c,lags] = xcov(obs_activity_test_stress_sniff,stress_activity_test2_sniff,'normalized');

[c2,lags2] = xcov(obs_activity_test_neutral_sniff,neutral_activity_test2_sniff,'normalized');

end
if(initial==1)
    [c,lags] = xcov(obs_activity_test_stress_sniff(1:end/4),stress_activity_test2_sniff(1:end/4),maxlag,'normalized');

    [c2,lags2] = xcov(obs_activity_test_neutral_sniff(1:end/4),neutral_activity_test2_sniff(1:end/4),maxlag,'normalized');
end

subplot(1,2,1)


plot(lags,c,'b-o',MarkerSize=2)

legend('CC during test')
xlabel('lags')
ylabel('cross-correlation')
ylim([-0.3 1])

title('CC between observer and stressed during sniffing')
set(gca,'FontSize',15)
grid
subplot(1,2,2)


plot(lags2,c2,'b-o',MarkerSize=2)

legend('CC during test')
xlabel('lags')
ylabel('cross-correlation')


title('CC between observer and neutral during sniffing')
set(gca,'FontSize',15)
grid
ylim([-0.3 1])