clear all
% addpath('cable_model')
%% Import data and create pattern list
load('pks_data.mat')
load('pks_data2.mat')

times_and_peaks = [ pks_data;pks_data2];

indices = find(times_and_peaks(:,3)-times_and_peaks(:,6) < 0.1);
times_and_peaks(indices,:)=[];
indices2 = find(times_and_peaks(:,3)-times_and_peaks(:,6) > 0.35);
times_and_peaks(indices2,:)=[];

A_Ca_prev = times_and_peaks (1:round(end/2),3);
A_Ca_prev(A_Ca_prev==1)=0.99;
A_Ca_next = times_and_peaks (1:round(end/2),6);
A_Ca_next(A_Ca_next==1)=0.99;

tt1 = times_and_peaks (1:round(end/2),2);
tt2 = times_and_peaks (1:round(end/2),5);

phi = @(x,p,k) x.^p./(x.^p + k);
%phi_lin 
phi_inv =@(x,p,k) (k.*x ./ (1-x)).^(1./p);

psi_min = -67;
psi_max = 20;
LL=times_and_peaks (1:round(end/2),7);
LL=LL*1e-6; % da micrometri a metri
%  p=14;
kk=0.01;
% Ca_B = zeros(20,2);

% L=compute_distance("C30", "C31",stress_roi_data);
% imodel = 1 ------> LR
% imodel = 2 ------> GHK
% imodel = 3 ------> No transmembrane currents
% imodel = 4 ------> HH
imodel = 1;

 for p=2:20
% disp('Import data and create pattern list');

% main;
close all
 for iii=1:length(A_Ca_prev)
    


tend = tt2(iii)-tt1(iii);


%% Compute the potential in neuron A given
%% its calcium concentration

% disp(['Compute the potential in neuron A given ' ...
%     'its calcium concentration']);

V_1=Ca_to_AP(A_Ca_prev(iii),phi_inv,p,kk);

V_1 = V_1*(psi_max-psi_min) + psi_min;

V_1 = V_1*1e-3; % da mV a V
V_2=V_1;

L = LL(iii);
%% Launch cable solver
% disp(['Launch cable solver'])
main_cable_eq;

%% Compute the calcium in neuron B given
%% the obtained potential
% disp(['Compute the calcium in neuron B'])
% ext=1; % External contribute to AP
% Ca_B(p) = AP_to_Ca(mean(psi_h(end,end))*1e3,phi,p,kk);


Ca_B(p-1,iii) = AP_to_Ca(mean(psi_h(end,1:end/3))*1e3,phi,p,kk);
end
p
error(p-1) = mse(Ca_B(p-1,:),A_Ca_next');
% clear Ca_B
  end
figure
plot([2:length(error)+1],error,'r-o')
set(gca,'FontSize',20)
ylabel('MSE')
xlabel('p')
grid

my_p = find(error==min(error));

 figure
  plot([1:size(Ca_B,2)],Ca_B(my_p,:),'r--o','LineWidth',2,'MarkerSize',15)
  hold on
  plot([1:size(Ca_B,2)],A_Ca_next,'b--o','LineWidth',2,'MarkerSize',15)
  legend('model prediction','calcium data')
set(gca,'FontSize',20)
ylabel('Peak value')
xlabel('Neuron pair')
grid
ylim([0,1])
% for p=1:20
%     error(p) = mse(Ca_B(p,:),A_Ca_next);
% end