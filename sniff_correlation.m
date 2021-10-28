stress_sniff = find(sniff(:,5)==1);

neutral_sniff = find(sniff(:,6)==1);

s = sniff(stress_sniff,1);

s2 = sniff(neutral_sniff,1);

obs_activity_test_stress_sniff = interp1(obs_activity_test(:,1),obs_activity_test(:,2), s);

obs_activity_test_neutral_sniff = interp1(obs_activity_test(:,1),obs_activity_test(:,2), s2);

stress_activity_test2_sniff = interp1(stress_activity_test(:,1),stress_activity_test(:,2), s);

neutral_activity_test2_sniff = interp1(neutral_activity_test(:,1),neutral_activity_test(:,2), s2);



subplot(1,2,1)

[c,lags] = xcorr(obs_activity_test_stress_sniff,stress_activity_test2_sniff,'normalized');


stem(lags,c,'b')

legend('CC during test')
xlabel('lags')
ylabel('cross-correlation')


title('Cross-correlations between observer and stressed during sniffing')

subplot(1,2,2)

[c2,lags2] = xcorr(obs_activity_test_neutral_sniff,neutral_activity_test2_sniff,'normalized');



stem(lags2,c2,'b')

legend('CC during test')
xlabel('lags')
ylabel('cross-correlation')


title('Cross-correlations between observer and neutral during sniffing')

