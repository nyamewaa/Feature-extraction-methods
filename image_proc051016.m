%%
data = xlsread('Imageprocessingdata.xlsx','Sheet5'); 
HSIL=data([1:24],:);
LSIL=data([25:36],:);
Normal=data([41:53],:);
%%hsil_contrast=[0.0172
0.05
0.0388
0.0674
0.0186
0.0196
0.0715
0.0527
0.0346
0.0428
0.0641
0.0322
0.0267
0.0298
0.017
0.013
0.0533
0.0826
0.0085
0.0085
0.0145
0.0119
0.0155
0.0215];
hsil_corr=[0.9984
0.9922
0.9965
0.9802
0.9981
0.9965
0.9923
0.9963
0.9968
0.9944
0.9914
0.997
0.9971
0.9972
0.9985
0.999
0.9929
0.9867
0.9899
0.9899
0.998
0.9983
0.9984
0.9944];
hsil_energy=[0.516
0.1624
0.3399
0.2072
0.2461
0.2273
0.2804
0.306
0.2872
0.2261
0.2298
0.4185
0.275
0.2169
0.1785
0.1814
0.2638
0.1409
0.8211
0.8211
0.412
0.2103
0.2357
0.2397];

hsil_homog=[0.9932
0.9755
0.9844
0.9696
0.9936
0.9927
0.9673
0.9761
0.9842
0.981
0.9689
0.9881
0.9874
0.986
0.9931
0.9952
0.9774
0.9606
0.9961
0.9961
0.9978
0.9949
0.9945
0.9931];

lsil_contrast=[0.0663
0.0613
0.0185
0.0375
0.0172
0.0124
0.0213
0.0137
0.0497
0.0332
0.0477
0.02];

lsil_corr=[0.9948
0.9922
0.9977
0.9962
0.9986
0.9985
0.9976
0.9985
0.9927
0.9967
0.9948
0.9961];

lsil_energy=[0.1556
0.3975
0.4804
0.1882
0.3353
0.2312
0.2681
0.2601
0.3226
0.3817
0.1835
0.1701];

lsil_homog=[0.9722
0.9732
0.9937
0.9814
0.9943
0.9948
0.9938
0.9941
0.9778
0.9871
0.9774
0.9923];

normal_contrast=[0.0198
0.0226
0.0118
0.0139
0.0228
0.0325
0.0428
0.0231
0.0469
0.0154
0.0181
0.0418
0.023];

normal_corr=[0.9977
0.9976
0.9982
0.9987
0.998
0.9968
0.9969
0.9979
0.9927
0.9985
0.9982
0.9955
0.9976];

normal_energy=[0.3063
0.2236
0.6162
0.4236
0.3539
0.3117
0.3239
0.3621
0.2542
0.4149
0.3378
0.2255
0.2528];

normal_homog=[0.992
0.9898
0.9964
0.995
0.9915
0.9851
0.9834
0.9912
0.9776
0.997
0.9926
0.9813
0.9913];
%%
hsil_r=HSIL(:,5);
hsil_g=HSIL(:,6);
hsil_b=HSIL(:,7);
lsil_r=LSIL(:,5);
lsil_g=LSIL(:,6);
lsil_b=LSIL(:,7);
Normal_r=Normal(:,5);
Normal_g=Normal(:,6);
Normal_b=Normal(:,7);
%%
figure
plot(hsil_contrast, hsil_corr,'ro',normal_contrast,normal_corr,'bs');
title('Correlation vs Contrast')
xlabel('Contrast')
ylabel('Correlation')
legend('HSIL','Normal')
figure
plot(hsil_contrast, hsil_energy,'ro',normal_contrast,normal_energy,'bs');
title('Energy vs Contrast')
xlabel('Contrast')
ylabel('Energy')
legend('HSIL','Normal')

figure
plot(hsil_contrast, hsil_homog,'ro',normal_contrast,normal_homog,'bs');
title('Homogeneity vs Contrast')
xlabel('Contrast')
ylabel('Homogeneity')
legend('HSIL','Normal')

figure
plot(hsil_corr, hsil_homog,'ro',normal_corr,normal_homog,'bs');
title('Homogeneity vs Correlation')
xlabel('Correlation')
ylabel('Homogeneity')
legend('HSIL','Normal')

figure
plot(hsil_corr, hsil_energy,'ro',normal_corr,normal_energy,'bs');
title('Energy vs Correlation')
xlabel('Correlation')
ylabel('Energy')
legend('HSIL','Normal')

figure
plot(hsil_homog, hsil_energy,'ro',normal_homog,normal_energy,'bs');
title('Energy vs Homogeneity')
xlabel('Homogeneity')
ylabel('Energy')
legend('HSIL','Normal')

%%
figure
plot3(hsil_corr,hsil_contrast,hsil_energy,'ro');hold on;
plot3(normal_corr,normal_contrast,normal_energy,'gs')
legend('HSIL','Normal')
grid on
title('Correlation, Contrast, Energy')
xlabel('Correlation')
ylabel('Contrast')
zlabel('Energy')

figure
plot3(hsil_corr,hsil_contrast,hsil_homog,'ro');hold on
plot3(normal_corr,normal_contrast,normal_homog,'gs')
legend('HSIL','Normal')
grid on
title('Correlation, Contrast, Homogeneity')
xlabel('Correlation')
ylabel('Contrast')
zlabel('Homogeneity')

figure
plot3(hsil_corr,hsil_homog,hsil_energy,'ro');hold on
plot3(normal_corr,normal_homog,normal_energy,'gs')
legend('HSIL','Normal')
grid on
title('Correlation, Homogeneity,Energy')
xlabel('Correlation')
ylabel('Homogeneity')
zlabel('Energy')

figure
plot3(hsil_contrast,hsil_homog,hsil_energy,'ro');hold on
plot3(normal_contrast,normal_homog,normal_energy,'gs')
legend('HSIL','Normal')
grid on
title('Contrast, Homogeneity,Energy')
xlabel('Contrast')
ylabel('Homogeneity')
zlabel('Energy')
%%
figure
plot3(hsil_r,hsil_g,hsil_b,'ro');hold on
plot3(Normal_r,Normal_g,Normal_b,'gs')
legend('HSIL','Normal')
grid on
title('Red, Green,Blue')
xlabel('Red')
ylabel('Green')
zlabel('Blue')
%%
figure
plot(hsil_r, hsil_contrast,'ro',Normal_r,normal_contrast,'bs');
title('Contrast vs Red')
xlabel('Red')
ylabel('Contrast')
legend('HSIL','Normal')
