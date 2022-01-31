k=1;
for i=1:length(patterns)

 if(ismember("C30",patterns{i}.previous) && ismember("C31",patterns{i}.next) )  
     my_pair1{k} =  patterns{i};
     k=k+1;
 end

 if(ismember("C31",patterns{i}.previous) && ismember("C30",patterns{i}.next) )  
     my_pair2{k} =  patterns{i};
     k=k+1;
 end

end
a=[];
for i=1:length(my_pair1)
    for k=1:length(my_pair1{i}.previous)
        if(my_pair1{i}.previous(k) ~= "C30" )
            a= [a k];
        end
    end
    my_pair1{i}.previous(a)=[];
    my_pair1{i}.amplitude_previous(a)=[];
    a=[];
end

for i=1:length(my_pair1)
    prev(i)=my_pair1{i}.amplitude_previous;
    next(i)=my_pair1{i}.amplitude_next;
end

plot(prev,'r-o')
hold on
plot(next,'b-o')
legend('Neuron A [Ca]', 'Neuron B [Ca]')
