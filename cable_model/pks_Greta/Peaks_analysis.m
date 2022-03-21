% Developed by Fabrizio Bernardi  & Greta Fregiari

% Analysis of peaks for mouse "data"
data=m1_test;
% data=neutral_test;
%scelgo intervallo di tempo in cui devono essere i picchi vicini.
synch_window=round(2);

%matrice nXn che conterrà sincronizzazioni neuroni
pks_mat = zeros(size(data,2)-1,size(data,2)-1);
number_pks = zeros(size(data,2)-1,size(data,2)-1);
%matrice tempiXn che conterra in ogni colonna gli indici dei tempi con picchi
index_pks_mat=zeros(300,size(data,2)-1);

for i = 1:size(pks_mat,1)
    [value_pks_a,index_pks_a] = findpeaks(data(:,i+1),...
    'MinPeakHeight',mean(data(:,i+1))+2*std(data(:,i+1)),'MinPeakDistance',20, 'MinPeakProminence',0.15,'Annotate','extents'); 

    index_pks_mat(1:size(index_pks_a),i)=index_pks_a;
%     %plot dei picchi in ogni neurone
    figure
    plot(data(:,1), data(:,i+1),'-r', data(index_pks_a), value_pks_a, 'ob')
    title(strcat('Neuron ',string(i)))

    for j = i+1:size(pks_mat,2) %faccio partire da j=i+1, poichè matrice simmetrica e così ho diagonale zero.
        [value_pks_b,index_pks_b] = findpeaks(data(:,j+1),...
        'MinPeakHeight',mean(data(:,j+1))+2*std(data(:,j+1)),'MinPeakDistance',20,'MinPeakProminence',0.15,'Annotate','extents');

        [pks_mat(i,j),number_pks(i,j)] = synch_pks(index_pks_a,index_pks_b,synch_window,fs);  
        [pks_mat(j,i),number_pks(j,i)] = synch_pks(index_pks_a,index_pks_b,synch_window,fs);  
        
    end
end

figure
heatmap(number_pks)
title ("Number of correlated peaks")
figure
heatmap(pks_mat)
title("Weighted correlated peaks")
%findpeaks(data(:,8),'MinPeakHeight',mean(data(:,8))+std(data(:,8)),'MinPeakDistance',20,'MinPeakProminence',0.2,'Annotate','extents')
%plot(m1_test(:,1),m1_test(:,5), m1_test(:,1),m1_test(:,14))