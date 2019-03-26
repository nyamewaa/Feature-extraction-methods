%%
clc
clear all
data = xlsread('Imageprocessingdata_po_052416.xlsx','Sheet3'); 
HSIL=data([1:24],:);
%LSIL=data([25:36],:);
Normal=data([25:37],:);
%%hsil_contrast=[0.0172

%%
hsil_corr=HSIL(:,5);
hsil_contrast=HSIL(:,4);
hsil_energy=HSIL(:,6);
hsil_homog=HSIL(:,7);
hsil_r=HSIL(:,8);
hsil_g=HSIL(:,9);
hsil_b=HSIL(:,10);
% lsil_r=LSIL(:,5);
% lsil_g=LSIL(:,6);
% lsil_b=LSIL(:,7);
normal_corr=Normal(:,5);
normal_contrast=Normal(:,4);
normal_energy=Normal(:,6);
normal_homog=Normal(:,7);
Normal_r=Normal(:,8);
Normal_g=Normal(:,9);
Normal_b=Normal(:,10);

%%
figure
plot(hsil_contrast, hsil_corr,'ro',normal_contrast,normal_corr,'bs');
title('Correlation vs Contrast')
xlabel('Contrast')
ylabel('Correlation')
legend('HSIL','Normal')
%%
figure
plot(hsil_contrast, hsil_energy,'ro',normal_contrast,normal_energy,'bs');
title('Energy vs Contrast')
xlabel('Contrast')
ylabel('Energy')
legend('HSIL','Normal')
%%
figure
plot(hsil_contrast, hsil_homog,'ro',normal_contrast,normal_homog,'bs');
title('Homogeneity vs Contrast')
xlabel('Contrast')
ylabel('Homogeneity')
legend('HSIL','Normal')
%%
figure
plot(hsil_corr, hsil_homog,'ro',normal_corr,normal_homog,'bs');
title('Homogeneity vs Correlation')
xlabel('Correlation')
ylabel('Homogeneity')
legend('HSIL','Normal')
%%
figure
plot(hsil_corr, hsil_energy,'ro',normal_corr,normal_energy,'bs');
title('Energy vs Correlation')
xlabel('Correlation')
ylabel('Energy')
legend('HSIL','Normal')
%%
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
%%
figure
plot3(hsil_corr,hsil_contrast,hsil_homog,'ro');hold on
plot3(normal_corr,normal_contrast,normal_homog,'gs')
legend('HSIL','Normal')
grid on
title('Correlation, Contrast, Homogeneity')
xlabel('Correlation')
ylabel('Contrast')
zlabel('Homogeneity')
%%
figure
plot3(hsil_corr,hsil_homog,hsil_energy,'ro');hold on
plot3(normal_corr,normal_homog,normal_energy,'gs')
legend('HSIL','Normal')
grid on
title('Correlation, Homogeneity,Energy')
xlabel('Correlation')
ylabel('Homogeneity')
zlabel('Energy')
%%
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
%%
figure
plot(hsil_r, hsil_corr,'ro',Normal_r,normal_corr,'bs');
title('Correlation vs Red')
xlabel('Red')
ylabel('Correlation')
legend('HSIL','Normal')
%%
figure
plot(hsil_r, hsil_g,'ro',Normal_r,Normal_g,'bs');
title('Green vs Red')
xlabel('Red')
ylabel('Green')
legend('HSIL','Normal')
%%
figure
plot(hsil_r, hsil_b,'ro',Normal_r,Normal_b,'bs');
title('Blue vs Red')
xlabel('Red')
ylabel('Blue')
legend('HSIL','Normal')
%%
figure
plot(hsil_b, hsil_g,'ro',Normal_b,Normal_g,'bs');
title('Green vs Blue')
xlabel('Blue')
ylabel('Green')
legend('HSIL','Normal')