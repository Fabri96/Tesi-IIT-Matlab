% Developed by Fabrizio Bernardi 

% INPUT --> amplitude of calcium A_Ca
% 
% OUTPUT --> amplitude of action potential A_AP

function A_AP = Ca_to_AP(A_Ca,net_Ca_to_AP)

A_AP= net_Ca_to_AP(A_Ca);
