function [Ca]=function_calcium_event_std(gcamp,n)
% calcium event: ho un evento calcio ogni volta che l'intensità del segnale supera la media di n volte la deviazione standard


[r c]=size(gcamp);
Ca.event = zeros(r,c);

for unit=1:c %scorro le colonne, quindi i neuroni
    % calcolo la soglia sopra la quale si ha evento calcio = n*std
    Ca.tresh(unit) = mean(gcamp(:,unit))+n*std(gcamp(:,unit));
    isEvent= find(gcamp(:,unit)>=Ca.tresh(unit));
    Ca.number(unit) = length(isEvent);
    % creo matrice con 1 e 0 a seconda se il segnale è sopra o sotto
    % soglia
    Ca.event(isEvent,unit)=1;

% calcolo ampiezza tra lo 0 e il picco dell'evento e salvo la media

for i = 1:size(isEvent)
    amp(i) = gcamp(isEvent(i));
end
    Ca.amplitude_mean(unit) = mean(amp);
    Ca.amplitude_std(unit) = std(amp);
%     f= figure
%     plot(gcamp(:,unit))
%     yline(tresh)  
%     saveas(f,strcat(string(unit),'.jpg'))

end
% calcolo frequenza di sparo 
   Ca.freq = sum(Ca.event)/size(gcamp,1);
end

