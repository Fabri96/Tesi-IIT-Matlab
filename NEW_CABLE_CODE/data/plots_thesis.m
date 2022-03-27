
clear all
load('Ca_B_GHK.mat')
load('Ca_B_HH.mat')
load('Ca_B_LRM.mat')
load('error_GHK.mat')
load('error_LRM.mat')
load('error_HH.mat')
load('error_test_GHK.mat')
load('error_test_LRM.mat')
load('error_test_HH.mat')
load('Ca_B_testing_GHK.mat')
load('Ca_B_testing_LRM.mat')
load('Ca_B_testing_HH.mat')
load('A_ca_next_test.mat')
load('pks_data.mat')
load('pks_data2.mat')
close all

times_and_peaks = [ pks_data;pks_data2];

indices = find(times_and_peaks(:,3)-times_and_peaks(:,6) < 0.1);
times_and_peaks(indices,:)=[];
indices2 = find(times_and_peaks(:,3)-times_and_peaks(:,6) > 0.35);
times_and_peaks(indices2,:)=[];

A_Ca_prev = times_and_peaks (1:round(end/2),3);
A_Ca_prev(A_Ca_prev==1)=0.99;
A_Ca_next = times_and_peaks (1:round(end/2),6);
A_Ca_next(A_Ca_next==1)=0.99;

subplot(1,3,1)
plot(2:20,error_LRM)
idxmin_LRM = find(error_LRM == min(error_LRM));
subplot(1,3,1)
plot(2:20,error_LRM,'b-o','LineWidth',3,'MarkerSize',5)
hold on
plot(idxmin_LRM,error_LRM(idxmin_LRM),'r.','MarkerSize',25)
legend('','min')
grid
set(gca,'FontSize',15)
title('MSE in LRM')
xlabel('p')
ylabel('MSE')
ylim([0 0.13])
grid minor

subplot(1,3,2)
idxmin_GHK = find(error_GHK == min(error_GHK));
plot(2:20,error_GHK,'b-o','LineWidth',3,'MarkerSize',5)
hold on
plot(idxmin_GHK,error_GHK(idxmin_GHK),'r.','MarkerSize',25)
legend('','min')
grid
set(gca,'FontSize',15)
title('MSE in GHK')
xlabel('p')
ylabel('MSE')
ylim([0 0.13])
grid minor

subplot(1,3,3)
idxmin_HH = find(error_HH == min(error_HH));
plot(2:20,error_HH,'b-o','LineWidth',3,'MarkerSize',5)
hold on
plot(idxmin_HH,error_HH(idxmin_HH),'r.','MarkerSize',25)
legend('','min')
grid
set(gca,'FontSize',15)
title('MSE in HH')
xlabel('p')
ylabel('MSE')
ylim([0 0.13])
grid minor

figure

plot(1:length(A_Ca_next),A_Ca_next,'r--o','LineWidth',3,...
    'MarkerSize',15)
hold on
plot(1:length(A_Ca_next),Ca_B_LRM(idxmin_LRM,:),...
    'b--o','LineWidth',3,'MarkerSize',15)

plot(1:length(A_Ca_next),Ca_B_GHK(idxmin_GHK,:),...
    'g--o','LineWidth',3,'MarkerSize',15)
plot(1:length(A_Ca_next),Ca_B_HH(idxmin_HH,:),...
    'k--o','LineWidth',3,'MarkerSize',15)
grid
legend('Data','LRM','GHK','HH')
title('Calcium peak in neuron B (training)')
xlabel('Pair number')
ylabel('Peak amplitude')
set(gca,'FontSize',20)

figure
for p=2:3:20
    plot(Ca_B_LRM(p-1,:),'--o','LineWidth',3,'MarkerSize',15,...
        'DisplayName'," p = " + p)
    hold on
end
plot(1:length(A_Ca_next),A_Ca_next,'r','LineWidth',3,...
    'MarkerSize',15,...
        'DisplayName'," data ")
legend

grid
title('Calcium peak in neuron B (training of LRM)')
xlabel('Pair number')
ylabel('Peak amplitude')
set(gca,'FontSize',20)





figure



plot(1:length(A_Ca_next_test)-1,A_Ca_next_test(1:end-1),'r--o','LineWidth',3,...
    'MarkerSize',15)
hold on
plot(1:length(A_Ca_next_test)-1,Ca_B_testing_LRM(1:end-1),...
    'b--o','LineWidth',3,'MarkerSize',15)

plot(1:length(A_Ca_next_test)-1,Ca_B_testing_GHK(1:end-1),...
    'g--o','LineWidth',3,'MarkerSize',15)
plot(1:length(A_Ca_next_test)-1,Ca_B_testing_HH(1:end-1),...
    'k--o','LineWidth',3,'MarkerSize',15)
grid
legend('Data','LRM','GHK','HH')
title('Calcium peak in neuron B (test)')
xlabel('Pair number')
ylabel('Peak amplitude')
set(gca,'FontSize',20)
ylim([0 1])