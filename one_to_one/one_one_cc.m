
initial=0; % switch to consider only first part of times

[c1,lags1]=xcorr(m1_activity_test(:,2),m2_activity_test(:,2),'normalized');
% rand_test1 = phaseRandomize(m1_activity_test(:,2)');
% rand_test2 = phaseRandomize(m2_activity_test(:,2)');
% [cc1,llags1]=xcorr(rand_test1,rand_test2,'normalized');

[c2,lags2]=xcorr(m1_activity_pre(:,2),m2_activity_pre(:,2),'normalized');
% rand_pre1 = phaseRandomize(m1_activity_pre(:,2)');
% rand_pre2 = phaseRandomize(m2_activity_pre(:,2)');
% [cc2,llags2]=xcorr(rand_pre1,rand_pre2,'normalized');

[c3,lags3]=xcorr(m1_activity_post(:,2),m2_activity_post(:,2),'normalized');
% rand_post1 = phaseRandomize(m1_activity_post(:,2)');
% rand_post2 = phaseRandomize(m2_activity_post(:,2)');
% [cc3,llags3]=xcorr(rand_post1,rand_post2,'normalized');

[c4,lags4]=xcorr(m1_sniff,m2_sniff,'normalized');
% rand_sniff1 = phaseRandomize(m1_sniff);
% rand_sniff2 = phaseRandomize(m2_sniff);
% [cc4,llags4]=xcorr(rand_sniff1,rand_sniff2,'normalized');

% [c5,lags5]=xcorr(m1_post_near,m2_post_near,'none');
% 
% [c6,lags6]=xcorr(m1_post_far,m2_post_far,'normalized');

[c5,lags5]=xcov(m1_post_near,m2_post_near,'none');

[c6,lags6]=xcov(m1_post_far,m2_post_far,'none');


if(initial==1)

    [c1,lags1]=xcov(m1_activity_test(1:round(end/7),2),m2_activity_test(1:round(end/7),2),'normalized');


    [c2,lags2]=xcov(m1_activity_pre(1:round(end/5),2),m2_activity_pre(1:round(end/5),2),'normalized');


    [c3,lags3]=xcov(m1_activity_post(1:round(end/5),2),m2_activity_post(1:round(end/5),2),'normalized');


    [c4,lags4]=xcov(m1_sniff,m2_sniff,'normalized');

end
figure
subplot(2,2,1)
stem(lags1,c1)
ylim([-inf 1])
% hold on
% stem(llags1,cc1)
% ylim([-inf 1])
title('CC during test')
% legend('Test','Phase-rand')

subplot(2,2,2)
stem(lags2,c2)
ylim([-inf 1])
% hold on
% stem(llags2,cc2)
% ylim([-inf 1])
title('CC during pre-test')
% legend('Test','Phase-rand')


subplot(2,2,3)
stem(lags3,c3)
ylim([-inf 1])
% hold on
% stem(llags3,cc3)
% ylim([-inf 1])
title('CC during post-test')
% legend('Test','Phase-rand')

subplot(2,2,4)
stem(lags4,c4)
ylim([-inf 1])
% hold on
% stem(llags4,cc4)
% ylim([-inf 1])
title('CC during sniff')
% legend('Test','Phase-rand')

figure
subplot(1,2,1)
stem(lags5,c5)

title('CC during post near')
subplot(1,2,2)
stem(lags6,c6)

title('CC during post far')