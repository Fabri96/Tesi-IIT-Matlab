function d = compute_distance(neuron1,neuron2,mouse_data)

for i=1:length(mouse_data)
    if(mouse_data(i).name == neuron1)
        P1=[mouse_data(i).x mouse_data(i).y];
    end

    if(mouse_data(i).name == neuron2)
        P2=[mouse_data(i).x mouse_data(i).y];
    end
end

d=norm(P1-P2,2);

