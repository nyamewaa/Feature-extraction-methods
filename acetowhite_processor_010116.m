%cervix image processing file
%%
%Read in image
clc,clear all, close all
cd('C:\Users\mna14\Desktop\acetowhitening margin');
folder='C:\Users\mna14\Desktop\acetowhitening margin\cerviximages';
img='4White_PCGen2_AA_WD_35mm_DUHS-C086-1noComp300dpi.tif';
fullfilename=fullfile(folder, img);
image=imread(fullfilename);
figure
imshow(image)
%%
%Crop image
figure
figure1=imshow(rgb2gray(image),[])
roi_cervix=impoly;
wait(roi_cervix);
BW=createMask(roi_cervix);
mask=uint8(BW);
cervix=image.*repmat(mask,[1,1,3]);
                             
%%
%remove specular reflection
de_spec=Remove_specular_refl(cervix);
I=rgb2gray(de_spec);
figure
imshow(de_spec)
% %%
%  %%
%  %feature extraction MSER
%   
%     figure
% %     subplot(2,1,1)
% %     imshow(de_spec)
%     regions = detectMSERFeatures((I),'ThresholdDelta', 0.1);
% %     subplot(2,1,2)
%    imshow(image); hold on;
%     plot(regions, 'showPixelList', true, 'showEllipses', false);
%     hold off
%     colorbar
%%
%Feature extraction using gabor filter
wavelength =[9;
% orientation = [0,45];
orientation = [0:10:180];
len=length(wavelength)*length(orientation);
gaborArray = gabor(wavelength,orientation);
gaborMag = imgaborfilt(I,gaborArray);
%%
% figure
%   subplot(2,2,1)
for p = 1:len
%         subplot(2,2,p)
%      imshow(gaborMag(:,:,p),[]);
    theta = gaborArray(p).Orientation;
    lambda = gaborArray(p).Wavelength;
%      title(sprintf('Orientation=%d, Wavelength=%d',theta,lambda));
    gab_image(:,:,p)=gaborMag(:,:,p);
end
 %%
p_image=sum(gab_image,3);
figure
imagesc(p_image)
colormap('jet')
 colorbar
caxis([0 10000])
% %%
% %feature extraction using entropy 
% J = entropyfilt(I); 
% imshow(I), figure, imshow(J,[]); 
% colormap('jet')
% colorbar
% %%
% %rangefilt
% cform = makecform('srgb2lab');
% LAB = applycform(image, cform);
/% imshow(I);
% figure, imshow(rLAB(:,:,1),[]);
% figure, imshow(rLAB(:,:,2),[]);
% figure, imshow(rLAB(:,:,3),[]);
% r_image=sum(rLAB,3);
% %%
% %using standard dev
% J = stdfilt(I); 
% imshow(I);
% figure, imshow(J,[]); 
% %%
% %feature extraction with gray comatrix
% glcms = graycomatrix(I);
% stats = graycoprops(glcms,properties)
%%
%overlaying image
% subplot(1,2,1)
% imshow(image)
% subplot(1,2,2)
figure
imshow(image)
% colorbar
hold on
h = imshow(p_image); 
colormap('jet')
% colorbar
caxis([0 3000])
hold off
set(h, 'AlphaData',rgb2gray(cervix))
set(gcf, 'Position', get(0,'Screensize'));
%%

