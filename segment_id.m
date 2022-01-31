function [segments,lengths]= segment_id(data)

for i=1:length(data)-1
    diff(i)=data(i+1)-data(i);
end

f=find(diff > 0.4);
segments{1}= data(1:f(1));
lengths(1)=f(1);
for k=2:length(f)
    segments{k} = data(f(k-1)+1:f(k));
    lengths(k)=f(k)-f(k-1);
end