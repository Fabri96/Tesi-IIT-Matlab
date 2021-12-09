% Variable initialization 
psi_h         = zeros(dim, NT+1);         % membrane potential psi_m=psi_m(x,t) ([]=Volt)
I_h           = zeros(dim, NT+1);       % longitudinal current I_in=I_in(x,t) ([]=Ampere)
% Initial conditions 
psi_0         = Vm_eq*ones(dim, 1);
psi_h(:,1)    = psi_0;
%
V_stimulus    = zeros(NT+1,1);
V_stimulus(1) = Vm_eq;
%
psi_old       = psi_0;
% 
iter_nr       = [];
%
