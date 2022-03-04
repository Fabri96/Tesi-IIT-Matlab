function [event]=function_calcium_event(gcamp)
% calcium event: ho un evento calcio ogni volta che l'intensità del segnale supera la media di due volte la deviazione standard
% siccome i dati sono z scorati l'evento lo ho quando si supera 2

[r c]=size(gcamp);
event = zeros(r,c);

for unit=1:c %scorro le colonne, quindi i neuroni
    isEvent= find(gcamp(:,unit)>=2);
    event(isEvent,unit)=1;
end

end