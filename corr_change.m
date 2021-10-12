obs_hab_z = z_score_normalization(obs_hab);

correl_hab = corr(obs_hab_z(:,2:end));

correl_test = corr(obs_test_z(:,2:end));

correl = correl_test;

for i=1:size(correl_hab,1)
    
    for j=1:size(correl_hab,1)
        
        correl(i,j) =  (correl_test(i,j) - correl_hab(i,j))/correl_hab(i,j);
        
    end
end



heatmap(correl);

title('Change of correlation between habituation and test')