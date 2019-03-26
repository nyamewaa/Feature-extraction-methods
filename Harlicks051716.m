%cervix image processing file
clc;clear all; close all
%%
%Read in image
clc,clear all, close all
cd('C:\Users\mna14\Desktop\acetowhitening margin');
folder='C:\Users\mna14\Desktop\acetowhitening margin\Norm_despec';

img=['norm_despeccervix3.pngnoComp300dpi.tif'];
fullfilename=fullfile(folder, img);
image=imread(fullfilename);
%%
%Select ROI
figure
figure1=imshow(image,[])
roi_cervix=impoly;
wait(roi_cervix);
BW=createMask(roi_cervix);
mask=uint8(BW);
roi=image.*mask;
figure
imshow(roi)
% imwrite(cervix,['LO_Segmented image',img]);                             

%% feature extraction with gray comatrix
glcms = graycomatrix(roi);
stats = graycoprops(glcms)
t1=struct2array(stats)
xrange=['d21'];
xlswrite('Imageprocessingdata_correction.xlsx',t1,'roi',xrange)



