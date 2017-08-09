run('~/CVIT/cvx/cvx_setup.m');
clear;
load('Frames1.mat');
load('Ncum_transform.mat');

[r,c,n] = size(images_frames1{1,1});

p = 0.8;
%x = translation(:,1);
%y = translation(:,2);

N = length(x);

upper_bound = ((1-p)/2)*c*ones(N,1);
side_bound = ((1-p)/2)*r*ones(N,1);


e = ones(N,1);
D1 = spdiags([-e e], 0:1, N-1, N);
D2 = spdiags([e -2*e e], 0:2, N-2, N);
D3 = spdiags([-e 3*e -3*e e], 0:3, N-3, N);

%%%%%%%%%%%%%%%%%%%%%%% X %%%%%%%%%%%%%%%%%%%%%%%%%%%
lambda1 = 1000;lambda2 = 1000;lambda3 = 1000;

cvx_begin
variable new_x(1*N)
variable new_y(1*N)
variable new_theta(1*N)


minimize(0.5*sum_square(x(:)-new_x) +  ...
    + lambda1*norm(D1*new_x,1) + lambda2*norm(D2*new_x,1) + ...
    lambda3*norm(D3*new_x,1) + ...
    0.5*sum_square(y(:)-new_y) +  ...
    + lambda1*norm(D1*new_y,1) + lambda2*norm(D2*new_y,1) + ...
    lambda3*norm(D3*new_y,1) + ...
    0.5*sum_square(theta(:)-new_theta) +  ...
    + lambda1*norm(D1*new_theta,1) + lambda2*norm(D2*new_theta,1) + ...
    lambda3*norm(D3*new_theta,1)...
)


subject to
    -1*upper_bound(1:N) <= (new_x-x) <= upper_bound(1:N);
    -1*side_bound(1:N) <= (new_y-y) <= side_bound(1:N);

cvx_end

for i=1:N
    new_cum_F{i} = [[[cos(new_theta(i,1)) -sin(new_theta(i,1));...
        sin(new_theta(i,1)) cos(new_theta(i,1))]; ...
            new_x(i,1) new_y(i,1)], [0 0 1]'];
end
save('New_cum_transform.mat','new_x','new_y','new_theta','scale','new_cum_F');
