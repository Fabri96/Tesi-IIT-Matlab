addpath('cable_model')
%% Import data and create pattern list

disp('Import data and create pattern list');

main;
close all
% step=5;
% roi_analysis;
% patterns = pattern_list(neurons_activated_stress,stress_roi_data);

%% Consider single pair of neurons (C30 and C31)
disp('Consider single pair of neurons');
pair_matrix;
my_pair;

%% Compute distance between neurons and time interval
L=compute_distance("C30", "C31",stress_roi_data);
first = stress_test(:,28);
second = stress_test(:,29);

L=L*1e-6;
tend = my_pair1{1}.interval(2)-my_pair1{1}.interval(1);

%% Compute the potential in neuron A given
%% its calcium concentration
disp(['Compute the potential in neuron A given ' ...
    'its calcium concentration']);
load net_AP_to_Ca.mat

load net_Ca_to_AP.mat

V_1=Ca_to_AP(my_pair1{1}.amplitude_previous,net_Ca_to_AP);

V_2=V_1;

%% Launch cable solver
disp(['Launch cable solver'])
main_cable_eq;

%% Compute the calcium in neuron B given
%% the obtained potential
disp(['Compute the calcium in neuron B'])
ext=1; % External contribute to AP
Ca_B = AP_to_Ca(mean(psi_h(:,end)),ext,net_AP_to_Ca);