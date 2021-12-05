function cubic_main(N)
%
% this is the main driver that calls out different functions to plot the
% spline
%
x = linspace(1,5,N);
y = prob(x);
n = length(x);
[a,b,c,d] = cbicv5(x',y');
M = 100; % for plotting points
xx = linspace(1,5,M); 
yy = prob(xx);
figure(1);
plot(xx,yy,'g*');
hold on;
plot_cubic_spline(x,a,b,c,d,n);
title('f')
legend('True','Approx');
pos1 = get(gcf,'Position'); % get position of Figure(1) 
set(gcf,'Position', pos1 - [pos1(3)/2,0,0,0]) % Shift position of Figure(1)
figure(2);
yy1 = proderi(xx);
plot(xx,yy1,'r*');
hold on;
plot_dericubic_spline(x,b,c,d,N);
legend('True','Approx');
title('f-prime')
set(gcf,'Position', get(gcf,'Position')); 
pos2 = get(gcf,'Position');  % get position of Figure(2) 
set(gcf,'Position', pos2 + [pos1(3)/2,0,0,0]) % Shift position of Figure(2)