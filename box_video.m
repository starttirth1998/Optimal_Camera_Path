clear;
load('New_transform.mat');
load('Frames1.mat');
load('Frames2.mat');

N = length(new_theta);
cnt = 1;

Hcum = eye(3);
H = eye(3);
%new_images_frames{1} = images_frames1{1,cnt};

p = 0.9;

for i=1:400
    disp(i);
    [r,c,n] = size(images_frames1{1,cnt});
    center_x = r/2;center_y = c/2;
    x_length = p*r;y_length = p*c;
    x1 = center_x-x_length/2;y1 = center_y-y_length/2;
    x2 = center_x-x_length/2;y2 = center_y+y_length/2;
    x3 = center_x+x_length/2;y3 = center_y+y_length/2;
    x4 = center_x+x_length/2;y4 = center_y-y_length/2;
    p1 = [y1 x1 1];
    p2 = [y2 x2 1];
    p3 = [y3 x3 1];
    p4 = [y4 x4 1];
    np1 = p1*H;
    np2 = p2*H;
    np3 = p3*H;
    np4 = p4*H;
    new_points = [np1(1) np1(2) np2(1) np2(2) np3(1) np3(2) np4(1) np4(2)];
    polygon = [np1(1) np1(2) np3(1)-np1(1) np3(2)-np1(2)];
    
    new_images_frames{i} = insertShape(images_frames1{1,cnt},'Polygon',new_points...
        ,'Color','yellow','LineWidth',5);
    cropped_frames{i} = imcrop(images_frames1{1,cnt}, polygon);
    %cropped_frames{i} = imresize(cropped_frames{i},[360 640]);
    imshow(new_images_frames{i});

    %new_images_frames{i} = imwarp(images_frames1{1,cnt},affine2d(H));
    H = new_F{1,i}.T;
    Hcum = Hcum*H;
    cnt = cnt + 1;
end

[r,c,n] = size(images_frames2{1,1});
center_x = r/2;center_y = c/2;
x_length = p*r;y_length = p*c;
x1 = center_x-x_length/2;y1 = center_y-y_length/2;
x2 = center_x-x_length/2;y2 = center_y+y_length/2;
x3 = center_x+x_length/2;y3 = center_y+y_length/2;
x4 = center_x+x_length/2;y4 = center_y-y_length/2;
p1 = [y1 x1 1];
p2 = [y2 x2 1];
p3 = [y3 x3 1];
p4 = [y4 x4 1];

np1 = p1*H;
np2 = p2*H;
np3 = p3*H;
np4 = p4*H;
new_points = [np1(1) np1(2) np2(1) np2(2) np3(1) np3(2) np4(1) np4(2)];
polygon = [np1(1) np1(2) np3(1)-np1(1) np3(2)-np1(2)];

new_images_frames{i} = insertShape(images_frames2{1,1},'Polygon',new_points...
    ,'Color','yellow','LineWidth',5);
cropped_frames{i} = imcrop(images_frames2{1,1}, polygon);
%cropped_frames{i} = imresize(cropped_frames{i},[360 640]);
imshow(new_images_frames{i});

%new_images_frames{401} = imwarp(images_frames1{1,400},affine2d(H));    
    
H = new_F{1,401}.T;
Hcum = Hcum*H;


cnt = 1;

for i=401:864
    disp(i);
    [r,c,n] = size(images_frames2{1,cnt});
    center_x = r/2;center_y = c/2;
    x_length = p*r;y_length = p*c;
    x1 = center_x-x_length/2;y1 = center_y-y_length/2;
    x2 = center_x-x_length/2;y2 = center_y+y_length/2;
    x3 = center_x+x_length/2;y3 = center_y+y_length/2;
    x4 = center_x+x_length/2;y4 = center_y-y_length/2;
    p1 = [y1 x1 1];
    p2 = [y2 x2 1];
    p3 = [y3 x3 1];
    p4 = [y4 x4 1];
    np1 = p1*H;
    np2 = p2*H;
    np3 = p3*H;
    np4 = p4*H;
    new_points = [np1(1) np1(2) np2(1) np2(2) np3(1) np3(2) np4(1) np4(2)];
    polygon = [np1(1) np1(2) np3(1)-np1(1) np3(2)-np1(2)];
    
    new_images_frames{i} = insertShape(images_frames2{1,cnt},'Polygon',new_points...
        ,'Color','yellow','LineWidth',5);
    cropped_frames{i} = imcrop(images_frames2{1,cnt}, polygon);
    %cropped_frames{i} = imresize(cropped_frames{i},[360 ]);
    
    imshow(new_images_frames{i});

    H = new_F{1,i}.T;
    %new_images_frames{i} = imwarp(images_frames2{1,cnt},affine2d(Hcum));
    Hcum = Hcum*H;
    cnt = cnt + 1;
end


save('New_images_frames.mat','new_images_frames');
save('Cropped_frames.mat','cropped_frames');