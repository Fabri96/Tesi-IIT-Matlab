for i=1:100
    
[ F, c_v,  Fprob , Fprob_Corrected,   dAIC, dBIC  , chosen_x_lag, chosen_y_lag ] ...
          =  ...
         granger_cause_1(obs_activity_test_stress,stress_activity_test2, 0.05, i, 1, ...
                                      i, 1, 1,  ...
         'x', 'y' , 5 , 'd' ,'d', 'title' , 0 );

if(F>c_v)
    my_i = i;
end

    
end

for j=1:100
    
[ F, c_v,  Fprob , Fprob_Corrected,   dAIC, dBIC  , chosen_x_lag, chosen_y_lag ] ...
          =  ...
         granger_cause_1(obs_activity_test_stress,stress_activity_test2, 0.05, j, 0, ...
                                      j, 0, 1,  ...
         'x', 'y' , 5 , 'd' ,'d', 'title' , 0 );

if(F>c_v)
    my_j = j;
end

    
end