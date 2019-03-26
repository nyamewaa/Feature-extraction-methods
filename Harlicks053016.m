

%cervix image processing file
clc;clear all; close all
%%
%Read in image
clc,clear all, close all
cd('C:\Users\mna14\Desktop\acetowhitening margin');
folder='C:\Users\mna14\Desktop\acetowhitening margin\Norm_despec';

img=['norm_despeccervix33.tifnoComp300dpi.tif'];
fullfilename=fullfile(folder, img);
image=imread(fullfilename);
%%
%Select ROI
figure
figure1=imshow(image,[])
roi=imcrop;
figure
imshow(roi)
imwrite(roi,['cervix33_roilesion5',img]);                             

%% feature extraction with gray comatrix
glcms = graycomatrix(roi);
stats = graycoprops(glcms)
t1=struct2array(stats)
xrange=['d41'];
xlswrite('Imageprocessingdata_correction.xlsx',t1,'roi_061416',xrange)
%% 
roi_ind=find(roi);
gray_ave=mean(roi(roi_ind))
xrange=['h41'];
xlswrite('Imageprocessingdata_correction.xlsx',gray_ave,'roi_061416',xrange)



