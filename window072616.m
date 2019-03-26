% clc,clear all, close all
cd('C:\Users\mna14\Desktop\acetowhitening margin');
folder='C:\Users\mna14\Desktop\acetowhitening margin\4images';
img=['norm_wind_despeccervix2.tif'];
fullfilename=fullfile(folder, img);
image=imread(fullfilename);
%% MEAN PIXEL VALUE finds mwN PPIX WITH BLOACK PROC GETS the values
myfun = @(block_struct) ...
   uint8(mean2(block_struct.data));
I2_a=blockproc(image,[100 100],myfun);
size_mat=size(I2_a,2)*size(I2_a,1);
I2_array=reshape(I2_a',size_mat,1);
 %%  finds the position for the values and can show the image
myfun = @(block_struct) ...
   uint8(mean2(block_struct.data)*...
   ones(size(block_struct.data)));
[I2,r,c]=blockproc_with_loc(image,[100 100],myfun);

r_array=reshape(r',size_mat,1);
c_array=reshape(c',size_mat,1);

%%
position=cat(2,c_array,r_array);
%%
RGB = insertText(image,position,I2_array,'FontSize',12);
figure
imshow(RGB),title('Numeric values');

%% CORRELATE
myfun = @(block_struct) ...
   correlate(block_struct.data);
I3_a=blockproc(image,[100 100],myfun);
size_mat=size(I3_a,2)*size(I3_a,1);
I3_array=reshape(I3_a',size_mat,1);
 %%  
myfun = @(block_struct) ...
   (correlate(block_struct.data)*...
   ones(size(block_struct.data)));
[I3,r,c]=blockproc_with_loc(image,[100 100],myfun);

r_array=reshape(r',size_mat,1);
c_array=reshape(c',size_mat,1);
%%
position=cat(2,c_array,r_array);
%%
RGB = insertText(image,position,I3_array,'FontSize',20);
figure
imshow(RGB),title('Numeric values');

%% HOMOGENEITY
myfun = @(block_struct) ...
   homogeneity(block_struct.data);
I4_a=blockproc(image,[100 100],myfun);
size_mat=size(I4_a,2)*size(I4_a,1);
I4_array=reshape(I4_a',size_mat,1);
 %%  
myfun = @(block_struct) ...
  (homogeneity(block_struct.data)*...
   ones(size(block_struct.data)));
[I4,r,c]=blockproc_with_loc(image,[100 100],myfun);

r_array=reshape(r',size_mat,1);
c_array=reshape(c',size_mat,1);
%%
position=cat(2,c_array,r_array);
%%
RGB = insertText(image,position,I4_array,'FontSize',20);
figure
imshow(RGB),title('Numeric values');

%% CONTRAST
myfun = @(block_struct) ...
   contrast(block_struct.data);
I5_a=blockproc(image,[100 100],myfun);
size_mat=size(I5_a,2)*size(I5_a,1);
I5_array=reshape(I5_a',size_mat,1);
 %%  
myfun = @(block_struct) ...
   (contrast(block_struct.data)*...
   ones(size(block_struct.data)));
[I5,r,c]=blockproc_with_loc(image,[100 100],myfun);

r_array=reshape(r',size_mat,1);
c_array=reshape(c',size_mat,1);
%%
position=cat(2,c_array,r_array);
%%
RGB = insertText(image,position,I5_array,'FontSize',20);
figure
imshow(RGB),title('Numeric values');

%% ENERGY
myfun = @(block_struct) ...
   energy(block_struct.data);
I6_a=blockproc(image,[100 100],myfun);
size_mat=size(I6_a,2)*size(I6_a,1);
I6_array=reshape(I6_a',size_mat,1);
 %%  
myfun = @(block_struct) ...
   (energy(block_struct.data)*...
   ones(size(block_struct.data)));
[I6,r,c]=blockproc_with_loc(image,[100 100],myfun);

r_array=reshape(r',size_mat,1);
c_array=reshape(c',size_mat,1);
%%
position=cat(2,c_array,r_array);
%%
RGB = insertText(image,position,I6_array,'FontSize',20);
figure
imshow(RGB),title('Numeric values');
%% Images



%% PLOTS
%I2=mean pixel, i3=correlate  i4=homo  i5=contrast  i6=energy
figure;plot(I2_array,I3_array,'o')
title('Pix mean vs correlate')
xlabel('Pix mean')
ylabel('correlate')

figure;plot(I2_array,I4_array,'o')
title('Pix mean vs homogeneity')
xlabel('Pix mean')
ylabel('homogeneity')

figure;plot(I2_array,I5_array,'o')
title('Pix mean vs contrast')
xlabel('Pix mean')
ylabel('contrast')

figure;plot(I2_array,I6_array,'o')
title('Pix mean vs energy')
xlabel('Pix mean')
ylabel('energy')

figure;plot(I3_array,I4_array,'o')
title('correlate vs homogeneity')
xlabel('correlate')
ylabel('homogeneity')

figure;plot(I3_array,I5_array,'o')
title('correlate vs contrast')
xlabel('correlate')
ylabel('contrast')

figure;plot(I3_array,I6_array,'o')
title('correlate vs energy')
xlabel('correlate')
ylabel('energy')

figure;plot(I4_array,I5_array,'o')
title('homogeneity vs contrast')
xlabel('homogeneity')
ylabel('contrast')

figure;plot(I4_array,I6_array,'o')
title('homogeneity vs energy')
xlabel('homogeneity')
ylabel('energy')

figure;plot(I5_array,I6_array,'o')
title('contrast vs energy')
xlabel('contraste')
ylabel('energy')