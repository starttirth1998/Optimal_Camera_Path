run ~/CVIT/vlfeat-0.9.20/toolbox/vl_setup.m
clear;
load('Frames1.mat');
load('Frames2.mat');

cnt = 1;

for i=1:399
    disp(i);
    [matches,score] = vl_ubcmatch(descriptor1{cnt},descriptor1{cnt+1});
    im1_Points = feature1{1,cnt}(1:2,matches(1,:));
    im2_Points = feature1{1,cnt+1}(1:2,matches(2,:));
    
    %figure;
    %showMatchedFeatures(images_frames2{cnt}, images_frames2{cnt+1},...
    %    im1_Points', im2_Points');
    %legend('A', 'B');
    
    [tform{cnt}, inside_im1_Points, inside_im2_Points] = ...
    estimateGeometricTransform(im1_Points', im2_Points', 'similarity');
    %imgA = imwarp(images_frames1{cnt}, tform{cnt}, 'OutputView',...
    %    imref2d(size(images_frames1{cnt})));
    %new_inside_im1_Points = transformPointsForward(tform{cnt}, inside_im1_Points);
    
    %figure;
    %showMatchedFeatures(imgA, images_frames2{cnt+1},...
    %    new_inside_im1_Points, inside_im2_Points);
    %legend('A', 'B');
    
    H = tform{cnt}.T;
    %{
    R = H(1:2,1:2);
    theta2{cnt} = mean([atan2(R(2),R(1)) atan2(-R(3),R(4))]);
    scale2{cnt} = mean(R([1 4])/cos(theta2{cnt}));
    translation2{cnt} = H(3, 1:2);
    %}
    
    scale1{cnt} = sqrt(H(1,1).^2 + H(2,1).^2); 
    theta1{cnt} = atan2(H(2,1),H(1,1));
    translation1{cnt} = H(3,1:2);
    %HsRt = [[scale1{cnt}*[cos(theta1{cnt}) -sin(theta1{cnt}); sin(theta1{cnt}) cos(theta1{cnt})]; ...
    %        translation1{cnt}], [0 0 1]'];
    %HsRt = [[scale1{cnt}*[cos(theta1{cnt}) -sin(theta1{cnt}); sin(theta1{cnt}) cos(theta1{cnt})]; ...
    %        translation1{cnt}], [0 0 1]'];
    F1{cnt} = tform{cnt};
    
    cnt = cnt + 1;
end


%%% Below commented code should be used at points where we have breaked our
%%% frames (Eg:- Current split is at 400th frame)

%{
for i=400:400
    disp(i);
    [matches,score] = vl_ubcmatch(descriptor1{cnt},descriptor2{1});
    im1_Points = feature1{1,cnt}(1:2,matches(1,:));
    im2_Points = feature2{1,1}(1:2,matches(2,:));
    
    %figure;
    %showMatchedFeatures(images_frames1{cnt}, images_frames1{cnt+1},...
    %    im1_Points', im2_Points');
    %legend('A', 'B');
    
    [tform{cnt}, inside_im1_Points, inside_im2_Points] = ...
    estimateGeometricTransform(im1_Points', im2_Points', 'similarity');
    %imgBp = imwarp(images_frames2{1}, tform{cnt}, 'OutputView',...
    %    imref2d(size(images_frames2{1})));
    %new_inside_im2_Points = transformPointsForward(tform{cnt}, inside_im2_Points);
    
    %figure;
    %showMatchedFeatures(images_frames1{cnt}, images_frames1{cnt+1},...
    %    inside_im1_Points, new_inside_im2_Points);
    %legend('A', 'B');
    
    
    H = tform{cnt}.T;
    %{
    R = H(1:2,1:2);
    theta1{cnt} = mean([atan2(R(2),R(1)) atan2(-R(3),R(4))]);
    scale1{cnt} = mean(R([1 4])/cos(theta1{cnt}));
    translation1{cnt} = H(3, 1:2);
    %}
    scale1{cnt} = sqrt(H(1,1).^2 + H(1,2).^2); 
    theta1{cnt} = atan2(H(2,1),H(1,1));
    translation1{cnt} = H(3,1:2);

    %HsRt = [[scale1{cnt}*[cos(theta1{cnt}) -sin(theta1{cnt}); sin(theta1{cnt}) cos(theta1{cnt})]; ...
    %        translation1{cnt}], [0 0 1]'];
    F1{cnt} = tform{cnt};
    
    cnt = cnt + 1;
end
%}
save('Transform1.mat','F1','theta1','scale1','translation1');