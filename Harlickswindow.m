%cervix image processing file
clc;clear all; close all
%%
%Read in image
clc,clear all, close all
cd('C:\Users\mna14\Desktop\acetowhitening margin');
folder='C:\Users\mna14\Desktop\acetowhitening margin\windowimg';
img='Laligalugol.tif';
fullfilename=fullfile(folder, img);
image=imread(fullfilename);
image=image(:,:,1:3);
figure
imshow(image)                             
%% Remove specular reflection
de_spec=Remove_specular_refl(image);
grey_I=rgb2gray(de_spec);
imwrite(de_spec,['wind_despec',img],'Compression','none','Resolution',300);

%% Normalize Image
I2=gray_Normalization(grey_I);
imwrite(I2,['norm_wind_despec',img],'Compression','none','Resolution',300);
%% feature extraction with gray comatrix
glcms = graycomatrix(I2);
stats = graycoprops(glcms)
t1=struct2array(stats)
%% RGB image
clc,clear
for i = 1:53
    rgbImage=imread(['C:\Users\mna14\Desktop\acetowhitening margin\despec\despeccervix',num2str(i),'noComp300dpi.tif']);
    redPlane= rgbImage(:, :, 1);
    greenPlane = rgbImage(:, :, 2);
    bluePlane = rgbImage(:, :, 3);
    
    r_norm=gray_Normalization(redPlane);
    g_norm=gray_Normalization(greenPlane);
    b_norm=gray_Normalization(bluePlane);
    
    r_avg=mean(mean(r_norm));
    g_avg=mean(mean(g_norm));
    b_avg=mean(mean(b_norm));
    vals=[r_avg,g_avg,b_avg];
    xrange=['h',num2str(i+1)];
    xlswrite('Imageprocessingdata.xlsx',vals,'050516',xrange)
    
end

%%
data = xlsread('Imageprocessingdata.xlsx','Sheet5'); 
HSIL=data([1:24],:);
LSIL=data([25:36],:);
Normal=data([41:53],:);
%%
