% Author: R.Sacco
% This script solves the cable equation model supplied with: 
% 1) the linear resistor model
% 2) the GHK model
% 3) the no transmembrane currents model
% 4) the Hodgkin-Huxley model
% The input voltage is a square wave representing a depolarization-hyperpolarization stimulus.
% The output variables are the spatial/temporal distributions of the axon membrane potential and longitudinal current.
% clc
% clear all
close all
%
global z_ions vec_n_in vec_n_out Vth toll max_it
global dt H Nel cm radius rho_axon g_ions Rout Gout E_ions v_ions
global imodel Vm_eq
% Physical constants
constants;
% Cable parameters
cable_parameters;
% Ion parameters
ion_parameters;
% Voltage stimulation parameters
stimulus_parameters;
% Spatial/temporal discretization parameters
discretization_parameters;
% Variable initialization and initial conditions
initial_cond;
% Solution 
solution_map;
% Computing transmembrane current densities 
current_densities;
% Plotting the results
% plot_solutions;
% Limiting solution (for R_out ----> +infty)
%psi_m_limit = sum(g_ions.*E_ions)/sum(g_ions)
%
return
