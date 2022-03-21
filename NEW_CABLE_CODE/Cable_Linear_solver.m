function [psi_new, I_new] = Cable_Linear_solver( Vext, psi_old)
% Author: R.Sacco
% Cable linear solver is based on the primal mixed finite element method

global dt H Nel cm radius rho_axon g_ions E_ions Rout Gout
global imodel

% diffusion coefficient
D = radius/(2*rho_axon)*ones(Nel, 1);
% reaction coefficient
r = (cm/dt + sum(g_ions))*ones(Nel+1, 1);
% production coefficient
g = cm*psi_old/dt + g_ions*E_ions';

% Time dependent Dirichlet bc at left boundary, Robin bc at right boundary      
% BC coefficients: \gamma I \cdot n = \alpha \psi - \beta 
if (Rout == 0)
   gamma = [0, 0];  
   alpha = [1, 1]; 
else
   gamma = [0, 1];  
   alpha = [1, Gout];
end
beta     = [Vext, 0];
% ***** Building  matrices ********
% Diffusion matrix
Kdiffusion  = diffusion_matrix(D, H, Nel);
% Lumped reaction matrix
Kreaction   = reaction_matrix_lumped(r, H, Nel);
% Stiffness matrix
K           = Kdiffusion + Kreaction;
% ***** Building Right-hand side ******
F           = load_vector(g, H, Nel);  
% ****** Apply boundary conditions *******
K(1,:)      = K(1,:) * gamma(1);
K(1,1)      = K(1,1) + alpha(1)/(2*pi*radius);
K(end,:)    = K(end,:) * gamma(2);
K(end,end)  = K(end,end) + alpha(2)/(2*pi*radius);
F(1)        = F(1) * gamma(1) + beta(1)/(2*pi*radius);
F(end)      = F(end) * gamma(2) + beta(2)/(2*pi*radius);
% ****** Solve the linear system *******
psi_new     = K \ F; 
% ******* Post-processing calculation *****
% Pw constant longitudinal current
I_P0        = -pi*radius^2/rho_axon*diff(psi_new)./H;
% Projection over pw linear continuous FEs
M           = mass_matrix(H, Nel);
b           = zeros(Nel+1,1);
b(1)        = I_P0(1)*H(1)/2;
for ie = 2:Nel
    b(ie) = (I_P0(ie-1)*H(ie-1) + I_P0(ie)*H(ie))/2;
end
b(end)      = I_P0(end)*H(end)/2;
%
I_new       = M \ b;
%
return
