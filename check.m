clear;
load('Cropped_frames.mat');

oldFolder = cd('~/CVIT/Optimal_Camera_Path/cropped_video_31/');

len = length(cropped_frames);

for i=1:len
    filename = sprintf('%04d.png',i);
    disp(filename);
    %new_cropped_linda{1,i} = imresize(new_cropped_linda{1,i},[1080 1920]);
    %imshow(new_images_frames{1,i});
    imwrite(cropped_frames{1,i},filename);
end

cd(oldFolder);