% Model for transmembrane current: 
% imodel = 1 ------> LR
% imodel = 2 ------> GHK
% imodel = 3 ------> No transmembrane currents
% imodel = 4 ------> HH
% imodel = 4;

% ion valences
z_K  = +1;
z_Na = +1;
z_Cl = -1;
%
z_ions = [z_K, z_Na, z_Cl];

% ion concentrations and permeabilities

% Reference values of ion permeabilities: BIOPHYS. J., Volume 35 September 1981 677-697, 
% ALFRED STRICKHOLM, Section of Physiology, Medical Sciences Program, Indiana University, Bloomington, Indiana 47405
% IONIC PERMEABILITY OF K, Na, AND Cl IN POTASSIUM-DEPOLARIZED NERVE DEPENDENCY 
% ON pH, COOPERATIVE EFFECTS, AND ACTION OF TETRODOTOXIN

% In the resting axon (Ko = 5.4 mM, pH = 7.0): P_K = 1.33 X 10-7, P_Cl = 1.99 X 10-8, P_Na = 1.92 x 10-10 m/s 
% In elevated potassium (Ko = 40 mM, pH 7.0): P_K = 1.9 X 10-7, P_Cl = 1.2 x 10-7, and P_Na = 2.7 x 10-9 m/s.
% ipotassium = 1 -----> low extracellular K concentration
% ipotassium = 2 -----> elevated extracellular K concentration
ipotassium = 1;
%
if (ipotassium == 1)
   P_K  = 1.33e-7;             % membrane permeability [m/s] 
   P_Na = 1.92e-10;            % membrane permeability [m/s] 
   P_Cl = 1.99e-8;             % membrane permeability [m/s] 
   %
   Kout = 5.4;                 % extracellular K concentration [mM]
else
   P_K  = 1.9e-7;              % membrane permeability [m/s] 
   P_Na = 2.7e-9;              % membrane permeability [m/s] 
   P_Cl = 1.2e-7;              % membrane permeability [m/s] 
   %
   Kout = 40;                  % extracellular K concentration [mM]
end
%
P_ions = [P_K, P_Na, P_Cl];
% intracellular/extracellular ion molar densities ([]=mM, squid axon, Ermentrout-Terman Table 1.1)
% Kin   = 400;
% Nain  = 50;
% Naout = 440;
% Clin  = 40;
% Clout = 560;
% %
% vec_n_out = [Kout, Naout, Clout];
% vec_n_in  = [Kin,  Nain,  Clin];
% ion number densities (m^-3) (mammalian cell, Ermentrout-Terman Table 1.1)
Kin   = 140;
Kout  = 5;
Nain  = 10;
Naout = 145;
Clin  = 4;
Clout = 110;

vec_n_out = [Kout, Naout, Clout];
vec_n_in  = [Kin,  Nain,  Clin];

% Nernst potential for each ion species
E_K      = Vth/z_K*log(Kout/Kin); 
E_Na     = Vth/z_Na*log(Naout/Nain); 
E_Cl     = Vth/z_Cl*log(Clout/Clin);
%
E_ions   = [E_K, E_Na, E_Cl];

%
% specific conductances (S/m^2) and equilibrium potential (V)
switch imodel
case 1
% linear resistor
   g_K  = F*z_K^2*(Kin+Kout)/2*P_K/Vth;
   g_Na = F*z_Na^2*(Nain+Naout)/2*P_Na/Vth;
   g_Cl = F*z_Cl^2*(Clin+Clout)/2*P_Cl/Vth;
  %
   g_ions   = [g_K, g_Na, g_Cl];
   Vm_eq    = g_ions*E_ions'/sum(g_ions);
case 2
% GHK model
   g_K  = F*z_K^2*Kin*P_K/Vth;
   g_Na = F*z_Na^2*Nain*P_Na/Vth;
   g_Cl = F*z_Cl^2*Clin*P_Cl/Vth;
   %
   g_ions   = [g_K, g_Na, g_Cl];
   % Membrane resting potential according to Goldman equation 
   % P_K:P_Na:P_Cl = 1:0.03:0.1 (Hodgkin-Huxley, 1952)
   Num      = P_K*Kout + P_Na*Naout + P_Cl*Clin;
   Den      = P_K*Kin  + P_Na*Nain  + P_Cl*Clout;
   %
   Vm_eq    = Vth*log(Num/Den);
case 3
% no currents model
   % the specific conductances are set equal to zero to cancel the contribution of the conduction currents
   g_K  = 0;
   g_Na = 0;
   g_Cl = 0;
   %
   g_ions = [g_K, g_Na, g_Cl];
   % the specific membrane capacitance is set equal to zero to cancel the contribution of the capacitive current
   cm     = 0;
   % the equilibrium potential is undefined in this case, we set it arbitrarily equal to zero
   Vm_eq  = 0;
case 4
% HH model
   % we use the same specific conductances used in the linear resistor model
   g_K  = F*z_K^2*(Kin+Kout)/2*P_K/Vth;
   g_Na = F*z_Na^2*(Nain+Naout)/2*P_Na/Vth;
   g_Cl = F*z_Cl^2*(Clin+Clout)/2*P_Cl/Vth;
   %
   g_ions   = [g_K, g_Na, g_Cl];
   % equilibrium values of the gating variables
   [am_eq, bm_eq, an_eq, bn_eq, ah_eq, bh_eq] = HHgating_coeff(0);
   m_eq     = am_eq/(am_eq + bm_eq);
   n_eq     = an_eq/(an_eq + bn_eq);
   h_eq     = ah_eq/(ah_eq + bh_eq);
   %
   g_ions_eq = [g_K*n_eq^4, g_Na*m_eq^3*h_eq, g_Cl];
   %
   Vm_eq     = g_ions_eq*E_ions'/sum(g_ions_eq);
   %
end
%
