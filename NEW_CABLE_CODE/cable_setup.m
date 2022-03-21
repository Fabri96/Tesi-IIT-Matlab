clear all
% addpath('cable_model')
%% Import data and create pattern list

A_Ca_prev =[0.931130225198760 0.708140273904770];
A_Ca_next =[0.557219936996779 0.519048452388141];

tt1 = [1184.68314600000 1455.17200000000];
tt2 = [1184.83302900000 1455.32188300000];

phi = @(x,p,k) x.^p./(x.^p + k);

phi_inv =@(x,p,k) (k.*x ./ (1-x))^(1./p);

psi_min = -67;
psi_max = 20;
L=80;
L=L*1e-6;
%  p=14;
kk=0.01;
Ca_B = zeros(20,2);
 for p=2:2:30
% disp('Import data and create pattern list');

% main;
close all
 for iii=1:length(A_Ca_prev)
    
% iii=1;
%% Consider single pair of neurons (C30 and C31)
% disp('Consider single pair of neurons');


%% Compute distance between neurons and time interval

% L=compute_distance("C30", "C31",stress_roi_data);
% imodel = 1 ------> LR
% imodel = 2 ------> GHK
% imodel = 3 ------> No transmembrane currents
% imodel = 4 ------> HH
imodel = 1;

tend = tt2(iii)-tt1(iii);


%% Compute the potential in neuron A given
%% its calcium concentration

% disp(['Compute the potential in neuron A given ' ...
%     'its calcium concentration']);

V_1=Ca_to_AP(A_Ca_prev(iii),phi_inv,p,kk);

V_1 = V_1*(psi_max-psi_min) + psi_min;

V_1 = V_1*1e-3;
V_2=V_1;

%% Launch cable solver
disp(['Launch cable solver'])
main_cable_eq;

%% Compute the calcium in neuron B given
%% the obtained potential
disp(['Compute the calcium in neuron B'])
% ext=1; % External contribute to AP
% Ca_B(p) = AP_to_Ca(mean(psi_h(end,end))*1e3,phi,p,kk);

p
Ca_B(p,iii) = AP_to_Ca(mean(psi_h(end,end))*1e3,phi,p,kk);
end

error(p) = mse(Ca_B(p,:),A_Ca_next);
% clear Ca_B
  end
figure
plot([2:2:30],error,'r-o')
for p=1:20
    error(p) = mse(Ca_B(p,:),A_Ca_next);
end