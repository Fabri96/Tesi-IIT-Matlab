function [psi_new, I_new, m_new, n_new, h_new, it, err] = Cable_HH_solver(Vext, psi_old, m_old, n_old, h_old)
% Author: R.Sacco
% Cable HH solver is based on the primal mixed finite element method

global toll max_it
global dt H Nel cm radius rho_axon g_ions Rout Gout Vm_eq E_ions

% diffusion coefficient
D = radius/(2*rho_axon)*ones(Nel, 1);

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

% ***** Building  matrix ********
% Diffusion matrix
Kdiffusion  = diffusion_matrix(D, H, Nel);
%
err         = toll + 1;
it          = 0;
% Solution variables at time t_k
psi_tk      = psi_old;
%
m_tk        = m_old;
n_tk        = n_old;
h_tk        = h_old;
%
while ((err > toll) & (it < max_it))
    % SOLVE CABLE EQUATION FOR GIVEN VALUES OF THE GATING VARIABLES
    % evaluate ion specific conductances
    gK  = g_ions(1)*n_old.^4;
    gNa = g_ions(2)*m_old.^3.*h_old;
    gCl = g_ions(3)*ones(Nel+1, 1);
    % total specific conductance
    gtot = gK + gNa + gCl;
    % reaction coefficient
    r = (cm/dt + gtot);
    % Lumped reaction matrix
    Kreaction = reaction_matrix_lumped(r, H, Nel);
    % Stiffness matrix
    K         = Kdiffusion + Kreaction;
    % determine the rhs contribution due to conduction current
    y = gK*E_ions(1) + gNa*E_ions(2) + gCl*E_ions(3);
    % production coefficient
    g = cm*psi_tk/dt + y;
    % ***** Building Right-hand side ******
    F = load_vector(g, H, Nel);  
    % ****** Apply boundary conditions *******
    K(1,:)      = K(1,:) * gamma(1);
    K(1,1)      = K(1,1) + alpha(1);
    K(end,:)    = K(end,:) * gamma(2);
    K(end,end)  = K(end,end) + alpha(2);
    F(1)        = F(1) * gamma(1) + beta(1);
    F(end)      = F(end) * gamma(2) + beta(2);
    % ****** Solve the linear system *******
    psi_new = K \ F;
    % evaluate relative error on the membrane potential
    err_V   = norm(psi_new - psi_old, 'inf')/norm(psi_new, 'inf');
    %
    psi_old = psi_new;
    % SOLVE GATING EQUATIONS FOR A GIVEN SHIFTED MEMBRANE POTENTIAL
    % displaced membrane potential in mV
    v_m = (psi_new - Vm_eq)*1e3;
    % evaluate gating rates
    for i = 1:Nel+1
        [am, bm, an, bn, ah, bh] = HHgating_coeff(v_m(i));
    end    
    % update gating variables using the Backward Euler time discretization scheme
    m_new = (m_old + dt*am)./(1 + dt*(am + bm));
    n_new = (n_old + dt*an)./(1 + dt*(an + bn));
    h_new = (h_old + dt*ah)./(1 + dt*(ah + bh));
    % evaluate relative error on the gating variables
    err_m = norm(m_new - m_old, 'inf')/norm(m_new, 'inf');
    err_n = norm(n_new - n_old, 'inf')/norm(n_new, 'inf');
    err_h = norm(h_new - h_old, 'inf')/norm(h_new, 'inf');
    err_g = max([err_m, err_n, err_h]);
    %
    err   = max([err_V, err_g]);
    %
    m_old = m_new;
    n_old = n_new;
    h_old = h_new;
    %
    it = it+1;
end
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
