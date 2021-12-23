res=0,
for i=1:100
mi1 = mi_cont_cont(stress_activity_hab2, obs_activity_hab_stress,i);
mi2 = mi_cont_cont(obs_activity_test_stress, stress_activity_test2,i);
if(mi1<mi2)
    res=i;
end
end