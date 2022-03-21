
figure
for i=1:22
    subplot(5,5,i)
    plot(V(i,:))
    title('Number' , num2str(i))
end

figure
for i=1:22
    subplot(5,5,i)
    plot(f(i,:))
    title('Number' , num2str(i))
end