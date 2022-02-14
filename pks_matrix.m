function pks_mat = pks_matrix(data1,data2,times,fs)


pks_mat = zeros(size(data1,2)-1,size(data2,2)-1);


obs_test_stress(:,1) = times;

stress_test2(:,1) = times;

for j = 2:size(data1,2)

obs_test_stress(:,j) = interp1(data1(:,1),data1(:,j), times);

end

for j = 2:size(data2,2)

stress_test2(:,j) = interp1(data2(:,1),data2(:,j), times);

end

synch_window = round(1/fs);


for i = 1:size(pks_mat,1)
    [~,loc1] = findpeaks(obs_test_stress(:,i+1),...
    'MinPeakHeight',mean(obs_test_stress(:,i+1))+std(obs_test_stress(:,i+1)));
    for j = 1:size(pks_mat,2)
        [~,loc2] = findpeaks(stress_test2(:,j+1),...
    'MinPeakHeight',mean(stress_test2(:,j+1))+std(stress_test2(:,j+1)));
        
        pks_mat(i,j) = synch_pks(loc1,loc2,synch_window);
       
        
    end
end

