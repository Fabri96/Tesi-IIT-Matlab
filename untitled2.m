
clear neutral_list obs_list stress_list neutral_list_hab obs_list_hab stress_list_hab

m_detector_obs = mad_detector(obs_activity_test);
m_detector_stress = mad_detector(stress_activity_test);
m_detector_neutral = mad_detector(neutral_activity_test);

m_detector_obs_hab = mad_detector(obs_activity_hab);
m_detector_stress_hab = mad_detector(stress_activity_hab);
m_detector_neutral_hab = mad_detector(neutral_activity_hab);

s = 5; 

t_test=obs_test(:,1);
t_hab=obs_hab(:,1);


times = obs_test(1:s:end,1);

times2 = obs_hab(1:s:end,1);

for j = 1:length(times)-1

     
        
        k1 = find(t_test == times(j));
        k2 = find(t_test == times(j+1));
        if(sum(m_detector_obs(k1:k2,2))>(s-2))
            obs_list(j).active=1;
            obs_list(j).interval=[times(j) , times(j+1)];
        else
            obs_list(j).active=0;
            obs_list(j).interval=[times(j) , times(j+1)];

        end

        if(sum(m_detector_neutral(k1:k2,2))>(s-3))
            neutral_list(j).active=1;
            neutral_list(j).interval=[times(j) , times(j+1)];
        else
            neutral_list(j).active=0;
            neutral_list(j).interval=[times(j) , times(j+1)];

        end

        if(sum(m_detector_stress(k1:k2,2))>(s-2))
            stress_list(j).active=1;
            stress_list(j).interval=[times(j) , times(j+1)];
        else
            stress_list(j).active=0;
            stress_list(j).interval=[times(j) , times(j+1)];

        end
        
    
end

for j = 1:length(times2)-1

     
        
        k1 = find(t_hab == times2(j));
        k2 = find(t_hab == times2(j+1));
        if(sum(m_detector_obs_hab(k1:k2,2))>(s-2))
            obs_list_hab(j).active=1;
            obs_list_hab(j).interval=[times2(j) , times2(j+1)];
        else
            obs_list_hab(j).active=0;
            obs_list_hab(j).interval=[times2(j) , times2(j+1)];

        end

        if(sum(m_detector_neutral_hab(k1:k2,2))>(s-3))
            neutral_list_hab(j).active=1;
            neutral_list_hab(j).interval=[times2(j) , times2(j+1)];
        else
            neutral_list_hab(j).active=0;
            neutral_list_hab(j).interval=[times2(j) , times2(j+1)];

        end

        if(sum(m_detector_stress_hab(k1:k2,2))>(s-2))
            stress_list_hab(j).active=1;
            stress_list_hab(j).interval=[times2(j) , times2(j+1)];
        else
            stress_list_hab(j).active=0;
            stress_list_hab(j).interval=[times2(j) , times2(j+1)];

        end
        
    
end




count1=0;

for i=2:length(times)-1

    if(obs_list(i).active==1 && stress_list(i).active==1 ...
            || obs_list(i).active==1 && stress_list(i-1).active==1 ...
            || obs_list(i).active==1 && stress_list(i+1).active==1)
        count1 = count1 +1;
    end
end

res=count1/(sum(m_detector_obs(:,2)) * sum(m_detector_stress(:,2)));

count2=0;

for i=2:length(times2)-2

    if(obs_list_hab(i).active==1 && stress_list_hab(i).active==1 ...
            || obs_list_hab(i).active==1 && stress_list_hab(i-1).active==1 ...
            || obs_list_hab(i).active==1 && stress_list_hab(i+1).active==1)
        count2 = count2 +1;
    end
end

res2=count2/(sum(m_detector_obs_hab(:,2)) * sum(m_detector_stress_hab(:,2)));


