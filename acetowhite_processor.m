%cervix image processing file
%%
clc,clear
%%
%Read 
% cd('C:\Users\mna14\Desktop\acetowhitening margin');
% folder='C:\Users\mna14\Desktop\acetowhitening margin\cerviximages';
% img='cervix1.png';
% fullfilename=fullfile(folder, img);
image=imread('W60.tif');
I=rgb2gray(image);
% %%
% %Crop image
% figure=imshow(rgb2gray(image),[])
% roi_cervix=impoly;
% wait(roi_cervix)
% BW=createMask(roi_cervix);
% mask=uint8(BW);
% cervix=image.*repmat(mask,[1,1,3]);
%                              
% %%
% %remove specular reflection
% de_spec=Remove_specular_refl(cervix);
% I=rgb2gray(de_spec);
% 
figure
imshow(I)

  %%
  %Feature extraction gabor
wavelength = [2:2:10];
orientation = [0:45:180];
% orientation = [1:15:180];
gaborArray = gabor(wavelength,orientation);
gaborMag = imgaborfilt(I,gaborArray);
%%
% subplot(3,3,1)
for p = 1:5
%     subplot(3,3,p)
%     imshow(gaborMag(:,:,p),[]);
    theta = gaborArray(p).Orientation;
    lambda = gaborArray(p).Wavelength;
%     title(sprintf('Orientation=%d, Wavelength=%d',theta,lambda));
    gab_image(:,:,p)=gaborMag(:,:,p);
end

p_image=sum(gab_image,3);
%%
figure
imagesc(p_image)
colormap('jet')
 colorbar
caxis([0 10000])

%%
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
%feature extraction with gray comatrix
glcms = graycomatrix(I);
