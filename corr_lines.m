% corr_plots;

obs_stress_corr_hab = max(abs(c2));

obs_stress_corr_test = max(abs(c));

obs_neutral_corr_hab = max(abs(c4));

obs_neutral_corr_test = max(abs(c3));
figure


plot([2 4], [obs_stress_corr_hab obs_stress_corr_test], 'r-','Linewidth',3)
xlim([1.75 4.25])
ylim ([0 1])
ylabel('Normalized cross correlation ')
hold on
plot([2 4], [obs_neutral_corr_hab obs_neutral_corr_test], 'b-','Linewidth',3)
grid on
xlim([1.75 4.25])
ylim ([0 1])
ylabel('Normalized cross correlation ')
title('Correlation behaviour between habituation and test')

legend('observer and stressed', 'observer and neutral') 