clc,clear all, close all
cd('C:\Users\mna14\Desktop\acetowhitening margin');
folder='C:\Users\mna14\Desktop\acetowhitening margin\Norm_despec';

img=['norm_despeccervix3.tifnoComp300dpi.tif'];
fullfilename=fullfile(folder, img);
image=imread(fullfilename);
BW=image>0;
s = regionprops(BW,'BoundingBox');
subImage = image(round(s(1).BoundingBox(2):s(1).BoundingBox(2)+s(1).BoundingBox(4)),...
       round(s(1).BoundingBox(1):s(1).BoundingBox(1)+s(1).BoundingBox(3)));
figure;imshow(subImage)
%%
myfun = @(block_struct) ...
   uint8(mean2(block_struct.data));
I2=blockproc(subImage,[500 500],myfun);
 %%  show image
myfun = @(block_struct) ...
   uint8(mean2(block_struct.data)*...
   ones(size(block_struct.data)));
I3=blockproc(subImage,[500 500],myfun);
%% Centroid
myfun = @(block_struct) ...
   (regionprops(block_struct.data,'centroid'))
I3=blockproc(subImage,[500 500],myfun);

RGB = insertText(I3,position,I2,'AnchorPoint','LeftBottom');
figure;imshow(I3)
hold on

%%

%%
myfun=@(block_struct) correlate(block_struct.data);
I4=blockproc(subImage,[500 500],myfun);
%%
myfun=@(block_struct) homogeneity(block_struct.data);
I5=blockproc(subImage,[500 500],myfun);
%%
myfun=@(block_struct) contrast(block_struct.data);
I6=blockproc(subImage,[500 500],myfun);
%%
myfun=@(block_struct) energy(block_struct.data);
I7=blockproc(subImage,[500 500],myfun);
%%
size_mat=size(I5,2)*size(I5,1);
I5_2=reshape(I5', size_mat,1);

I6_2=reshape(I6',size_mat,1);
I7_2=reshape(I7', size_mat,1);

I4_2=reshape(I4',size_mat,1);
%%
%i4=correlate  i5=homo  i6=contrast  i7=energy
figure;plot(I4_2,I5_2,'o')
figure;plot(I4_2,I6_2,'o')
figure;plot(I4_2,I7_2,'o')
figure;plot(I5_2,I6_2,'o')
figure;plot(I5_2,I7_2,'o')
figure;plot(I6_2,I7_2,'o')