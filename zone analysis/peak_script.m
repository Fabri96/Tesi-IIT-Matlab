m_detector_neutral = mad_detector(neutral_test);

m_detector_neutral_hab = mad_detector(neutral_hab);

m_detector_obs = mad_detector(obs_test);

m_detector_obs_hab = mad_detector(obs_hab);

m_detector_stress = mad_detector(stress_test);

m_detector_stress_hab = mad_detector(stress_hab);

% m_detector_neutral_short=zeros(round(size(m_detector_neutral,1))/step,...
%     size(m_detector_neutral,2) );
step=5;
clear m_detector_neutral_short
aa=m_detector_neutral(1:step:end,1);
m_detector_neutral_short (:,1) = aa;
bb=1:step:size(m_detector_neutral,1);
p=1;
for i=1:1:length(bb)-1
    for j =2:size(m_detector_neutral,2)-1
        if (sum(m_detector_neutral([bb(i) :bb(i+1)],j)) > step-2)
            m_detector_neutral_short (i,j) =1;
            
        else
           m_detector_neutral_short (i,j) =0; 
           
        end
    end
end


clear m_detector_stress_short aa bb
aa=m_detector_stress(1:step:end,1);
m_detector_stress_short (:,1) = aa;
bb=1:step:size(m_detector_stress,1);
p=1;
for i=1:1:length(bb)-1
    for j =2:size(m_detector_stress,2)-1
        if (sum(m_detector_stress([bb(i) :bb(i+1)],j)) > step-2)
            m_detector_stress_short (i,j) =1;
            
        else
           m_detector_stress_short (i,j) =0; 
           
        end
    end
end

clear m_detector_obs_short aa bb
aa=m_detector_obs(1:step:end,1);
m_detector_obs_short (:,1) = aa;
bb=1:step:size(m_detector_obs,1);
p=1;
for i=1:1:length(bb)-1
    for j =2:size(m_detector_obs,2)-1
        if (sum(m_detector_obs([bb(i) :bb(i+1)],j)) > step-2)
            m_detector_obs_short (i,j) =1;
            
        else
           m_detector_obs_short (i,j) =0; 
           
        end
    end
end

clear m_detector_neutral_short_hab aa bb
aa=m_detector_neutral_hab(1:step:end,1);
m_detector_neutral_short_hab (:,1) = aa;
bb=1:step:size(m_detector_neutral_hab,1);
p=1;
for i=1:1:length(bb)-1
    for j =2:size(m_detector_neutral_hab,2)-1
        if (sum(m_detector_neutral_hab([bb(i) :bb(i+1)],j)) > step-2)
            m_detector_neutral_short_hab (i,j) =1;
            
        else
           m_detector_neutral_short_hab (i,j) =0; 
           
        end
    end
end


clear m_detector_stress_short_hab aa bb
aa=m_detector_stress_hab(1:step:end,1);
m_detector_stress_short_hab (:,1) = aa;
bb=1:step:size(m_detector_stress_hab,1);
p=1;
for i=1:1:length(bb)-1
    for j =2:size(m_detector_stress_hab,2)-1
        if (sum(m_detector_stress_hab([bb(i) :bb(i+1)],j)) > step-2)
            m_detector_stress_short_hab (i,j) =1;
            
        else
           m_detector_stress_short_hab (i,j) =0; 
           
        end
    end
end

clear m_detector_obs_short_hab aa bb
aa=m_detector_obs_hab(1:step:end,1);
m_detector_obs_short_hab (:,1) = aa;
bb=1:step:size(m_detector_obs_hab,1);
p=1;
for i=1:1:length(bb)-1
    for j =2:size(m_detector_obs_hab,2)-1
        if (sum(m_detector_obs_hab([bb(i) :bb(i+1)],j)) > step-2)
            m_detector_obs_short_hab (i,j) =1;
            
        else
           m_detector_obs_short_hab (i,j) =0; 
           
        end
    end
end

[ left, right ,intermediate] = detect_areas(ad_test_zone);

t = obs_test(1:step:end,1);
stress_t = [];

for i=1:length(right)
    i_stress = find(right(i)>t);
    i_stress = i_stress(end);
    stress_t = [stress_t i_stress];
end

 stress_t = unique(stress_t);  
 stress_t = stress_t(1:end-1);


neutral_t = [];

for i=1:length(left)
    i_neutral = find(left(i)>t);
    i_neutral = i_neutral(end);
    neutral_t = [neutral_t i_neutral];
end

 neutral_t = unique(neutral_t);  
 neutral_t = neutral_t(1:end-1);

 [ left2, right2 ,intermediate2] = detect_areas(ad_hab_zone);

t = obs_hab(1:step:end,1);
stress_t_hab = [];

for i=1:length(right2)
    i_stress = find(right2(i)>t);
    i_stress = i_stress(end);
    stress_t_hab = [stress_t_hab i_stress];
end

 stress_t_hab = unique(stress_t_hab);  
 stress_t_hab = stress_t_hab(1:end-1);


neutral_t_hab = [];

for i=1:length(left2)
    i_neutral = find(left2(i)>=t);
    i_neutral = i_neutral(end);
    neutral_t_hab = [neutral_t_hab i_neutral];
end

 neutral_t_hab = unique(neutral_t_hab);  
 neutral_t_hab = neutral_t_hab(1:end-1);

 if(dataset==1 || dataset==3)
A_obs_stress = m_detector_obs_short(stress_t,:);
AA_stress = m_detector_stress_short(stress_t,:);
A_obs_neutral = m_detector_obs_short(neutral_t,:);
AA_neutral = m_detector_neutral_short(neutral_t,:);

A_obs_stress_hab = m_detector_obs_short_hab(stress_t_hab,:);
A_stress_hab = m_detector_stress_short_hab(stress_t_hab,:);
A_obs_neutral_hab = m_detector_obs_short_hab(neutral_t_hab,:);
A_neutral_hab = m_detector_neutral_short_hab(neutral_t_hab,:);
else
A_obs_stress = m_detector_obs_short(neutral_t,:);
AA_stress = m_detector_stress_short(neutral_t,:);
A_obs_neutral = m_detector_obs_short(stress_t,:);
AA_neutral = m_detector_neutral_short(stress_t,:);

A_obs_stress_hab = m_detector_obs_short_hab(neutral_t_hab,:);
A_stress_hab = m_detector_stress_short_hab(neutral_t_hab,:);
A_obs_neutral_hab = m_detector_obs_short_hab(stress_t_hab,:);
A_neutral_hab = m_detector_neutral_short_hab(stress_t_hab,:);
end