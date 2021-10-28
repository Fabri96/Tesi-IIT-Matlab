
function change = sniff_activity_change(mouse,sniff);

sniff_intervals = sniffing_intervals(mouse,sniff);

starting_sniffs = sniff_intervals(:,1);

for i = 1:size(starting_sniffs,1)-1

k = find(obs_activity_test(:,1) > starting_sniffs(i));

k = k(1);

prev = sum(obs_activity_test((k-100):(k-1),2));

next = sum(obs_activity_test((k+1):(k+100),2));

change(i) = (next-prev)/prev;

end



