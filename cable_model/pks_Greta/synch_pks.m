function [pks_normalized,number_pks] = synch_pks(t1,t2,synch_window,fs)
        %here t1 and t2 are the index of the vector of time.
        number_pks=0;
        
        for i=1:length(t1)
            for j=1:length(t2)
                if(abs(t1(i)-t2(j)) < (synch_window/2)/fs)
                  number_pks = number_pks +1;
                end
            end
        end
        
        pks_normalized=number_pks/(length(t1)*length(t2));
end
