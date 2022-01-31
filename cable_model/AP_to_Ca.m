% Developed by Fabrizio Bernardi 

% INPUT --> amplitude of action potential A_AP amplitude of calcium A_Ca
% 
% OUTPUT --> amplitude of calcium A_Ca

function A_Ca= AP_to_Ca(A_AP,ext,net_AP_to_Ca)

A_Ca = net_AP_to_Ca(A_AP);


if(ext==1)

    A_Ca = 1.33*A_Ca;

end
