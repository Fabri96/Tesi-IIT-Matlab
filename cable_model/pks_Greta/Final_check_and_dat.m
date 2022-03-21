%inserisci neuroni da controllare
%number neuron 1
n1=11;
%number neuron 2
n2=28;

%plot segnali
figure
plot(data(:,1), data(:,n1+1), 'r')
hold on
plot(data(:,1), data(:,n2+1), 'b')

%Plot of all signals with peaks
for i=1:size(index_pks_mat,1)
    if(index_pks_mat(i,n1) ~= 0 )
        plot(data(index_pks_mat(i,n1),1), data(index_pks_mat(i,n1),n1+1), 'or')
    end
    if(index_pks_mat(i,n2) ~= 0 )
        plot(data(index_pks_mat(i,n2),1), data(index_pks_mat(i,n2),n2+1), 'ob')
    end
end

%retrieve correleted peaks
[value_pks_1,time_pks_1] = findpeaks(data(:,n1+1),...
    'MinPeakHeight',mean(data(:,n1+1))+2*std(data(:,n1+1)),'MinPeakDistance',20, 'MinPeakProminence',0.15,'Annotate','extents'); 
[value_pks_2,time_pks_2] = findpeaks(data(:,n2+1),...
    'MinPeakHeight',mean(data(:,n2+1))+2*std(data(:,n2+1)),'MinPeakDistance',20, 'MinPeakProminence',0.15,'Annotate','extents'); 

times_and_peaks=[];
for i=1:length(time_pks_1)
    for j=1:length(time_pks_2)
        if(abs(time_pks_1(i)-time_pks_2(j)) < (synch_window/2)/fs)
          tmp=size(times_and_peaks,1)+1;
          times_and_peaks(tmp,1)=time_pks_1(i);
          times_and_peaks(tmp,2)=value_pks_1(i);
          times_and_peaks(tmp,3)=time_pks_2(j);
          times_and_peaks(tmp,4)=value_pks_2(j);
        end
    end
end

figure 
plot(data(times_and_peaks(:,1),1),times_and_peaks(:,2),'or',data(times_and_peaks(:,3),1),times_and_peaks(:,4),'ob')
title("Peaks correlated")
ylim([0,1.02])