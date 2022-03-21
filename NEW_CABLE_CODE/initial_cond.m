% Variable initialization 
psi_h         = zeros(dimx, dimt);         % membrane potential psi_m=psi_m(x,t) ([]=Volt)
I_h           = zeros(dimx, dimt);         % longitudinal current I_in=I_in(x,t) ([]=Ampere)
% Initial conditions 
psi_0         = Vm_eq*ones(dimx, 1);
psi_h(:,1)    = psi_0;
%
V_stimulus    = zeros(dimt,1);
V_stimulus(1) = Vm_eq;
%
psi_old       = psi_0;
% 
iter_nr       = [];
% imodel = 4 ----> HH model: we need also the gating variables
if (imodel == 4)
   m_h = zeros(dimx, dimt); 
   n_h = zeros(dimx, dimt); 
   h_h = zeros(dimx, dimt); 
   % Initial conditions
   m_0 = m_eq*ones(dimx, 1);
   n_0 = n_eq*ones(dimx, 1);
   h_0 = h_eq*ones(dimx, 1);
   %
   m_h(:,1) = m_0;
   n_h(:,1) = n_0;
   h_h(:,1) = h_0;
   %
   m_old    = m_0;
   n_old    = n_0;
   h_old    = h_0;
 end
 %
