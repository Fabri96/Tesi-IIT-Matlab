% Developed by Fabrizio Bernardi 

% INPUT --> amplitude of calcium A_Ca
% 
% OUTPUT --> amplitude of action potential A_AP

function A_AP = Ca_to_AP(A_Ca,phi_inv,p,k)


A_AP = phi_inv(A_Ca,p,k);

