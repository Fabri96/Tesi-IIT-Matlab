function V = P0_to_P1_proj(v, H, Nel)
% L2-projection from the P0 space onto the P1 conforming space

% [v]   size(Nel,1): is the piecewise constant vector to be taken as input 
% [H]   size(Nel,1): is the set of point over which v is computed
% [Nel] size(1,1): is the number of element over which we want to compute V

dim      = Nel + 1;
V        = zeros(dim,1);
%
V(1)     = v(1);
for i = 2:dim-1
    V(i) = (v(i-1)*H(i-1) + v(i)*H(i))/(H(i-1) + H(i));
end
V(dim)   = v(end);
%
return
