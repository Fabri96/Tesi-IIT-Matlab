v1=c_matrix_stress_test(:);
v1=v1(v1~=0);

v2=c_matrix_stress_cage(:);
v2=v2(v2~=0);

% v2=c_matrix_stress_hab(:);
% v2=v2(v2~=0);


[h,p] = ttest2(v1,v2,'Vartype','unequal')