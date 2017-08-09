clear;
load('New_transform.mat');
load('Frames1.mat');
load('Frames2.mat');

N = 864;
cnt = 1;

Hcum = eye(3);
H = eye(3);

for i=1:400
    disp(i);
    new_images_frames{i} = imwarp(images_frames1{1,cnt},affine2d(H),'OutputView',...
        imref2d(size(images_frames1{cnt})));
    imshow(new_images_frames{i});
    H = new_F{1,i};
    %Hcum = Hcum*H;
    cnt = cnt + 1;
end

cnt = 1;

for i=401:864
    disp(i);
    new_images_frames{i} = imwarp(images_frames2{1,cnt},affine2d(H),'OutputView',...
        imref2d(size(images_frames2{cnt})));
    imshow(new_images_frames{i});
    H = new_F{1,i};
    %Hcum = Hcum*H;
    cnt = cnt + 1;
end

save('New_images_frames.mat','new_images_frames');