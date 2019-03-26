clc,clear all, close all
cd('C:\Users\mna14\Desktop\acetowhitening margin');
folder='C:\Users\mna14\Desktop\acetowhitening margin';

img=['norm_wind_despeccervix2.tif'];
fullfilename=fullfile(folder, img);
image=imread(fullfilename);
%% MEAN PIXEL VALUE
myfun = @(block_struct) ...
   uint8(mean2(block_struct.data));
I2_a=blockproc(image,[100 100],myfun);
size_mat=size(I2_a,2)*size(I2_a,1);
I2_array=reshape(I2_a',size_mat,1);
 %%  
myfun = @(block_struct) ...
   uint8(mean2(block_struct.data)*...
   ones(size(block_struct.data)));
[I2,r,c]=blockproc_with_loc(image,[100 100],myfun);

r_array=reshape(r',size_mat,1);
c_array=reshape(c',size_mat,1);
%%
position=cat(2,c_array,r_array);
%%
RGB = insertText(image,position,I2_array,'FontSize',30);
figure
imshow(RGB),title('Numeric values');

%% CORRELATE
myfun = @(block_struct) ...
   uint8(correlate(block_struct.data));
I3_a=blockproc(image,[100 100],myfun);
size_mat=size(I3_a,2)*size(I3_a,1);
I3_array=reshape(I3_a',size_mat,1);
 %%  
myfun = @(block_struct) ...
   uint8(correlate(block_struct.data)*...
   ones(size(block_struct.data)));
[I3,r,c]=blockproc_with_loc(image,[100 100],myfun);

r_array=reshape(r',size_mat,1);
c_array=reshape(c',size_mat,1);
%%
position=cat(2,c_array,r_array);
%%
RGB = insertText(image,position,I3_array,'FontSize',30);
figure
imshow(RGB),title('Numeric values');

%% HOMOGENEITY
myfun = @(block_struct) ...
   uint8(homogeneity(block_struct.data));
I4_a=blockproc(image,[100 100],myfun);
size_mat=size(I4_a,2)*size(I4_a,1);
I4_array=reshape(I4_a',size_mat,1);
 %%  
myfun = @(block_struct) ...
   uint8(homogeneity(block_struct.data)*...
   ones(size(block_struct.data)));
[I4,r,c]=blockproc_with_loc(image,[100 100],myfun);

r_array=reshape(r',size_mat,1);
c_array=reshape(c',size_mat,1);
%%
position=cat(2,c_array,r_array);
%%
RGB = insertText(image,position,I4_array,'FontSize',30);
figure
imshow(RGB),title('Numeric values');

%% CONTRAST
myfun=@(block_struct) contrast(block_struct.data);
I5=blockproc(subImage,[100 100],myfun);

myfun = @(block_struct) ...
   uint8(contrast(block_struct.data));
I5_a=blockproc(image,[100 100],myfun);
size_mat=size(I5_a,2)*size(I5_a,1);
I5_array=reshape(I5_a',size_mat,1);
 %%  
myfun = @(block_struct) ...
   uint8(contrast(block_struct.data)*...
   ones(size(block_struct.data)));
[I5,r,c]=blockproc_with_loc(image,[100 100],myfun);

r_array=reshape(r',size_mat,1);
c_array=reshape(c',size_mat,1);
%%
position=cat(2,c_array,r_array);
%%
RGB = insertText(image,position,I5_array,'FontSize',30);
figure
imshow(RGB),title('Numeric values');

%%
myfun=@(block_struct) energy(block_struct.data);
I6=blockproc(subImage,[100 100],myfun);


%%
size_mat=size(I3,2)*size(I3,1);
I2_2=reshape(I2',size_mat,1);
I3_2=reshape(I3',size_mat,1);
I4_2=reshape(I4',size_mat,1);
I5_2=reshape(I5', size_mat,1);  
I6_2=reshape(I6',size_mat,1);
I7_2=reshape(I7', size_mat,1);


%%
%i4=correlate  i5=homo  i6=contrast  i7=energy
figure;plot(I3_2,I2_2,'o')
figure;plot(I4_2,I6_2,'o')
figure;plot(I4_2,I7_2,'o')
figure;plot(I5_2,I6_2,'o')
figure;plot(I5_2,I7_2,'o')
figure;plot(I6_2,I7_2,'o')