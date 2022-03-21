function [am, bm, an, bn, ah, bh] = HHgating_coeff(V)
%----------------------------------------------------------------------------
% Authors: R.Sacco
% This function calculates the gating coefficients in the Hodgkin-Huxley model

% gating variable rates ([] = ms^{-1})
% N.B.: V = V_m - V_eq ([] = mV)
%----------------------------------------------------------------------------
[bpl, bmin] = bern((25-V)/10);
am          = bpl;
bm          = 4*exp(-V/18);
%
[bpl, bmin] = bern((10-V)/10);
an          = 0.1*bpl;
bn          = 0.125*exp(-V/80);
%
ah          = 0.07*exp(-V/20);
bh          = 1/(exp((30-V)/10)+1);
%
return
