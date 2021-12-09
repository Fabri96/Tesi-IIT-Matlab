% This script evaluates the transmembrane current densities
% across the external surface of the axon.
% Capacitive current
J_cap   =  zeros(dim,dimt);
Jc      =  zeros(dim,1);
psi_cap =  zeros(dim,dimt-1);
for ii  = 1:dim
psi_cap    = psi_h(ii,:);
Jc         = cm* diff(psi_cap)./diff(time);
J_cap(ii,:)= P0_to_P1_proj(Jc',  diff(time)', dimt-1);
end


if (imodel == 1)
   % LR model
   J_Na = g_Na*(psi_h - E_Na);
   J_K  = g_K*(psi_h - E_K);
   J_Cl = g_Na*(psi_h - E_Cl);
else
   % GHK model
	 J_Na = zeros(dim,dimt);
	 J_K  = zeros(dim,dimt);
	 J_Cl = zeros(dim,dimt);
   %
	 for i = 1:dim
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
end
if (imodel == 3)
     J_Na  = zeros(dim,dimt);
	 J_K   = zeros(dim,dimt);
	 J_Cl  = zeros(dim,dimt);
     J_cap = zeros(dim,dimt);
end
   %
