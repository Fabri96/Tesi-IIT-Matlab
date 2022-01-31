my_k=[];
for kk=60:10:300
    Granger_main;
    close all
    if(pval(1,2) < 0.2)
        my_k = [my_k kk];
    end
end