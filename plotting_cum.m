clear;
load('Ncum_transform.mat');
load('New_cum_transform.mat');

N = length(x);

figure;
subplot(1,2,1),plot(1:N,x);
title('x');
subplot(1,2,2),plot(1:N,new_x);
title('new x');
set(gcf, 'units','normalized','outerposition',[0 0 1 1]);

figure;
subplot(1,2,1),plot(1:N,y);
title('y');
subplot(1,2,2),plot(1:N,new_y);
title('new y');
set(gcf, 'units','normalized','outerposition',[0 0 1 1]);

figure;
subplot(1,2,1),plot(1:N,theta);
title('theta');
subplot(1,2,2),plot(1:N,new_theta);
title('new theta');
set(gcf, 'units','normalized','outerposition',[0 0 1 1]);