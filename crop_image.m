clear;

load('New_images_frames.mat');

cnt = 1;
p = 0.8;

[r,c,n] = size(new_images_frames{1,1});
center_x = r/2;center_y = c/2;
x_length = p*r;y_length = p*c;
polygon = [center_y-y_length/2 center_x-x_length/2 y_length x_length];    


for i=1:864
    disp(i);
    cropped_frames{cnt} = imcrop(new_images_frames{1,cnt},polygon);
    imshow(cropped_frames{cnt});
    cnt = cnt + 1;
end

save('Cropped_frames.mat','cropped_frames');
