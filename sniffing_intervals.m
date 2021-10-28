
function sniff_intervals = sniffing_intervals(mouse,sniff)

if (strcmp(mouse,'stress'))
   
    indices = find(sniff(:,5) == 1);
end

if (strcmp(mouse,'neutral'))
   
    indices = find(sniff(:,6) == 1);
end

s_intervals = [0 0];

i = 1;
 out = 0;
while(out == 0)
    
if i >= size(indices,1)
    out =1;
    break;
end
if(indices(i+1)-indices(i) > 1)
    i = i+1;
else 
    a = indices(i);
    while(indices(i+1)-indices(i) == 1)
        i = i+1;
        if (i >= size(indices,1))
            break;
        end
    end


    b = indices(i);

    s_intervals = [s_intervals ; [ a ,b]];
end

end


s_intervals = s_intervals(2:end,:);
sniff_intervals = s_intervals;

for i = 1:size(s_intervals,1)
    
    for j = 1:size(s_intervals,2)

sniff_intervals(i,j) = sniff(s_intervals(i,j),1);

    end
end

% for i = 1 :size(sniff_intervals,1)
%     plot(sniff_intervals(i,:), [ 1 1] , 'r-o', 'Linewidth',5)
%     hold on
% end

