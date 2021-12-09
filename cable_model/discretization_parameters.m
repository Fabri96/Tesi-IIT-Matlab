% Left and right boundaries of Omega
xL       = 0;                             % Axon left coordinate 
xR       = L;                             % Axon length ([] = m)
% Spatial discretization parameters
Nel      = 100;                           % number of elements
dim      = Nel+1;
xn       = linspace(xL, xR, dim)';        % vertices
xcm      = (xn(1:end-1) + xn(2:end))/2;   % centers of mass
xx       = [];
for ie = 1:Nel
    xx = [xx; xn(ie); xn(ie+1)];
end
%
H        = diff(xn);                      % element sizes
% Time discretization parameters
NT       = 100;                          % number of time intervals
dimt     = NT+1;                           
dt       = (tend-tstart)/NT;              % time step  ( [] = s)
time     = [tstart:dt:tend];              % vector of time levels
% parameters for functional iteration
toll     = 1e-10;
max_it   = 10000;
%
