% Developed by Fabrizio Bernardi 

% INPUT --> amplitude of action potential A_AP amplitude of calcium A_Ca
% 
% OUTPUT --> amplitude of calcium A_Ca

function A_Ca= AP_to_Ca(A_AP,phi,p,k)

psi_min = -67;

psi_max = 25;

A_AP = (A_AP-psi_min)/(psi_max-psi_min);


A_Ca = phi(A_AP,p,k);