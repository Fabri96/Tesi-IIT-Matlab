addpath('cable_model')
%% Import data and create pattern list


% for p=1:1:20
disp('Import data and create pattern list');

% main;
close all
% step=5;
% roi_analysis;
% patterns = pattern_list(neurons_activated_stress,stress_roi_data);

%% Consider single pair of neurons (C30 and C31)
disp('Consider single pair of neurons');


%% Compute distance between neurons and time interval
% L=compute_distance("C30", "C31",stress_roi_data);
% first = stress_test(:,28);
% second = stress_test(:,29);

t1 = 1184.68314600000;
t2 = 1184.83302900000;
L=80;
L=L*1e-6;
% tend = my_pair1{1}.interval(2)-my_pair1{1}.interval(1);
tend = t2-t1;
% A_Ca_prev = 0.931130225198760;
% A_Ca_next = 0.557219936996779;

% A_Ca_prev = 0.708140273904770;
% A_Ca_next = 0.519048452388141;

A_Ca_prev = 0.937708005557847;
A_Ca_next = 0.619776214978442;

%% Compute the potential in neuron A given
%% its calcium concentration
disp(['Compute the potential in neuron A given ' ...
    'its calcium concentration']);

phi = @(x,p,k) x.^p./(x.^p + k);

phi_inv =@(x,p,k) (k.*x ./ (1-x))^(1./p);

 p=14;
kk=0.01;

psi_min = -67;
psi_max = 20;
% A_Ca_prev=0.9999;
V_1=Ca_to_AP(A_Ca_prev,phi_inv,p,kk);

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
Ca_B= AP_to_Ca(mean(psi_h(end,end))*1e3,phi,p,kk);
% end