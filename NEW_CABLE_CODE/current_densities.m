% This script evaluates the transmembrane current densities flowing across the external surface of the axon

J_Na  = zeros(dimx, dimt);
J_K   = zeros(dimx, dimt);
J_Cl  = zeros(dimx, dimt);
J_cap = zeros(dimx, dimt);
%
switch imodel
       case 1
       % LR model
       J_Na = g_Na*(psi_h - E_Na);
       J_K  = g_K*(psi_h - E_K);
       J_Cl = g_Na*(psi_h - E_Cl);
       case 2
       % GHK model
       for i = 1:dimx
	   for j = 1:dimt
	       V = psi_h(i,j);
	       % sodium
	       [bp, bn]  = bern(z_Na*V/Vth);
	       E         = Vth/z_Na*(Naout/Nain - 1)*bp;
	       J_Na(i,j) = g_Na*(V - E);
	       % potassium
	       [bp, bn]  = bern(z_K*V/Vth);
	       E         = Vth/z_K*(Kout/Kin - 1)*bp;
	       J_K(i,j)  = g_K*(V - E);
	       % chlorine
	       [bp, bn]  = bern(z_Cl*V/Vth);
	       E         = Vth/z_Cl*(Clout/Clin - 1)*bp;
	       J_Cl(i,j) = g_Cl*(V - E);
           end
       end
       case 4
       % HH model
       for i = 1:dimx
	   for j = 1:dimt
	       V = psi_h(i,j);
	       % sodium
	       gsodium   = g_Na*m_h(i,j)^3*h_h(i,j);
	       J_Na(i,j) = gsodium*(V - E_Na);
	       % potassium
	       gpotassium = g_K*n_h(i,j)^4;
	       J_K(i,j) = gpotassium*(V - E_K);
	       % chlorine
	       J_Cl(i,j) = g_Cl*(V - E_Cl);
           end
       end
end
% Capacitive current
if (imodel ~= 3)
   J_cap =  zeros(dimx, dimt);
   for ii  = 1:dimx
       psi_cap    = psi_h(ii,:);
       Jc         = cm*diff(psi_cap)./diff(time)';
       J_cap(ii,:)= P0_to_P1_proj(Jc',  diff(time)', NT);
   end
end
% Total conduction current density
J_tot_ion = J_Na + J_K + J_Cl;
%

