phi_inv =@(x,p,k) (k.*x ./ (1-x)).^(1./p);
hold on
k=0.01;
x=[-0.2:0.01:1.2 ];
x=[0:0.01:1];
for p=1:20
    plot(x,phi_inv(x,k,p))
end