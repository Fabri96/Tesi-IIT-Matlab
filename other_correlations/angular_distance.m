function ang_dist= angular_distance(V1,V2)

num = V1'*V2;

den= norm(V1,2)*norm(V2,2);

% cos_dist= 1 -num/den;
ang_dist= acos(num/den)/pi;
end