clear;
load('Transform.mat');

N = length(scale);

theta = theta(:);

cum_F{1,1} = F{1}.T;
x(1,1) = cum_F{1,1}(3,1);
y(1,1) = cum_F{1,1}(3,2);
theta(1,1) = atan2(cum_F{1,1}(2,1),cum_F{1,1}(1,1));

for i=2:N
    cum_F{i} = (cum_F{i-1}'*F{i}.T')';
    x(i,1) = cum_F{1,i}(3,1);
    y(i,1) = cum_F{1,i}(3,2);
    theta(i,1) = atan2(cum_F{1,i}(2,1),cum_F{1,i}(1,1));
end


%x = new_x(:);y = new_y(:); theta = new_theta(:);

save('Ncum_transform.mat','x','y','theta','scale','cum_F');