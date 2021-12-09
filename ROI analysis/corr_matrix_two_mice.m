% Developed by Fabrizio Bernardi 

% Correlation matrix for neurons of two mice
% 
% INPUT --> matrix m1 of neurons activations in mouse1, matrix m2 of 
% neurons activations in mouse2, time
% interval dt to be considered for simultaneous activations
% 
% OUTPUT --> Correlation matrix 

function c_matrix= corr_matrix_two_mice(m1,m2,dt)


c_matrix = zeros(size(m1,1),size(m2,1));

for i = 1:size(m1,1)
    for j = 1:size(m2,1)

        N1=m1(i,:);
        N2=m2(j,:);

        c_matrix(i,j) = corr_index(N1,N2,dt);
         

    end
end