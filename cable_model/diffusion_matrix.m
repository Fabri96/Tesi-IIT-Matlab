function Kd = diffusion_matrix(D, H, N)
% Kd = diffusion_matrix(D, H, N)
%
% D is a column vector of size equal to N, whose entry IE contains the value 
% of the diffusion coefficient D at the midpoint of IE, IE = 1, ..., N
% H is a column vector of size equal to N, whose entry IE contains the size of
% the element IE of the triangulation, IE = 1, ..., N
%
dim = N + 1;
%
for i = 1:dim
    if (i == 1)
		   Kd(1,1) = +D(1)/H(1);
			 Kd(1,2) = -D(1)/H(1);
		elseif (i == dim)
		   Kd(dim,dim)   = +D(N)/H(N);
			 Kd(dim,dim-1) = -D(N)/H(N);
		else
		   Kd(i,i-1) = -D(i-1)/H(i-1);
			 Kd(i,i)   = +D(i-1)/H(i-1) + D(i)/H(i);
			 Kd(i,i+1) = -D(i)/H(i);
		end
end
%
return
