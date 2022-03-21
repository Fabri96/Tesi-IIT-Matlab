% Developed by Fabrizio Bernardi & Greta Fregiari

% Plots of cross correlations between observer and two mice.
% 
% The correlation is computed on the times when the 2 mice 
% were close (obtained through function detect_areas)
% 

% close all

initial = 0; % Consider only first part of signal
lag_selection =0;

fs=0.1; %delta t
maxlag= 4/0.01;
nn=4;

    %TEST (already done -> m1_interaction, m1_no_inter)
if (initial==1)

    [c,lags] = xcov(m1_interaction(1:round(end/nn)),m2_interaction(1:round(end/nn)),'normalized');

    [c1,lags1] = xcov(m1_no_inter(1:round(end/nn)),m2_no_inter(1:round(end/nn)),'normalized');

    [c2,lags2] = xcov(m1_sniff(1:round(end/nn)),m2_sniff(1:round(end/nn)),'normalized');

    [c3,lags3] = xcov(m1_no_sniff(1:round(end/nn)),m2_no_sniff(1:round(end/nn)),'normalized');

else

    [c,lags] = xcov(m1_interaction,m2_interaction,'coeff');
    
    [c1,lags1] = xcov(m1_no_inter,m2_no_inter,'coeff');
    
    [c2,lags2] = xcov(m1_sniff,m2_sniff,'coeff');

    [c3,lags3] = xcov(m1_no_sniff,m2_no_sniff,'coeff');
     
%     [c,lags] = xcorr(m1_interaction,m2_interaction,'coeff');
%     
%     [c1,lags1] = xcorr(m1_no_inter,m2_no_inter,'coeff');
%     
%     [c2,lags2] = xcorr(m1_sniff,m2_sniff,'coeff');
% 
%     [c3,lags3] = xcorr(m1_no_sniff,m2_no_sniff,'coeff');

end

if( lag_selection==1)
    [c,lags] = xcov(m1_interaction,m2_interaction, maxlag,'coeff');
    
    [c1,lags1] = xcov(m1_no_inter,m2_no_inter, maxlag,'coeff');
    
    [c2,lags2] = xcov(m1_sniff,m2_sniff, maxlag,'coeff');

    [c3,lags3] = xcov(m1_no_sniff,m2_no_sniff, maxlag,'coeff');

end
 
%% PROVA
% m2_new = interp1(m2_activity_test(:,1),...
%     m2_activity_test(:,2),m1_activity_test(:,1));

[c_prova, lag_prova]=xcov(m1_activity_test(:,2), m2_activity_test(:,2),'coeff');

plot(lag_prova,c_prova,'r-o', MarkerSize=2)

title('CC during whole test')
%%

figure()
subplot(1,2,1)
plot(lags,c,'r-o', MarkerSize=2)
hold on
plot(lags1,c1,'g-o', MarkerSize=2)
legend('CC during interaction','CC during no interaction')
xlabel('lags')
ylabel('cross-correlation')
ylim([-0.3 1])
title('Cross-correlations between mice during test')
set(gca,'FontSize',15)

subplot(1,2,2)
plot(lags2,c2,'r-o', MarkerSize=2)
hold on
plot(lags3,c3,'g-o', MarkerSize=2)
legend('CC during sniffing','CC during no sniffing')
xlabel('lags')
ylabel('cross-correlation')
ylim([-0.3 1])
title('Cross-correlations between mice during test')
set(gca,'FontSize',15)
