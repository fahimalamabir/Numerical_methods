function plot_cubic_spline(x,a,b,c,d,N)
%
% this script forms the spline using the co-efficient above for f
%
n = length(x);

for i=1:n-1
   xx = linspace(x(i),x(i+1),N);
   xi = repmat(x(i),1,N);
   yy = a(i) + b(i)*(xx-xi) + ... 
     c(i)*(xx-xi).^2 + d(i)*(xx - xi).^3;
   plot(xx,yy,'b')
   plot(x(i),0,'r');
      Y= prob(xx);
end

error = norm(yy-Y,inf)