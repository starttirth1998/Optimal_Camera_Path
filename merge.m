clear;

load('Transform1.mat');
load('Transform2.mat');

cnt = 1;

for i=1:400
    disp(i);
    F{i} = F1{cnt};
    translation(i,:) = translation1{cnt};
    scale(i) = scale1{cnt};
    theta(i) = theta1{cnt};
    cnt = cnt + 1;
end

cnt = 1;

for i=401:864
    disp(i);
    F{i} = F2{cnt};
    translation(i,:) = translation2{cnt};
    scale(i) = scale2{cnt};
    theta(i) = theta2{cnt};
    cnt = cnt + 1;
end 


save('Transform.mat','F','scale','translation','theta');