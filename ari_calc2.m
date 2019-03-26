clc
clear all
blueabnormal=load('C:\Users\mna14\Desktop\Progress Reports\acetowhitening margin\Peru Lugol\Lugol\abnormal\train112016\blue.mat');
blue_ab_mean=blueabnormal.mean_img;
blue_ab_median=blueabnormal.median_img;
blue_ab_mode=blueabnormal.mode_img;
blue_ab_level=blueabnormal.level_lugol;
blue_ab_var=blueabnormal.var_img;

greenabnormal=load('C:\Users\mna14\Desktop\Progress Reports\acetowhitening margin\Peru Lugol\Lugol\abnormal\train112016\green.mat');
% green_ab_mean=greenabnormal.mean_img;
% green_ab_median=greenabnormal.median_img;
% green_ab_mode=greenabnormal.mode_img;
green_ab_level=greenabnormal.level_lugol;
% green_ab_var=greenabnormal.var_img;

% redabnormal=load('C:\Users\mna14\Desktop\Progress Reports\acetowhitening margin\Peru Lugol\Lugol\abnormal\train\red.mat');
% red_ab_mean=redabnormal.mean_img;
% red_ab_median=redabnormal.median_img;
% red_ab_mode=redabnormal.mode_img;
% red_ab_level=redabnormal.level_lugol;
% red_ab_var=redabnormal.var_img;
% 
% greyabnormal=load('C:\Users\mna14\Desktop\Progress Reports\acetowhitening margin\Peru Lugol\Lugol\abnormal\greyabnormal.mat');
% grey_ab_mean=greyabnormal.mean_img;
% grey_ab_median=greyabnormal.median_img;
% grey_ab_mode=greyabnormal.mode_img;
% grey_ab_level=greyabnormal.level_lugol;
% grey_ab_var=greyabnormal.var_img;


%%

bluenormal=load('C:\Users\mna14\Desktop\Progress Reports\acetowhitening margin\Peru Lugol\Lugol\normal\train112016\blue.mat');
blue_n_mean=bluenormal.mean_img;
blue_n_median=bluenormal.median_img;
blue_n_mode=bluenormal.mode_img;
blue_n_level=bluenormal.level_lugol;
blue_n_var=bluenormal.var_img;

greennormal=load('C:\Users\mna14\Desktop\Progress Reports\acetowhitening margin\Peru Lugol\Lugol\normal\train112016\green.mat');
% green_n_mean=greennormal.mean_img;
% green_n_median=greennormal.median_img;
% green_n_mode=greennormal.mode_img;
green_n_level=greennormal.level_lugol;
% green_n_var=greennormal.var_img;

% rednormal=load('C:\Users\mna14\Desktop\Progress Reports\acetowhitening margin\Peru Lugol\Lugol\normal\rednormal.mat');
% red_n_mean=rednormal.mean_img;
% red_n_median=rednormal.median_img;
% red_n_mode=rednormal.mode_img;
% red_n_level=rednormal.level_lugol;
% red_n_var=rednormal.var_img;
% 
% greynormal=load('C:\Users\mna14\Desktop\Progress Reports\acetowhitening margin\Peru Lugol\Lugol\normal\greynormal.mat');
% grey_n_mean=greynormal.mean_img;
% grey_n_median=greynormal.median_img;
% grey_n_mode=greynormal.mode_img;
% grey_n_level=greynormal.level_lugol;
% grey_n_var=greynormal.var_img;
%%
channel1='blue';
feature1='var';
channel2='green';
feature2='level';
normal1=eval([channel1,'_n_',feature1]);
abnormal1=eval([channel1,'_ab_',feature1]);
normal2=double(eval([channel2,'_n_',feature2]));
abnormal2=double(eval([channel2,'_ab_',feature2]));
%%
h0=double([abnormal1;abnormal2]');
h1=double([normal1;normal2]');
data=[h0;h1];
labels=ones(length(data),1);
labels(60:end)=2;
for i=1:500
[idx,C2]=kmeans(data,2);
adjrand_index(i)=ARI(idx,labels);
end
adjrand=mean(adjrand_index)

%filename = 'C:\Users\mna14\Desktop\Progress Reports\acetowhitening margin\Peru Lugol\Lugol\data.csv';
% delimiter = ',';
% startRow = 2;
% formatSpec = '%f%f%s%[^\n\r]';
% fileID = fopen(filename,'r');
% dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'HeaderLines' ,startRow-1, 'ReturnOnError', false);
% fclose(fileID);
% GreenThresholdLevel = dataArray{:, 1};
% BlueMode = dataArray{:, 2};
% Label = dataArray{:, 3};
% clearvars filename delimiter startRow formatSpec fileID dataArray ans;
%%
%labels=Label;
SVMStruct = svmtrain(data,labels,'ShowPlot',true);
title('SVM Classification of Normal and Abnormal VILI Images')
xlabel('Blue channel mode value')
ylabel('Green channel threshol value')
%%
SVMModel = fitcsvm(data,labels,'Standardize',true,'KernelFunction','RBF',...
    'KernelScale','auto');
CVSVMModel = crossval(SVMModel);
classLoss = kfoldLoss(CVSVMModel)
    %%
figure;
plot(h0(:,1),h0(:,2),'bo')
hold on
plot(h1(:,1),h1(:,2),'r+')
hold off
title('SVM Classification of Normal and Abnormal VILI Images')
xlabel('Blue channel mode value')
ylabel('Green channel threshol value')
%% Boxlot
figure;
x1=normal1;
x2=double(abnormal1);
x1=double(x1);
X = [x1 x2];
grp = [zeros(1,26),ones(1,59)];
boxplot(X,grp,'labels',{'Normal','Abormal'})
title('Normal vs Abnormal Data for green threshold(n=26, ab=59)')
ylabel('green threshold')
%%
[h,p]=ttest2(x1,x2)
%%
boxplot([x1, x2],'notch','on','labels',{'Normal'})
hold on 
boxplot([x2],'notch','on','labels',{'Abormal'})
title('Normal vs Abnormal Data for Blue mode (n=26, ab=59)')
ylabel('Green Channel Threshold')