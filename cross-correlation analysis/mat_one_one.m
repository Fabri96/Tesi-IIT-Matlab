data1=m1_post;
data2=m2_post;

c_corr_matrix = zeros(size(data1,2)-1,size(data2,2)-1);

for i = 1:size(c_corr_matrix,1)
    for j = 1:size(c_corr_matrix,2)
        
        [c,~] = xcorr(data1(:,i+1),data2(:,j+1),'normalized');
        c_corr_matrix(i,j) = max(abs(c));
      
        
    end
end
