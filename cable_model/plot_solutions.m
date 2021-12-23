setfonts;
time_ms   = time*10^3;
xn_mm     = xn*10^3;
psi_mV    = psi_h*10^3;
% time evolution of the voltage stimulus
figure
plot(time_ms, V_stimulus*10^3, 'k--',time_ms, psi_mV(Nel/4,:),'c-' ,time_ms, psi_mV(Nel/2,:),'m-',...
   time_ms, psi_mV(end,:),'g-' )
xlabel('t [ms]')
ylabel('V(t) [mV]')
title('Voltage stimulus as a function of time')
legend('V_s(t)', '\psi_m(L/4,t)', '\psi_m(L/2,t)', '\psi_m(L,t)')
% three-dimensional plots y = y(x,t)
%
% membrane potential
[X,Y]       = meshgrid(xn_mm,time_ms);
figure;
s           = surf(X,Y,psi_mV'); 
s.EdgeColor = 'none';
colorbar
xlabel('$x [\textrm{mm}]$','Interpreter','latex')
ylabel('$t [\textrm{ms}]$','Interpreter','latex')
zlabel('$\psi_m(x,t) [\textrm{mV}]$','Interpreter','latex')
title('Membrane Potential')
axis('square');
% % longitudinal current
% figure;
% s           = surf(X,Y,I_h'); 
% s.EdgeColor = 'none';
% colorbar
% xlabel('$x [\textrm{mm}]$','Interpreter','latex')
% ylabel('$t [\textrm{ms}]$','Interpreter','latex')
% zlabel('$I_{in}(x,t) [\textrm{A}]$','Interpreter','latex')
% title('Longitudinal Current')
% axis('square');
% % ion transmembrane current densities
% figure;
% s           = surf(X,Y,J_Na'); 
% s.EdgeColor = 'none';
% colorbar
% xlabel('$x [\textrm{mm}]$','Interpreter','latex')
% ylabel('$t [\textrm{ms}]$','Interpreter','latex')
% zlabel('$J_{Na}(x,t) [\textrm{A} \, \textrm{m}^{2}]$','Interpreter','latex')
% title('Sodium Current Density')
% axis('square');
% %
% figure;
% s           = surf(X,Y,J_K'); 
% s.EdgeColor = 'none';
% colorbar
% xlabel('$x [\textrm{mm}]$','Interpreter','latex')
% ylabel('$t [\textrm{ms}]$','Interpreter','latex')
% zlabel('$J_{K}(x,t) [\textrm{A} \, \textrm{m}^{2}]$','Interpreter','latex')
% title('Potassium Current Density')
% axis('square');
% %
% figure;
% s           = surf(X,Y,J_Cl'); 
% s.EdgeColor = 'none';
% colorbar
% xlabel('$x [\textrm{mm}]$','Interpreter','latex')
% ylabel('$t [\textrm{ms}]$','Interpreter','latex')
% zlabel('$J_{Cl}(x,t) [\textrm{A} \, \textrm{m}^{2}]$','Interpreter','latex')
% title('Chlorine Current Density')
% axis('square');
% %
% figure;
% s           = surf(X,Y,J_cap'); 
% s.EdgeColor = 'none';
% colorbar
% xlabel('$x [\textrm{mm}]$','Interpreter','latex')
% ylabel('$t [\textrm{ms}]$','Interpreter','latex')
% zlabel('$J_{cap}(x,t) [\textrm{A} \, \textrm{m}^{2}]$','Interpreter','latex')
% title('Capacitive Current Density')
% axis('square');
%


if (imodel == 2)
   figure
   plot(time_ms(2:end), iter_nr, 'bo-')
   xlabel('time [ms]')
   title('# of fixed-point iterations at each time level')
end
