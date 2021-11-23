% Developed by Fabrizio Bernardi  

% Compute the correlation matrices based on pearson and cross correlation,
% 
% where every entry i and j represents the correlation between the signal 
% 
% of neuron i and the signal of neuron j, computed w.r.t the respective time
% 
% given in times (from the outputs of detect areas). 
% 
% In a second plot, a treshold is fixed and only the neurons above it are
% 
% classifed as exhibiting correlation



function [c_corr_matrix , p_corr_matrix] = neurons_corr(data1,data2,times,mouse,phase)


c_corr_matrix = zeros(size(data1,2)-1,size(data2,2)-1);

p_corr_matrix = zeros(size(data1,2)-1,size(data2,2)-1);



obs_test_stress(:,1) = times;

stress_test2(:,1) = times;

for j = 2:size(data1,2)

obs_test_stress(:,j) = interp1(data1(:,1),data1(:,j), times);

end

for j = 2:size(data2,2)

stress_test2(:,j) = interp1(data2(:,1),data2(:,j), times);

end




for i = 1:size(c_corr_matrix,1)
    for j = 1:size(c_corr_matrix,2)
        
        [c,~] = xcorr(obs_test_stress(:,i+1),stress_test2(:,j+1),'normalized');
        c_corr_matrix(i,j) = max(abs(c));
        p_corr_matrix(i,j) = corr(obs_test_stress(:,i+1),stress_test2(:,j+1));
        
    end
end

figure
% subplot(1,2,1)

% heatmap(c_corr_matrix)



% xlabel("Neurons of" + mouse + "during hab")
% ylabel('Neurons of observer during hab')
% title('Cross-correlation across neurons')

% subplot(1,2,2)
% 
% heatmap(p_corr_matrix)
% 
% xlabel('Neurons of stressed during test')
% ylabel('Neurons of observer during test')
% title('Pearson correlation across neurons')





a = double(c_corr_matrix > 0.6);

 sum(sum(a))/(size(a,1)*size(a,2))
heatmap(a)

xlabel("Neurons of " + mouse + " during " +  phase)
ylabel("Neurons of observer during " +  phase)
title('Neuron pairs presenting cross correlation')

% subplot(1,2,2)
% 
% b = double(p_corr_matrix > 0.3);
% heatmap(b)
