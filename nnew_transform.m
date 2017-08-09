clear;
load('Ncum_transform.mat');
load('New_cum_transform.mat');

N = length(new_x);

nx = new_x(:);
ny = new_y(:);
ntheta = new_theta(:);

new_x = zeros(N,1);
new_y = zeros(N,1);
new_theta = zeros(N,1);

for i=1:N
    cum_F{i}(1:2,1:2) = eye(2);
    new_cum_F{i}(1:2,1:2) = eye(2);
    new_F{i} = cum_F{i}\new_cum_F{i};
end

save('New_transform.mat','new_F');