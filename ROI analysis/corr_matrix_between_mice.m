% Developed by Fabrizio Bernardi 

% Correlation matrix for neurons of a mice
% 
% INPUT --> matrix m of activity detection of one mouse, time
% interval dt to be considered for simultaneous activations
% 
% OUTPUT --> Correlation matrix between different mice

function c_matrix= corr_matrix_between_mice(m1,m2,dt)

m1 = m1(:,2:end);
m2 = m2(:,2:end);

c_matrix = zeros(size(m1,2),size(m2,2));

for i = 1:size(m1,2)
    for j = 1:size(m2,2)

        N1=m1(:,i);
        N2=m2(:,j);

        c_matrix(i,j) = corr_index(N1,N2,dt);
        

    end
end