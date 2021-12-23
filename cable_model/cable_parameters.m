% Cable parameters (as in Exercise 10, cap. 1 of Ermentrout-Terman)
radius         = 2.5e-5;                        % axon radius ([] = m)
L              = 20e-3;                       % Axon length ([] = m) 
tm             = 10e-9;                         % membrane thickness or channel length ([] = m)
cm             = eps0*er/tm;                    % membrane specific capacitance ([] = Farad/m^2)
% Electrical resistivity of water: 0.2 Ohm·m sea water, 2 to 200 Ohm·m drinking water, 180000 Ohm·m deionized water at 20°C
rho_axon       = 65;                          % axoplasm resistivity ([] = Ohm*m)
sigma_axon     = 1/rho_axon;                    % axoplasm conductivity ([] = Siemens/m)
% Output resistance
Rout           = inf;                           % Load (external) resistance ([] = Ohm)
%inf;                                           % Load (external) resistance ([] = Ohm)
Gout           = 1/Rout;                        % Load (external) conductance ([] = Siemens)
