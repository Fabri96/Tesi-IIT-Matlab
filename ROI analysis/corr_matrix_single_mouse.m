% Developed by Fabrizio Bernardi 

% Correlation matrix for neurons of a mouse
% 
% INPUT --> matrix m of activity detection of one mouse, time
% interval dt to be considered for simultaneous activations
% 
% OUTPUT --> Correlation matrix 

function c_matrix= corr_matrix_single_mouse(m,dt,fs)

m = m(:,2:end);
c_matrix = zeros(size(m,2));

for i = 1:size(m,2)
    for j = i+1:size(m,2)

        N1=m(:,i);
        N2=m(:,j);

        c_matrix(i,j) = corr_index(N1,N2,dt,fs);
         c_matrix(j,i) = c_matrix(i,j);

    end
end