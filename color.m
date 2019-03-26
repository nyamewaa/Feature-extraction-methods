
clc,clear
dirlist = dir('*.tif');
%%
rand_i=randi(length(dirlist),[1,10]);%select 10 random inages from directory
%%find normal color range
for n=1:length(rand_i)
    img = imread(dirlist(n).name); 
    lab = rgb2lab(img);
    b_img= uint8(lab(:,:,3));
    a_img=uint8(lab(:,:,2));
    figure, imshow(img);
    hold on;
    Num_rois=10;
    for nnn = 1:1:Num_rois
        h = imrect;
        b_roi_mean(n,nnn)=mean(b_img(h.createMask));
        a_roi_mean(n,nnn)=mean(a_img(h.createMask));
    end
    hold off
    close
    save('b_roi_mean_normal.mat','b_roi_mean');
    save('a_roi_mean_normal.mat','a_roi_mean');
end
%% Abnormal
for n=1:length(rand_i)
    img = imread(dirlist(n).name); 
    lab = rgb2lab(img);
    b_img= uint8(lab(:,:,3));
    a_img=uint8(lab(:,:,2));
    figure, imshow(img);
    hold on;
    Num_rois=10;
    for nnn = 1:1:Num_rois
        h = imrect;
        b_roi_mean_ab(n,nnn)=mean(b_img(h.createMask));
        a_roi_mean_ab(n,nnn)=mean(a_img(h.createMask));
    end
    hold off
    close 
    save('b_roi_mean_abnormal.mat','b_roi_mean_ab');
    save('a_roi_mean_abnormal.mat','a_roi_mean_ab');
end

%% specular reflection
for n=1:length(rand_i)
    img = imread(dirlist(n).name); 
    lab = rgb2lab(img);
    b_img= uint8(lab(:,:,3));
    a_img=uint8(lab(:,:,2));
    figure, imshow(img);
    hold on;
    Num_rois=5;
    for nnn = 1:1:Num_rois
        h = imrect;
        b_roi_mean_spec(n,nnn)=mean(b_img(h.createMask));
        a_roi_mean_spec(n,nnn)=mean(a_img(h.createMask));
    end
    hold off
    close 
    save('b_roi_mean_spec.mat','b_roi_mean_spec');
    save('a_roi_mean_spec.mat','a_roi_mean_spec');
end
%%
plot(a_roi_mean,b_roi_mean,'ko')
hold on
plot(a_roi_mean_ab,b_roi_mean_ab,'b*')
plot(a_roi_mean_spec,b_roi_mean_spec,'^g')
title('Regions of interest in a*b space')
xlabel('a')
ylabel('b')
hold off
%% mean of each region
a_normal_mean=nanmean(nanmean(a_roi_mean));
a_abnormal_mean=nanmean(nanmean(a_roi_mean_ab));
a_spec_mean=nanmean(nanmean(a_roi_mean_spec));

b_normal_mean=nanmean(nanmean(b_roi_mean));
b_abnormal_mean=nanmean(nanmean(b_roi_mean_ab));
b_spec_mean=nanmean(nanmean(b_roi_mean_spec));

color_markers=[a_normal_mean,b_normal_mean;a_abnormal_mean,b_abnormal_mean;a_spec_mean,b_spec_mean];
%% color labels
ncolors=3;
color_labels = 0:ncolors-1;
%normal=0, abnormal=1, spec=2
%% initialize matrix
for n=3:3%length(dirlist)
    img = imread(dirlist(n).name);
    lab = rgb2lab(img);
    b_img= uint8(lab(:,:,3));
    a_img=uint8(lab(:,:,2));
    a = double(a_img);
    b = double(b_img);
    distance = zeros([size(a), ncolors]);
    
    for count = 1:ncolors
        distance(:,:,count) = ( (a - color_markers(count,1)).^2 + ...
            (b - color_markers(count,2)).^2 ).^0.5;
    end
    [~, label] = min(distance,[],3);
    label = color_labels(label);
    clear distance;
    rgb_label = repmat(label,[1 1 3]);
    segmented_images = zeros([size(img), ncolors],'uint8');
    
    for count = 1:ncolors
        color = img;
        color(rgb_label ~= color_labels(count)) = 0;
        segmented_images(:,:,:,count) = color;
    end
    
    imshow(segmented_images(:,:,:,2)), title('normal objects');
end

%%
[~, label] = min(distance,[],3);
label = color_labels(label);
clear distance;
% Reading channels
RC = imdata(:,:,1);
GC = imdata(:,:,2);
BC = imdata(:,:,3);
%%
%%%Let the image size is 256X256
lab = rgb2lab(imdata);
b_img= uint8(lab(:,:,3));
double(b_img);
yellow_ind=20<=ans<=50;
lesion_img_b=uint8(double(imdata).* double(repmat(yellow_ind, [1 1 3])));

yellow_ind3=(RC>=253) & (150<=GC<=200) & (BC<=220);
lesion_img=uint8(double(imdata).* double(repmat(yellow_ind3, [1 1 3])));
imshow(lesion_img)
figure;
imshow(lesion_img_b)
