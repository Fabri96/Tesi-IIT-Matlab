function y = rhs_conduction(V)
% This function computes the contribution to the rhs
% of the cable equation due to ion conduction across the axon membrane
% in the case of the GHK model
% y = rhs_conduction(V)
%
global z_ions g_ions vec_n_in vec_n_out Vth
%
y = 0;
%
for i=1:length(z_ions)
	  [bp, bn] = bern(z_ions(i)*V/Vth);
		E      = Vth/z_ions(i)*(vec_n_out(i)/vec_n_in(i) - 1)*bp;
        y      = y + g_ions(i)*E;  
end	 
%
y = y';
%
return
