function M = mass_matrix(H, N)
%
dim = N + 1;
M   = sparse(dim,dim);
%
M(1,1) = H(1)/3;
M(1,2) = H(1)/6;
for ii = 2:dim-1
    M(ii,ii-1) = H(ii-1)/6;
    M(ii,ii)   = H(ii-1)/3 + H(ii)/3; 
    M(ii,ii+1) = H(ii)/6;
end   
M(end,end-1) = H(end)/6;
M(end,end)   = H(end)/3;
%
return
