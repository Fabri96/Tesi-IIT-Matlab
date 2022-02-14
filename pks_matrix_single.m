function pks_mat_single = pks_matrix_single(data)


pks_mat_single = zeros(size(data,2)-1,size(data,2)-1);


synch_window = round(3);


for i = 1:size(pks_mat_single,2)
    [~,loc1] = findpeaks(data(:,i+1),data(:,1),...
    'MinPeakProminence',2*std(data(:,i+1)),'MinPeakDistance',2);
    for j = i:size(pks_mat_single,2)
        [~,loc2] = findpeaks(data(:,j+1),data(:,1),...
    'MinPeakProminence',2*std(data(:,j+1)),'MinPeakDistance',2);
        
        pks_mat_single(i,j) = synch_pks(loc1,loc2,synch_window);
        pks_mat_single(j,i) = pks_mat_single(i,j);
       if(i==28 && j==29)
           loc1
           loc2
       end
     
    end
end

pks_mat_single = pks_mat_single-diag(diag(pks_mat_single));
pks_mat_single=round(pks_mat_single*length(loc1));

