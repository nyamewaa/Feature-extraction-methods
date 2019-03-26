clc
clear all

greenCIN1=load('C:\Users\mna14\Desktop\Research\Cevix Image processing\Images\Peru\Peru Lugol\Lugol\CIN1\green.mat');
greenCIN1_level=greenCIN1.level_lugol;

greenCIN2=load('C:\Users\mna14\Desktop\Research\Cevix Image processing\Images\Peru\Peru Lugol\Lugol\CIN2\green.mat');
greenCIN2_level=greenCIN2.level_lugol;

greenCIN3=load('C:\Users\mna14\Desktop\Research\Cevix Image processing\Images\Peru\Peru Lugol\Lugol\CIN3\green.mat');
greenCIN3_level=greenCIN3.level_lugol;

greennormal=load('C:\Users\mna14\Desktop\Research\Cevix Image processing\Images\Peru\Peru Lugol\Lugol\normal\train112016\green.mat');
green_n_level=greennormal.level_lugol;

high_grade=[greenCIN2_level';greenCIN3_level']';
abnormal=[greenCIN1_level';high_grade']';
%%
normal=green_n_level;
abnormal=greenCIN1_level;
%%
h0=double([abnormal;abnormal]');
h1=double([normal;normal]');
data=[h0;h1];
labels=ones(length(data),1);
labels(29:end)=2;
for i=1:500
[idx,C2]=kmeans(data,2);
adjrand_index(i)=ARI(idx,labels);
end
adjrand=mean(adjrand_index)
%%
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