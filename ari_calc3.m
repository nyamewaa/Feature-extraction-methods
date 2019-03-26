clc
clear all
%% abnormal all yellow
blue_aly=load('C:\Users\mna14\Desktop\Progress Reports\acetowhitening margin\Peru Lugol\Lugol\abnormal_all_yellow\segmented\blue.mat');
blue_aly_mean=blue_aly.mean_img;
blue_aly_median=blue_aly.median_img;
blue_aly_mode=blue_aly.mode_img;
blue_aly_level=blue_aly.level_lugol;
blue_aly_var=blue_aly.var_img;

green_aly=load('C:\Users\mna14\Desktop\Progress Reports\acetowhitening margin\Peru Lugol\Lugol\abnormal_all_yellow\segmented\green.mat');
green_aly_mean=green_aly.mean_img;
green_aly_median=green_aly.median_img;
green_aly_mode=green_aly.mode_img;
green_aly_level=green_aly.level_lugol;
green_aly_var=green_aly.var_img;

%% abnormal pink yellow brown
blue_apyb=load('C:\Users\mna14\Desktop\Progress Reports\acetowhitening margin\Peru Lugol\Lugol\abnormal_pink_yellow_brown\segmented\blue.mat');
blue_apyb_mean=blue_apyb.mean_img;
blue_apyb_median=blue_apyb.median_img;
blue_apyb_mode=blue_apyb.mode_img;
blue_apyb_level=blue_apyb.level_lugol;
blue_apyb_var=blue_apyb.var_img;

green_apyb=load('C:\Users\mna14\Desktop\Progress Reports\acetowhitening margin\Peru Lugol\Lugol\abnormal_pink_yellow_brown\segmented\green.mat');
green_apyb_mean=green_apyb.mean_img;
green_apyb_median=green_apyb.median_img;
green_apyb_mode=green_apyb.mode_img;
green_apyb_level=green_apyb.level_lugol;
greene_apyb_var=green_apyb.var_img;
%% abnormal yellow brown
blue_ayb=load('C:\Users\mna14\Desktop\Progress Reports\acetowhitening margin\Peru Lugol\Lugol\abnormal_yelow_brown\segmented\blue.mat');
blue_ayb_mean=blue_ayb.mean_img;
blue_ayb_median=blue_ayb.median_img;
blue_ayb_mode=blue_ayb.mode_img;
blue_ayb_level=blue_ayb.level_lugol;
blue_ayb_var=blue_ayb.var_img;

green_ayb=load('C:\Users\mna14\Desktop\Progress Reports\acetowhitening margin\Peru Lugol\Lugol\abnormal_yelow_brown\segmented\green.mat');
green_ayb_mean=green_ayb.mean_img;
green_ayb_median=green_ayb.median_img;
green_ayb_mode=green_ayb.mode_img;
green_ayb_level=green_ayb.level_lugol;
greene_ayb_var=green_ayb.var_img;

%% normal all brown
blue_nab=load('C:\Users\mna14\Desktop\Progress Reports\acetowhitening margin\Peru Lugol\Lugol\normal_all_brown\segmented\blue.mat');
blue_nab_mean=blue_nab.mean_img;
blue_nab_median=blue_nab.median_img;
blue_nab_mode=blue_nab.mode_img;
blue_nab_level=blue_nab.level_lugol;
blue_nab_var=blue_nab.var_img;

green_nab=load('C:\Users\mna14\Desktop\Progress Reports\acetowhitening margin\Peru Lugol\Lugol\normal_all_brown\segmented\green.mat');
green_nab_mean=green_nab.mean_img;
green_nab_median=green_nab.median_img;
green_nab_mode=green_nab.mode_img;
green_nab_level=green_nab.level_lugol;
greene_nab_var=green_nab.var_img;

%% normal all yellow
blue_nay=load('C:\Users\mna14\Desktop\Progress Reports\acetowhitening margin\Peru Lugol\Lugol\normal_all_yellow\segmented\blue.mat');
blue_nay_mean=blue_nay.mean_img;
blue_nay_median=blue_nay.median_img;
blue_nay_mode=blue_nay.mode_img;
blue_nay_level=blue_nay.level_lugol;
blue_nay_var=blue_nab.var_img;

green_nay=load('C:\Users\mna14\Desktop\Progress Reports\acetowhitening margin\Peru Lugol\Lugol\normal_all_yellow\segmented\green.mat');
green_nay_mean=green_nay.mean_img;
green_nay_median=green_nay.median_img;
green_nay_mode=green_nay.mode_img;
green_nay_level=green_nay.level_lugol;
greene_nay_var=green_nay.var_img;

%% normal with yellow
blue_nwy=load('C:\Users\mna14\Desktop\Progress Reports\acetowhitening margin\Peru Lugol\Lugol\normal_with_yellow\segmented\blue.mat');
blue_nwy_mean=blue_nwy.mean_img;
blue_nwy_median=blue_nwy.median_img;
blue_nwy_mode=blue_nwy.mode_img;
blue_nwy_level=blue_nwy.level_lugol;
blue_nwy_var=blue_nwy.var_img;

green_nwy=load('C:\Users\mna14\Desktop\Progress Reports\acetowhitening margin\Peru Lugol\Lugol\normal_with_yellow\segmented\green.mat');
green_nwy_mean=green_nwy.mean_img;
green_nwy_median=green_nwy.median_img;
green_nwy_mode=green_nwy.mode_img;
green_nwy_level=green_nwy.level_lugol;
greene_nwy_var=green_nwy.var_img;
%%
figure;
plot(blue_aly_mode,green_aly_level,'r*')
hold on
plot(blue_apyb_mode,green_apyb_level,'ro')
plot(blue_ayb_mode,green_ayb_level,'rx')
plot(blue_nab_mode,green_nab_level,'bo')
plot(blue_nay_mode,green_nay_level,'b*')
plot(blue_nwy_mode,green_nwy_level,'bx')
%%
figure;
plot3(blue_apyb_mode,blue_apyb_median,green_apyb_level,'ro')
hold on
% plot(blue_ayb_mode,green_ayb_level,'rx')
plot3(blue_nab_mode,blue_nab_median,green_nab_level,'bo')

%%
title('Blue Channel Mode vs Green Channel Threshold')
xlabel('Mode')
ylabel('Threshold')
legend('aly','apyb','ayb','nab','nay','nwy')
hold off

%%
channel1='blue';
feature1='mode';
channel2='green';
feature2='level';
normal1=eval([channel1,'_n_',feature1]);
abnormal1=eval([channel1,'_ab_',feature1]);
normal2=eval([channel2,'_n_',feature2]);
abnormal2=eval([channel2,'_ab_',feature2]);
%%
h0=double([abnormal1;abnormal2]');
h1=double([normal1;normal2]');
data=[h0;h1];
labels=ones(length(data),1);
labels(28:end)=2;
for i=1:500
[idx,C2]=kmeans(data,2);
adjrand_index(i)=ARI(idx,labels);
end
adjrand=mean(adjrand_index)
SVMStruct = svmtrain(data,labels,'ShowPlot',true);
%%
SVMModel = fitcsvm(data,labels,'Standardize',true,'KernelFunction','RBF',...
    'KernelScale','auto');
CVSVMModel = crossval(SVMModel);
classLoss = kfoldLoss(CVSVMModel)
    %%
figure;
plot(h0(:,1),h0(:,2),'o')
hold on
plot(h1(:,1),h1(:,2),'*')
hold off