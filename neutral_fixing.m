% Developed by Fabrizio Bernardi 

% Gives the neutral data from the broken data in experiment 2
% pairings is N x 2 matrix with the correspondences of the N neurons in the
% 2 files 



function [neutral_data2] = neutral_fixing(neutral_data_cage2, neutral_data_habtest2,pairings)

neutral_data_ht = neutral_data_habtest2;


for i = 1:size(pairings,2)
    
    if(pairings(2,i) == "")
        neutral_data_ht(:,i+1) = zeros(size(neutral_data_ht,1),1);
    else
                   
    k =find(neutral_data_habtest2(1,1:16) == " "+pairings(2,i));
    
    neutral_data_ht(:,i+1) = neutral_data_habtest2(:,k);
    
    end
end



neutral_data_ht(1,2:16) = neutral_data_cage2(1,2:16);
neutral_data_ht(1,17) = " C15";
neutral_data_cage2(1,17) = neutral_data_ht(1,17);
neutral_data_cage2(3:end,17) = zeros(size(neutral_data_cage2,1)-2,1);

neutral_data_cage2(2,2:17) = " accepted";

second_data=double(neutral_data_ht(3:end,1:17));
second_data(:,1) = second_data(:,1)+396.15;

neutral_data2 = [neutral_data_cage2(:,1:17) ; string(second_data)];



