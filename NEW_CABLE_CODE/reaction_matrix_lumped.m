function Kr = reaction_matrix_lumped(s, H, N)
% Kr = reaction_matrix_lumped(s, H, N)
%
% s is a column vector of size equal to N+1, whose entry j contains the value 
% of the reaction coefficient r at the j-th node of the triangulation, j = 1, ..., N+1
% H is a column vector of size equal to N, whose entry IE contains the size of
% the element IE of the triangulation, IE = 1, ..., N
%
% The trapezoidal quadrature rule is used to evaluate the reaction matrix
%
dim = N + 1;
%
for i = 1:dim
    if (i == 1)
		   Kr(1,1) = s(1)*H(1)/2;
		elseif (i == dim)
		   Kr(dim,dim) = s(dim)*H(N)/2;
		else
			 Kr(i,i) = s(i)*(H(i-1) + H(i))/2; 
		end
end
%
return
