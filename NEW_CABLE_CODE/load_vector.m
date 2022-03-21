function b = load_vector(f, H, N)
% b = load_vector(f, H, N)
%
% f is a column vector of size equal to N+1, whose entry j contains the value 
% of the production coefficient g at the j-th node of the triangulation, j = 1, ..., N+1
% H is a column vector of size equal to N, whose entry IE contains the size of
% the element IE of the triangulation, IE = 1, ..., N
%
% The trapezoidal quadrature rule is used to evaluate the load vector
dim = N + 1;
b   = zeros(dim, 1);
%
for i = 1:dim
    if (i == 1)
		   b(1) = f(1)*H(1)/2;
		elseif (i == dim)
		   b(dim) = f(dim)*H(N)/2;
		else
		   b(i) = f(i)*(H(i-1) + H(i))/2;
		end
end
%
return
