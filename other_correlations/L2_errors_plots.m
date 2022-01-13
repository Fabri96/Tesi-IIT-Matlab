main;
close all

obs_activity_test_stress_norm = obs_activity_test_stress - mean(obs_activity_test_stress);

stress_activity_test2_norm = stress_activity_test2 - mean(stress_activity_test2);

obs_activity_test_neutral_norm = obs_activity_test_neutral - mean(obs_activity_test_neutral);

neutral_activity_test2_norm = neutral_activity_test2 - mean(neutral_activity_test2);

obs_activity_hab_stress_norm = obs_activity_hab_stress - mean(obs_activity_hab_stress);

obs_activity_hab_neutral_norm = obs_activity_hab_neutral - mean(obs_activity_hab_neutral);

stress_activity_hab2_norm = stress_activity_hab2 - mean(stress_activity_hab2);

neutral_activity_hab2_norm = neutral_activity_hab2 - mean(neutral_activity_hab2);


L2_errors.obs_stress_test.first = immse(obs_activity_test_stress_norm,stress_activity_test2_norm);

L2_errors.obs_neut_test.first  = immse(obs_activity_test_neutral_norm,neutral_activity_test2_norm);

L2_errors.obs_stress_hab.first  = immse(obs_activity_hab_stress_norm,stress_activity_hab2_norm);

L2_errors.obs_neut_hab.first  = immse(obs_activity_hab_neutral_norm,neutral_activity_hab2_norm);

main2;
close all

obs_activity_test_stress_norm = obs_activity_test_stress - mean(obs_activity_test_stress);

stress_activity_test2_norm = stress_activity_test2 - mean(stress_activity_test2);

obs_activity_test_neutral_norm = obs_activity_test_neutral - mean(obs_activity_test_neutral);

neutral_activity_test2_norm = neutral_activity_test2 - mean(neutral_activity_test2);

obs_activity_hab_stress_norm = obs_activity_hab_stress - mean(obs_activity_hab_stress);

obs_activity_hab_neutral_norm = obs_activity_hab_neutral - mean(obs_activity_hab_neutral);

stress_activity_hab2_norm = stress_activity_hab2 - mean(stress_activity_hab2);

neutral_activity_hab2_norm = neutral_activity_hab2 - mean(neutral_activity_hab2);

L2_errors.obs_stress_test.second = immse(obs_activity_test_stress_norm,stress_activity_test2_norm);

L2_errors.obs_neut_test.second  = immse(obs_activity_test_neutral_norm,neutral_activity_test2_norm);

L2_errors.obs_stress_hab.second  = immse(obs_activity_hab_stress_norm,stress_activity_hab2_norm);

L2_errors.obs_neut_hab.second  = immse(obs_activity_hab_neutral_norm,neutral_activity_hab2_norm);

main3;
close all

obs_activity_test_stress_norm = obs_activity_test_stress - mean(obs_activity_test_stress);

stress_activity_test2_norm = stress_activity_test2 - mean(stress_activity_test2);

obs_activity_test_neutral_norm = obs_activity_test_neutral - mean(obs_activity_test_neutral);

neutral_activity_test2_norm = neutral_activity_test2 - mean(neutral_activity_test2);

obs_activity_hab_stress_norm = obs_activity_hab_stress - mean(obs_activity_hab_stress);

obs_activity_hab_neutral_norm = obs_activity_hab_neutral - mean(obs_activity_hab_neutral);

stress_activity_hab2_norm = stress_activity_hab2 - mean(stress_activity_hab2);

neutral_activity_hab2_norm = neutral_activity_hab2 - mean(neutral_activity_hab2);

L2_errors.obs_stress_test.third = immse(obs_activity_test_stress_norm,stress_activity_test2_norm);

L2_errors.obs_neut_test.third  = immse(obs_activity_test_neutral_norm,neutral_activity_test2_norm);

L2_errors.obs_stress_hab.third  = immse(obs_activity_hab_stress_norm,stress_activity_hab2_norm);

L2_errors.obs_neut_hab.third  = immse(obs_activity_hab_neutral_norm,neutral_activity_hab2_norm);

main4;
close all

obs_activity_test_stress_norm = obs_activity_test_stress - mean(obs_activity_test_stress);

stress_activity_test2_norm = stress_activity_test2 - mean(stress_activity_test2);

obs_activity_test_neutral_norm = obs_activity_test_neutral - mean(obs_activity_test_neutral);

neutral_activity_test2_norm = neutral_activity_test2 - mean(neutral_activity_test2);

obs_activity_hab_stress_norm = obs_activity_hab_stress - mean(obs_activity_hab_stress);

obs_activity_hab_neutral_norm = obs_activity_hab_neutral - mean(obs_activity_hab_neutral);

stress_activity_hab2_norm = stress_activity_hab2 - mean(stress_activity_hab2);

neutral_activity_hab2_norm = neutral_activity_hab2 - mean(neutral_activity_hab2);

L2_errors.obs_stress_test.fourth = immse(obs_activity_test_stress_norm,stress_activity_test2_norm);

L2_errors.obs_neut_test.fourth  = immse(obs_activity_test_neutral_norm,neutral_activity_test2_norm);

L2_errors.obs_stress_hab.fourth  = immse(obs_activity_hab_stress_norm,stress_activity_hab2_norm);

L2_errors.obs_neut_hab.fourth  = immse(obs_activity_hab_neutral_norm,neutral_activity_hab2_norm);



figure

Y = [L2_errors.obs_stress_hab.first  L2_errors.obs_stress_test.first ;
    L2_errors.obs_stress_hab.second  L2_errors.obs_stress_test.second; 
    L2_errors.obs_stress_hab.third  L2_errors.obs_stress_test.third;
    L2_errors.obs_stress_hab.fourth  L2_errors.obs_stress_test.fourth];
bar(Y)

legend('habituation','test')
title('L^2 error between observer and stressed in different datasets')
set(gca,'FontSize',20)

figure

Y = [L2_errors.obs_neut_hab.first  L2_errors.obs_neut_test.first ;
    L2_errors.obs_neut_hab.second  L2_errors.obs_neut_test.second; 
    L2_errors.obs_neut_hab.third  L2_errors.obs_neut_test.third;
    L2_errors.obs_neut_hab.fourth  L2_errors.obs_neut_test.fourth];
bar(Y)

legend('habituation','test')
title('L^2 error between observer and neutral in different datasets')
set(gca,'FontSize',20)