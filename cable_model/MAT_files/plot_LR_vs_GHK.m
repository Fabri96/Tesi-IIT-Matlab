load LR_200mm_20mv.mat
psi_20LR   = psi_mV;
load LR_200mm_40mv.mat
psi_40LR   = psi_mV;
load LR_200mm_60mv.mat
psi_60LR   = psi_mV;
load LR_200mm_80mv.mat
psi_80LR   = psi_mV;
load LR_200mm_100mv.mat
psi_100LR   = psi_mV;

figure
plot(xn_mm, psi_20LR(:, 200),'c-' ,xn_mm, psi_40LR(:, 200),'m-',...
   xn_mm, psi_60LR(:, 200),'g-', xn_mm, psi_80LR(:, 200),'b-', xn_mm, psi_100LR(:, 200),'r-' )
xlabel('x [mm]')
ylabel('V [mV]')
yline(-74,'k--','Linewidth',2)
title('Membrane pot. as a function of the length of the axon - LR')
legend('V_S = 20 mV', 'V_S = 40 mV', 'V_S = 60 mV', 'V_S = 80 mV', 'V_S = 100 mV','V_{eq}')
axis([0 200 -80 40])

load GHK_200mm_20mv.mat
psi_20GHK   = psi_mV;
load GHK_200mm_40mv.mat
psi_40GHK   = psi_mV;
load GHK_200mm_60mv.mat
psi_60GHK   = psi_mV;
load GHK_200mm_80mv.mat
psi_80GHK   = psi_mV;
load GHK_200mm_100mv.mat
psi_100GHK   = psi_mV;

figure
plot(xn_mm, psi_20GHK(:, 200),'c-' ,xn_mm, psi_40GHK(:, 200),'m-',...
   xn_mm, psi_60GHK(:, 200),'g-', xn_mm, psi_80GHK(:, 200),'b-', xn_mm, psi_100GHK(:, 200),'r-' )
xlabel('x [mm]')
ylabel('V [mV]')
yline(-73,'k--','Linewidth',2)
title('Membrane pot. as a function of the length of the axon - GHK')
legend('V_S = 20 mV', 'V_S = 40 mV', 'V_S = 60 mV', 'V_S = 80 mV', 'V_S = 100 mV','V_{eq}')
axis([0 200 -80 40])