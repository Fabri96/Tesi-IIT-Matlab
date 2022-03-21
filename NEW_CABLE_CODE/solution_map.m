% This script manages the solution of the cable equation problem
% fprintf('         Cable simulation is starting .... \n\n')
% **** Temporal discretization ********
for k = 2:length(time)
    % Voltage stimulus
    t             = time(k);
    V_ext         = voltage_stimulus(t1, t2, t3, t, V_1, V_2, Vm_eq);
    V_stimulus(k) = V_ext;
    %
%     fprintf('  Time (ms) = %3d\n ', time(k-1)*1e3);
    %
    if (imodel == 1)||(imodel == 3)        
       % Linear resistor model or No TM currents model: no need for functional iterations
       [psi_new, I_new] = Cable_Linear_solver(V_ext, psi_old);
    else 
       if (imodel == 2)
          % GHK model: functional iteration is used to determine the membrane potential of time level t_{k+1}
          [psi_new, I_new, nit, err] = Cable_NL_solver(V_ext, psi_old);
       else
          % HH model: functional iteration is used to determine the membrane potential of time level t_{k+1}
          [psi_new, I_new, m_new, n_new, h_new, nit, err] = Cable_HH_solver(V_ext, psi_old, m_old, n_old, h_old);
       end
       % print convergence history
%        fprintf('  # fixed-point iterations = %3d ', nit);
%        fprintf('  Maximum relative error   =  %5e\n', err);
       % save # of iterations for plot
       iter_nr = [iter_nr; nit];
    end
    % Storing new computed solutions
    % Membrane potential, pw linear
    psi_h(:,k) = psi_new;
    % Longitudinal current, pw linear
    I_h(:,k)   = I_new;
    % Initial condition for the next time level
    psi_old    = psi_new;
    if (imodel == 4)
       % Gating variables
       m_h(:,k) = m_new;
       n_h(:,k) = n_new;
       h_h(:,k) = h_new;
       % Initial condition for the next time level
       m_old    = m_new;
       n_old    = n_new;
       h_old    = h_new;      
    end
end
%
