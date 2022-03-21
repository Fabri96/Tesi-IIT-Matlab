close all
phi = @(x,p,k) x.^p./(x.^p + k);
 x=[0:0.01:1];
 p=3;
 k=0.01;

  for p=1:2:20
     hold on
     plot(x,phi(x,p,k))
     ylim([0,1])
     legend
     axis('square')
  end
  
  phi_inv =@(x,p,k) (k.*x ./ (1-x)).^(1./p);
  x=[0:0.01:1];
 p=3;
 k=0.01;
 figure


  for p=1:2:20
     hold on
     plot(x,phi_inv(x,p,k))
     ylim([0,1])
     legend
     axis('square')
  end