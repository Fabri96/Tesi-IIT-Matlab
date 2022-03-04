function [CI]=function_correlation_index_300_def(event,fs,trial,cell);

[frame neuron] = size (event);
CI = NaN(neuron);
T = fs*frame; % tempo totale del segnale gcamp

for i=1:neuron-1 
    is.A=find(event(:,i)); % trovo posizione eventi nel neurone A
    N_A = length(is.A); % trovo numero eventi nel neurone A
    for k=i+1:neuron
         is.B=find(event(:,k)); % trovo posizione eventi nel neurone B
         N_B = length(is.B); % trovo posizione eventi nel neurone B
          
         % devo trovare il numero di spike in B che cadono in un intorno di
         % 300ms (150 ms prima e 150 ms dopo, quindi DeltaT = 0,150) rispetto allo spike in A, quindi al massimo in una casella
         % prima e in una casella dopo
         
         N_AB=0; %vado a contare N_AB --> sarà la somma delle coppie per ogni cella
         for j=2:frame-1
             nab=0;
             if event(j,i) == 1
                  if event(j,i) == event(j-1,k)
                      nab=nab+1;
                  end
                  if event(j,i) == event(j,k)
                      nab=nab+1;
                  end
                  if event(j,i) == event(j+1,k)
                      nab=nab+1;
                  end
             end
             N_AB = N_AB + nab;
         end
                 
               
         

         coeff = (N_AB*T)/(N_A*N_B*2*fs);
 
         
   
         % inserisco il valori nella matrice dei coefficienti che sarà
         % simmetrica perchè la correlazione tra i e k è la stessa che tra
         % k e i
         
         CI(i,k)= coeff;
         CI(k,i)= coeff;
    end
end

%     CI(isnan(CI))=0;

%     f=figure
%     set(f,'Units', 'normalized');
%     set(f,'Position', [0.05 0.08 0.9 0.8]);
%     heatmap(cell,cell,CI)
%     tit=strcat('Correlation index 300 ',trial);
%     title(tit)
%     tit=strcat(tit,'.jpg');
%     saveas(f,tit)
end
