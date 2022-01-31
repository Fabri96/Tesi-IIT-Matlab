function num_seg = compute_num_seg(time,lengths,fs)
time=time/fs;
for i=1:length(lengths)
    if(sum(lengths(1:i))>time)
        num_seg = i;
        break;
    end
end

