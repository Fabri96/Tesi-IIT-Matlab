function number_pks = synch_pks(loc1,loc2,synch_window)

number_pks=0;

for i=1:length(loc1)
    for j=1:length(loc2)
        if(abs(loc1(i)-loc2(j)) < synch_window/2)
          number_pks = number_pks +1;
        end
    end
end

number_pks=number_pks/(length(loc1)*length(loc2));

number_pks = number_pks *100;