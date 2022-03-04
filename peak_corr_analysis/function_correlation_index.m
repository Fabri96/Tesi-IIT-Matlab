function []=function_correlation_index(event,fs,trial,cell)

[frame neuron] = size (event);
T = fs*frame; % tempo totale del segnale gcamp
CI = zeros(neuron);
n=1;
control=0;
for i=1:neuron-1
    is.A=find(event(:,i)); % trovo posizione eventi nel neurone A
    N_A = length(is.A); % trovo numero eventi nel neurone A
    for k=i+1:neuron
         is.B=find(event(:,k)); % trovo posizione eventi nel neurone B
         N_B = length(is.B); % trovo posizione eventi nel neurone B
         for j=1:frame
               if event(j,i) == 1 && event(j,k)==1
                 is.AB(n,1) = j; % trovo posizione eventi nel neurone A presenti anche nel neurone B 
                  n=n+1;
               else
                   control=control+1;
               end
               if control==frame
                   is.AB = [];
               end
         end
         n=1;
         N_AB = length(is.AB); % trovo numero eventi presenti contemporaneamente in A e in B
         % calcolo coeff di correlazione

         coeff = (N_AB*T)/(N_A*N_B*2*fs);
         CI(i,k)= coeff;
         CI(k,i)= coeff;
    end
    control=0;
    CI(isnan(CI))=0;
end
    f=figure
    set(f,'Units', 'normalized');
    set(f,'Position', [0.05 0.08 0.9 0.8]);
    heatmap(cell,cell,CI)
    tit=strcat('Correlation index 150',trial);
    title(tit)
    tit=strcat(tit,'.jpg');
    saveas(f,tit)
    
end