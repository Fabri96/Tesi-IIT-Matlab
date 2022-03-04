function ang_dist= angular_distance(V1,V2)
% V1=V1-mean(V1);
% V2=V2-mean(V2);
num = V1'*V2;

den= norm(V1,2)*norm(V2,2);

% cos_dist= 1 -num/den;
ang_dist= acos(num/den)/pi;
end
