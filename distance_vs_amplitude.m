for i=1:length(patterns)
    distance(i) = compute_distance(patterns{i}.previous(1),patterns{i}.next(1),obs_roi_data);
    amplitude(i) = abs(patterns{i}.amplitude_next(1) - patterns{i}.amplitude_previous(1));
    r(i)= distance(i)*patterns{i}.amplitude_previous(1)/patterns{i}.amplitude_next(1);
end

plot(distance,amplitude,'ro')
figure
plot(r,'b-o')