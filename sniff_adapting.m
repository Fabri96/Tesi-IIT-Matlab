% Developed by Fabrizio Bernardi 

% ADAPT THE TIMES BASED ON A KEYBOARD
%  

if(dataset==1)

obs_ref = 1622.918908;

stress_ref = 1622.647908;

neutral_ref = 1619.536908;

minimum = min([ obs_ref stress_ref neutral_ref]);

delta_obs = obs_ref - minimum;

delta_stress = stress_ref - minimum;

delta_neutral = neutral_ref - minimum;

obs(24173:end,1) = obs(24173:end,1) - delta_obs;

stress(24096:end,1) = stress(24096:end,1) - delta_stress;

neutral(24173:end,1) = neutral(24173:end,1) - delta_neutral;

sniff=sniff(2:end,:);

sniff(1,:)=zeros(size(sniff,2),1);

sniff(:,1) = sniff(:,1) + minimum - sniff(10,1);

end

if(dataset==2)

    obs_ref = 1492.426908;

stress_ref = 1489.696908;

neutral_ref = 1.4895e+03;

minimum = min([ obs_ref stress_ref neutral_ref]);

delta_obs = obs_ref - minimum;

delta_stress = stress_ref - minimum;

delta_neutral = neutral_ref - minimum;

obs(24184:end,1) = obs(24184:end,1) - delta_obs;

stress(24190:end,1) = stress(24190:end,1) - delta_stress;

neutral(24152:end,1) = neutral(24152:end,1) - delta_neutral;

sniff=sniff(2:end,:);

sniff(1,:)=zeros(size(sniff,2),1);

sniff(:,1) = sniff(:,1) + minimum - sniff(9,1);


end


if(dataset==3)

obs_ref = 1419.228713;

stress_ref = 1417.568713;

neutral_ref = 1414.812713;

minimum = min([ obs_ref stress_ref neutral_ref]);

delta_obs = obs_ref - minimum;

delta_stress = stress_ref - minimum;

delta_neutral = neutral_ref - minimum;

obs(24198:end,1) = obs(24198:end,1) - delta_obs;

stress(24110:end,1) = stress(24110:end,1) - delta_stress;

neutral(24170:end,1) = neutral(24170:end,1) - delta_neutral;

sniff=sniff(2:end,:);

sniff(:,1) = sniff(:,1) + minimum - sniff(17,1);

end


if(dataset==4)

obs_ref = 1419.228713;

stress_ref = 1417.568713;

neutral_ref = 1414.812713;

minimum = min([ obs_ref stress_ref neutral_ref]);

delta_obs = obs_ref - minimum;

delta_stress = stress_ref - minimum;

delta_neutral = neutral_ref - minimum;

obs(24198:end,1) = obs(24198:end,1) - delta_obs;

stress(24110:end,1) = stress(24110:end,1) - delta_stress;

neutral(24170:end,1) = neutral(24170:end,1) - delta_neutral;

sniff=sniff(2:end,:);

sniff(:,1) = sniff(:,1) + minimum - sniff(17,1);

end


