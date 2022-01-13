function cos_sim= cosine_similarity(V1,V2)

num = V1'*V2;

den= norm(V1,2)*norm(V2,2);

cos_sim=num/den;
end
