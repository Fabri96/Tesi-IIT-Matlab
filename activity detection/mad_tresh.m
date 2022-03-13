% Developed by Fabrizio Bernardi 

% MAD treshold algorithm on 2 columns matrix (times and activities)

function [mad_treshold,times] = mad_tresh(data)


m = mad(data(:,2));

np=[]; % from negative to positive vector

pn =[]; % from positive to negative vector

d1 = data(:,1); % first column (times)

d2 = data(:,2); % second column (activities)

for i = 2:size(data,1)-1
        
    
    if(data(i-1,2) > data(i,2) && data(i+1,2) > data(i,2)) 
        
        np = [np i]; % add time stamp where slope goes n-->p
        
    end
    
    if(data(i-1,2) < data(i,2) && data(i+1,2) < data(i,2))
        
        pn = [pn i]; % add time stamp where slope goes p-->n
        
    end
    
end

mm= min(size(pn,2),size(np,2));

for k = 1:mm
    
    mad_treshold(k) = (m + d2(np(k)))/1.5; % /3 to have it smaller
    
end

for p =1:mm
    times(p) = d1(pn(p));
end
    