% for i=2:size(stress_test,2)-1
%     subplot(7,8,i)
%     plot(stress_test(:,1),stress_test(:,i))
%     title('Neuron', num2str(i))
% 
% end




% for i=2:size(neutral_test,2)-1
%     subplot(4,4,i)
%     plot(neutral_test(:,1),neutral_test(:,i))
%     title('Neuron', num2str(i))
% 
% end

% for i=2:size(obs_test,2)
%     subplot(4,5,i)
%     plot(obs_test(:,1),obs_test(:,i))
%     title('Neuron', num2str(i))
% 
% end

for i=2:size(m1_test,2)
    subplot(6,6,i)
    plot(m1_test(:,1),m1_test(:,i))
    title('Neuron', num2str(i))

end