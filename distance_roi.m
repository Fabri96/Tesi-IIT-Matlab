D_stress = zeros(size(stress_roi_data,2),size(stress_roi_data,2));
        


for i = 1:size(stress_roi_data,2)
    
    P1 = [stress_roi_data(i).x stress_roi_data(i).y];
    
    for j = 1:size(stress_roi_data,2)
        
        P2 = [stress_roi_data(j).x stress_roi_data(j).y];
        
        D_stress(i,j) = norm(P1-P2);
        
    end
    
end

D_obs = zeros(size(obs_roi_data,2),size(obs_roi_data,2));
        


for i = 1:size(obs_roi_data,2)
    
    P1 = [obs_roi_data(i).x obs_roi_data(i).y];
    
    for j = 1:size(obs_roi_data,2)
        
        P2 = [obs_roi_data(j).x obs_roi_data(j).y];
        
        D_obs(i,j) = norm(P1-P2);
        
    end
    
end


D_neutral = zeros(size(neutral_roi_data,2), size(neutral_roi_data,2));
        


for i = 1:size(neutral_roi_data,2)
    
    P1 = [neutral_roi_data(i).x neutral_roi_data(i).y];
    
    for j = 1:size(neutral_roi_data,2)
        
        P2 = [neutral_roi_data(j).x neutral_roi_data(j).y];
        
        D_neutral(i,j) = norm(P1-P2);
        
    end
    
end