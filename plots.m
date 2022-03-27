close all
phi = @(x,p,k) x.^p./(x.^p + k);
 x=[0:0.01:1];
 p=3;
 k=0.01;

  for p=2:2:20
     hold on
     plot(x,phi(x,p,k), DisplayName= "p = " + p)
     ylim([0,1])
     
     axis('square')
  end
 % legend('NumColumns',3)
  grid
  set(gca,'FontSize',15)
  ylabel ('\Delta F /F')
  xlabel ('AP')
  title ('\phi(x,p)')


  phi_inv =@(x,p,k) (k.*x ./ (1-x)).^(1./p);
  x=[0:0.01:1];
 p=3;
 k=0.01;
 figure


  for p=2:2:20
     hold on
     
     plot(x,phi_inv(x,p,k),DisplayName= "p = " + p)
     dim = [0.2 0.5 0.3 0.3];
%      str = { " p = " + p};
%      annotation('textbox',dim,'String',str,'FitBoxToText','on');
     ylim([0,1])
    
     axis('square')
  end

% legend('NumColumns',2)
  grid
  set(gca,'FontSize',15)
  xlabel ('\Delta F /F')
  ylabel ('AP')
  title ('\phi^{-1}(x,p)')