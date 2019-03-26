clc,clear all, close all
cd('C:\Users\mna14\Desktop\acetowhitening margin');
folder='C:\Users\mna14\Desktop\acetowhitening margin';

img=['norm_wind_despeccervix2.tif'];
fullfilename=fullfile(folder, img);
image=imread(fullfilename);
%%
myfun = @(block_struct) ...
   uint8(mean2(block_struct.data));
I2=blockproc(image,[500 500],myfun);
%%
[M N]=size(image);

n=3; % a 3x3 block 
m=3; %

for i=1:n:(N-n)
for j=1:m:(M-m)

%Your process, here I choose to assign a random value to each block
image(i:(i+n-1),j:(j+m-1))=rand(1);

end
end

imshow(image)
 %%  show image
myfun = @(block_struct) ...
   uint8(mean2(block_struct.data)*...
   ones(size(block_struct.data)));
I3=blockproc(image,[100 100],myfun);
%% Centroid
myfun = @(block_struct) ...
   ((regionprops(block_struct.data,'centroid')).Centroid)
I8=blockproc(subImage,[500 500],myfun);
%%
position=
RGB = insertText(I3,[250 250],I2);
% figure;imshow(I3)
% hold on

%%

%%
myfun=@(block_struct)...
    correlate(block_struct.data)*...
   ones(size(block_struct.data));
I4=blockproc(subImage,[10 10],myfun);
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