%Developed by Greta Fregiari

%SET DATA 1
close

%check plot calcium of every neuron
figure()
for i=2:size(m1_test,2)
    subplot(5,3,i)
    plot(m1_test(:,1),m1_test(:,i))
    title('Neuron', num2str(i))
    ylim([-1,1.5])
end
sgtitle('Calcium of single neuron of mouse 1')

figure()
for i=2:size(m2_test,2)
    subplot(4,3,i)
    plot(m2_test(:,1),m2_test(:,i))
    title('Neuron', num2str(i))
    ylim([-1,1.5])
end
sgtitle('Calcium of single neuron of mouse 2')

%%
%mean activity of calcium of every mouse
figure()
subplot(2,1,1)
plot(m1_activity_test(:,1), m1_activity_test(:,2))
title('Mean activity mouse 1')
ylim([-1.5,3.5])
subplot(2,1,2)
plot(m2_activity_test(:,1), m2_activity_test(:,2))
title('Mean activity mouse 2')
ylim([-1,3.5])

%mean activity of calcium of every mouse together
figure()
plot(m1_activity_test(:,1), m1_activity_test(:,2),'LineWidth',0.5)
hold on
plot(m2_activity_test(:,1), m2_activity_test(:,2),'LineWidth',0.5)
legend('mouse 1','mouse 2')
title('Mean activity mice')

%%
% place of mouse in pre and post (far (0) or near(1))
figure()
subplot(3,1,1)
plot(zone_pre_m1(:,1),zone_pre_m1(:,4),'r')
hold on
plot(zone_pre_m2(:,1),zone_pre_m2(:,4)*1.2,'g')
ylim([0,3])
title('Pre zone')
legend('Mouse 1', 'Mouse 2')
subplot(3,1,2)
plot(m1_activity_pre(:,1), m1_activity_pre(:,2))
hold on 
plot(zone_pre_m1(:,1),zone_pre_m1(:,4)*3,'r')
ylim([-1,3.2])
legend('calcium','active zone')
title('Mouse 1')
subplot(3,1,3)
plot(m2_activity_pre(:,1), m2_activity_pre(:,2))
hold on 
plot(zone_pre_m2(:,1),zone_pre_m2(:,4)*3,'g')
ylim([-1,3.2])
legend('calcium','active zone')
title('Mouse 2')

figure()
subplot(3,1,1)
plot(zone_post_m1(:,1),zone_post_m1(:,4),'r')
hold on
plot(zone_post_m2(:,1),zone_post_m2(:,4)*1.2,'g')
ylim([0,3])
title('Post zone')
legend('Mouse 1', 'Mouse 2')
subplot(3,1,2)
plot(m1_activity_post(:,1), m1_activity_post(:,2))
hold on 
plot(zone_post_m1(:,1),zone_post_m1(:,4)*3,'r')
ylim([-1,3.2])
legend('calcium','active zone')
title('Mouse 1')
subplot(3,1,3)
plot(m2_activity_post(:,1), m2_activity_post(:,2))
hold on 
plot(zone_post_m2(:,1),zone_post_m2(:,4)*3,'g')
ylim([-1,3.2])
legend('calcium','active zone')
title('Mouse 2')

%%
%sniffing

figure()
subplot(3,1,1)
plot(interaction(:,1),interaction(:,5),'g')
ylim([0,3])
title('Sniffing time')
subplot(3,1,2)
plot(m1_activity_test(:,1), m1_activity_test(:,2))
hold on 
plot(interaction(:,1),interaction(:,5)*3,'g')
ylim([-1,3.2])
legend('calcium','sniffing')
title('Calcium during test mouse 1')
subplot(3,1,3)
plot(m2_activity_test(:,1), m2_activity_test(:,2))
hold on 
plot(interaction(:,1),interaction(:,5)*3,'g')
ylim([-1,3.2])
legend('calcium','sniffing')
title('Calcium during test mouse 2')

%Calcium of single neuron with sniffing time
figure()
for i=2:size(m1_test,2)
    subplot(5,3,i)
    plot(m1_test(:,1),m1_test(:,i))
    hold on
    plot(interaction(:,1),interaction(:,5)*9,'--g')
    title('Neuron', num2str(i))
    ylim([-4,10])
end
sgtitle('Calcium of single neuron of mouse 1 and sniffing')

figure()
for i=2:size(m2_test,2)
    subplot(4,3,i)
    plot(m2_test(:,1),m2_test(:,i),'LineWidth',2)
    hold on
    plot(interaction(:,1),interaction(:,5)*9,'--g')
    title('Neuron', num2str(i))
    ylim([-4,10])
end
sgtitle('Calcium of single neuron of mouse 2 and sniffing')

%% Plot mean calcium

X = categorical({'Sniffing','Interaction','No sniffing','No interaction', 'Test', 'Pre near','Pre far','Post near', 'Post far'});
X = reordercats(X,{'Sniffing','Interaction','No sniffing','No interaction', 'Test', 'Pre near', 'Pre far', 'Post near', 'Post far'});
Y = [m1_mean_sniff, m2_mean_sniff; m1_mean_interaction, m2_mean_interaction; m1_mean_no_sniff, m2_mean_no_sniff; ...
    m1_mean_no_interaction, m2_mean_no_interaction; m1_mean_test, m2_mean_test; m1_mean_pre_near, m2_mean_pre_near; ...
    m1_mean_pre_far, m2_mean_pre_far; m1_mean_post_near, m2_mean_post_near; ...
    m1_mean_post_far, m2_mean_post_far];

bar(X,Y)

ylabel('Calcium mean value')
legend('Mouse 1','Mouse2')

