% Model for transmembrane current: 
%imodel = 1 ------> LR
%imodel = 2 ------> GHK
%imodel = 3 ------> No transmembrane currents
imodel = 2;

% ion valences
z_K  = +1;
z_Na = +1;
z_Cl = -1;
%
z_ions = [z_K, z_Na, z_Cl];
% Reference values of ion permeabilities: BIOPHYS. J., Volume 35 September 1981 677-697, 
% ALFRED STRICKHOLM, Section of Physiology, Medical Sciences Program, Indiana University, Bloomington, Indiana 47405
% IONIC PERMEABILITY OF K, Na, AND Cl IN POTASSIUM-DEPOLARIZED NERVE DEPENDENCY ON pH, COOPERATIVE EFFECTS, AND ACTION OF TETRODOTOXIN
% In the resting axon (Ko = 5.4 mM, pH = 7.0) P_K = 1.33 X 10-7, P_Cl = 1.99 X 10-8, P_Na = 1.92 x 10-10 m/s 
% while in elevated potassium (Ko = 40 mM, pH 7.0), P_K = 1.9 X 10-7, P_Cl = 1.2 x 10-7, and P_Na = 2.7 x 10-9 m/s.
P_K  = 1.33e-7;             % membrane permeability [m/s] 
P_Na = 1.92e-10;            % membrane permeability [m/s] 
P_Cl = 1.99e-8;             % membrane permeability [m/s] 
%
P_ions = [P_K, P_Na, P_Cl];
% intracellular/extracellular ion number densities (m^-3) (squid axon, Ermentrout-Terman Table 1.1)
% Kin   = 400*Nav;
% Kout  = 20*Nav;
% Nain  = 50*Nav;
% Naout = 440*Nav;
% Clin  = 40*Nav;
% Clout = 560*Nav;
%

% ion number densities (m^-3) (mammalian cell, Ermentrout-Terman Table 1.1)
Kin   = 140*Nav;
Kout  = 5*Nav;
Nain  = 10*Nav;
Naout = 145*Nav;
Clin  = 4*Nav;
Clout = 110*Nav;


vec_n_out = [Kout, Naout, Clout];
vec_n_in  = [Kin,  Nain,  Clin];

% Nernst potential for each ion species
E_K      = Vth/z_K*log(Kout/Kin); 
E_Na     = Vth/z_Na*log(Naout/Nain); 
E_Cl     = Vth/z_Cl*log(Clout/Clin);
%
E_ions   = [E_K, E_Na, E_Cl];

%
% specific conductances (S/m^2) 
if (imodel == 1)
% linear resistor
   g_K  = q*z_K^2*(Kin+Kout)/2*P_K/Vth;
   g_Na = q*z_Na^2*(Nain+Naout)/2*P_Na/Vth;
   g_Cl = q*z_Cl^2*(Clin+Clout)/2*P_Cl/Vth;
  %
   g_ions   = [g_K, g_Na, g_Cl];
   Vm_eq    = g_ions*E_ions'/sum(g_ions);
else
% GHK model
   g_K  = q*z_K^2*Kin*P_K/Vth;
   g_Na = q*z_Na^2*Nain*P_Na/Vth;
   g_Cl = q*z_Cl^2*Clin*P_Cl/Vth;
   %
   g_ions   = [g_K, g_Na, g_Cl];
   % Membrane resting potential according to Goldman equation 
   % P_K:P_Na:P_Cl = 1:0.03:0.1 (Hodgkin-Huxley, 1952)
   Num      = P_K*Kout + P_Na*Naout + P_Cl*Clin;
   Den      = P_K*Kin  + P_Na*Nain  + P_Cl*Clout;
   %
   Vm_eq    = Vth*log(Num/Den);
end

