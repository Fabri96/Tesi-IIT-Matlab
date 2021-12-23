% Author: R.Sacco
% This script solves the cable equation model supplied with: 
% 1) the linear resistor model;
% 2) the GHK model.
% 3) the no transmembrane currents model
% The input voltage is a square wave representing a depolarization-hyperpolarization stimulus.
% The output variables are the spatial/temporal distributions of the axon membrane potential and longitudinal current.
clc
main;
roi_analysis;
patterns = pattern_list(neurons_activated_obs,obs_roi_data);
clearvars -except patterns
close all
%
global z_ions vec_n_in vec_n_out Vth toll max_it
global dt H Nel cm radius rho_axon g_ions Gout E_ions
global imodel
%
% Physical constants
constants;
% Cable parameters
cable_parameters;
L=71e-6;
% Ion parameters
ion_parameters;
% Voltage stimulation parameters
stimulus_parameters;
V_1=patterns{1,3}.amplitude_previous/0.05*50;
V_1=V_1*1e-3;
V_2=V_1;
% Spatial/temporal discretization parameters
discretization_parameters;
% Variable initialization and initial conditions
initial_cond;

fprintf('         Cable simulation is starting .... \n\n')
% **** Temporal discretization ********
for k=2:length(time)
    % Voltage stimulus
    t                = time(k);
    V_ext            = voltage_stimulus(t1, t2, t3, t, V_1, V_2, Vm_eq);
    V_stimulus(k)    = V_ext;
		%
		fprintf('  Time = %3d\n ', time(k-1));
		%
		if (imodel == 1)||(imodel == 3)
            
	   % Linear resistor model or No TM currents model: no need for functional iterations
       [psi_new, I_new]      = Cable_Linear_solver( V_ext, psi_old);
       
		else
		% GHK model: functional iteration to determine the membrane potential of time level t_n+1
       [psi_new, I_new, nit, err] = Cable_NL_solver( V_ext, psi_old);
       
        % print convergence history
       fprintf('  # fixed-point iterations = %3d ', nit);
       fprintf('  Maximum relative error   =  %5e\n', err);
       % save # of iterations for plot
			 iter_nr = [iter_nr; nit];
    end
    % Storing the solution pair
		% Membrane potential, pw linear
    psi_h(:,k)       = psi_new;
    % Longitudinal current, pw linear
    I_h(:,k)         = I_new;
    % Initial condition for the next time level
    psi_old          = psi_new;
end
% **** Computing transmembrane current densities *****
current_densities;
% **** Plotting the results *****
plot_solutions;
% limiting solution (for R_out ----> +infty)
psi_m_limit = sum(g_ions.*E_ions)/sum(g_ions)
%
return
