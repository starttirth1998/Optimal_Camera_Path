run ~/CVIT/vlfeat-0.9.20/toolbox/vl_setup.m
clear;
oldFolder = cd('~/CVIT/Optimal_Camera_Path/frames_3');

imagefiles1 = dir('*.png');
imagefiles2 = dir('*.jpg');
imagefiles3 = dir('*.jpeg');

imagefiles = [imagefiles1 ; imagefiles2 ; imagefiles3];

cnt = 1;
nfiles = length(imagefiles);

for i=401:865
   disp(i);
   currentfilename = imagefiles(i).name;
   currentimage = imread(currentfilename);
   [r,c,no] = size(currentimage);
   if(no == 3)
       [feature2{cnt},descriptor2{cnt}] = vl_sift(single(rgb2gray(currentimage)));
   else
       [feature2{cnt},descriptor2{cnt}] = vl_sift(single(currentimage));
   end
   images_frames2{cnt} = currentimage;
   cnt = cnt + 1;
end

cd(oldFolder);
save('Frames2.mat','images_frames2','feature2','descriptor2');