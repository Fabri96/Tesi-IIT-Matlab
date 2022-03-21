% Left and right boundaries of Omega
xL       = 0;                             % Axon left coordinate 
xR       = L;                             % Axon length ([] = m)
% Spatial discretization parameters
Nel      = 200;                            % number of elements
hsize    = (xR-xL)/Nel;                   % spatial mesh size
dimx     = Nel+1;
xn       = [xL:hsize:xR]';                % vertices
xcm      = (xn(1:end-1) + xn(2:end))/2;   % centers of mass
H        = diff(xn);                      % element sizes
% Time discretization parameters
NT       = 200;                            % number of time intervals
dimt     = NT+1;                           
dt       = (tend-tstart)/NT;              % time step  ( [] = s)
time     = [tstart:dt:tend]';             % vector of time levels
% parameters for functional iteration
toll     = 1e-4;
max_it   = 10000;
%
