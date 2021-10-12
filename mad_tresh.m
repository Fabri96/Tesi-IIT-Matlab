% Developed by Fabrizio Bernardi 

% MAD treshold on 2 columns matrix (times and activities)

function [mad_treshold,np,pn,times] = mad_tresh(data)


m = mad(data(:,2));

np=[];

pn =[];

d1 = data(:,1);

d2=data(:,2);

for i = 2:size(data,1)-1
    
    
    
    if(data(i-1,2) > data(i,2) && data(i+1,2) > data(i,2))
        
        np = [np i];
        
    end
    
    if(data(i-1,2) < data(i,2) && data(i+1,2) < data(i,2))
        
        pn = [pn i];
        
    end
    
end



for k = 1:size(pn,2)
    
    mad_treshold(k) = (m + d2(np(k)))/2;
    
end

for p =1:size(pn,2)
    times(p) = d1(pn(p));
end
    