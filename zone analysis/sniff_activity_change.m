
function change = sniff_activity_change(mouse,sniff,activity)

sniff_intervals = sniffing_intervals(mouse,sniff);

starting_sniffs = sniff_intervals(:,1);

for i = 1:size(starting_sniffs,1)-1

k = find(activity(:,1) > starting_sniffs(i));

k = k(1);

prev = activity(k,2);

next = mean(activity((k+1):(k+100),2));

change(i) = (next-prev)/abs(prev);

end


