% Developed by Fabrizio Bernardi  

% Plots of the correlation matrices of neuron pairs using neurons_corr
% function

% dataset = 3; %select the dataset you are working on

close all
if(dataset ==1 || dataset ==3)

%     ad_test_zone = adapt_zone(test_zone, obs_activity_test);
% 
%     ad_hab_zone = adapt_zone(hab_zone,obs_activity_hab);
% 
%     [ left, right ,intermediate] = detect_areas(ad_test_zone);
% 
%     [ left2, right2 ,intermediate2] = detect_areas(ad_hab_zone);

    [aa,a]=neurons_corr(obs_test,stress_test,right,"stressed","test");

    [aa1,a1]=neurons_corr(obs_test,neutral_test,left,"neutral","test");

    [aa2,a2]=neurons_corr(obs_hab,stress_hab,right2,"stressed","habituation");

    [aa3,a3]=neurons_corr(obs_hab,neutral_hab,left2,"neutral","habituation");

    avg_stress_test= mean(aa(:));

    avg_neut_hab = mean(aa3(:));

    avg_neut_test = mean(aa1(:));

    avg_stress_hab = mean(aa2(:));
    [h_stress,p_stress] = ttest2(aa(:), aa2(:),'Vartype','unequal');

[h_neut,p_neut] = ttest2(aa1(:), aa3(:),'Vartype','unequal');

anov_stress = anova1([aa(:) aa2(:)]);
anov_neut = anova1([aa1(:) aa3(:)]);

end

if(dataset == 2)

%     ad_test_zone = adapt_zone(test_zone2, obs_activity_test);
% 
%     ad_hab_zone = adapt_zone(hab_zone2,obs_activity_hab);
% 
%     [ left, right ,intermediate] = detect_areas(ad_test_zone);
% 
%     [ left2, right2 ,intermediate2] = detect_areas(ad_hab_zone);

    [aa1,a1]=neurons_corr(obs_test,neutral_test,right,"neutral","test");

    [aa,a]=neurons_corr(obs_test,stress_test,left,"stressed","test");

    [aa2,a2]=neurons_corr(obs_hab,neutral_hab,right2,"neutral","habituation");

    [aa3,a3]=neurons_corr(obs_hab,stress_hab,left2,"stressed","habituation");

     avg_stress_test= mean(aa(:));

    avg_stress_hab = mean(aa3(:));

    avg_neut_test = mean(aa1(:));

    avg_neut_hab = mean(aa2(:));
    [h_stress,p_stress] = ttest2(aa(:), aa3(:),'Vartype','unequal');

[h_neut,p_neut] = ttest2(aa1(:), aa2(:),'Vartype','unequal');

anov_stress = anova1([aa(:) aa3(:)]);
anov_neut = anova1([aa1(:) aa2(:)]);

end


if(dataset == 4)

%     ad_test_zone = adapt_zone(test_zone, obs_activity_test);
% 
%     ad_hab_zone = adapt_zone(hab_zone,obs_activity_hab);
% 
%     [ left, right ,intermediate] = detect_areas(ad_test_zone);
% 
%     [ left2, right2 ,intermediate2] = detect_areas(ad_hab_zone);

    [aa1,a1]=neurons_corr(obs_test,neutral_test,right,"neutral","test");

    [aa,a]=neurons_corr(obs_test,stress_test,left,"stressed","test");

    [aa2,a2]=neurons_corr(obs_hab,neutral_hab,right2,"neutral","habituation");

    [aa3,a3]=neurons_corr(obs_hab,stress_hab,left2,"stressed","habituation");

    avg_stress_test= mean(aa(:));

    avg_stress_hab = mean(aa3(:));

    avg_neut_test = mean(aa1(:));

    avg_neut_hab = mean(aa2(:));

    [h_stress,p_stress] = ttest2(aa(:), aa3(:),'Vartype','unequal');

[h_neut,p_neut] = ttest2(aa1(:), aa2(:),'Vartype','unequal');
anov_stress = anova1([aa(:) aa3(:)]);
anov_neut = anova1([aa1(:) aa2(:)]);

end

aaa= categorical({'Habituation','Test'});

figure

plot(aaa, [avg_neut_hab avg_neut_test],'b--o',LineWidth=2,MarkerSize=15)

hold on

plot(aaa, [avg_stress_hab avg_stress_test],'r--o',LineWidth=2,MarkerSize=15)

legend('obs vs neutral', 'obs vs stress')

title('Average cc between neuronal pairs')

ylim([0 0.5])
set(gca,'FontSize',20)

anov_stress 
anov_neut
