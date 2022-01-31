pair_mat=zeros(size(stress_roi_data,2));
for i=1:size(stress_roi_data,2)
    for j=1:size(stress_roi_data,2)
        first = stress_roi_data(i).name;
        second = stress_roi_data(j).name;
        for k=1:length(patterns)
        if(ismember(first,patterns{k}.previous) &&...
                ismember(second,patterns{k}.next)   ||...
                ismember(first,patterns{k}.next) &&...
                ismember(second,patterns{k}.previous) )
            pair_mat(i,j) = pair_mat(i,j)+1;
        end
        end
    end
end
