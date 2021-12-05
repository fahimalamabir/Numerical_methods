function plot_dericubic_spline(x,b,c,d,N)
%
% this script forms the spline using the co-efficient above for f'
%
n = length(x);

for i=1:n-1
   xx = linspace(x(i),x(i+1),N);
   xi = repmat(x(i),1,N);
   yy = b(i) + 2*c(i)*(xx-xi) + 3*d(i)*(xx - xi).^2;
   plot(xx,yy,'m')
   plot(x(i),0,'r');
      Y= proderi(xx);
end

error = norm(yy-Y,inf)