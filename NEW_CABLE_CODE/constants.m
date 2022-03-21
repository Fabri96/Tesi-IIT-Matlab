% This file defines the physical constants used in the model equations
Tc   = 20;                               % ref. temperature value ( [] = Celsius)
T    = Tc + 273.15;                      % ref. temperature value ( [] = K ) 
kB   = 1.3806488e-23;                    % Boltzmann constant ([] = m2 kg s-2 K^-1)
q    = 1.602e-19;                        % elementary charge ([] = C)
Vth  = kB*T/q;                           % thermal voltage ([] = V)
Nav  = 6.022e23;                         % Avogadro's constant ([] = 1/mol)
eps0 = 8.854e-12;                        % vacuum dielectric permittivity ([] = F/m)
er   = 80;                               % relative dielectric permability of water
F    = q*Nav;                            % Faraday's constant ([] = C/mol)
