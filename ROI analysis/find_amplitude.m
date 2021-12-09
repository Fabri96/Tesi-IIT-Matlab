% Developed by Fabrizio Bernardi 

% Find the average amplitude of the Calcium signal in the given time
% interval, string for the mouse ('obs' / 'stress'/ 'neutral')
% 
% INPUT --> extrema t1 and t2 of interval, string of neuron to be
% investigated
% 
% OUTPUT -> amplitude

function amplitude = find_amplitude(t1,t2,neuron,roi_data)


    for i=1:length(roi_data)

        if(roi_data(i).name == neuron)
            index=i;
        end
    end

        i1=find(roi_data(index).times > t1);
        i1=i1(1);
        i2=find(roi_data(index).times > t2);
        i2=i2(1);
        
        amplitude = mean(roi_data(index).activity(i1:i2));


