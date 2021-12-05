function [a,b,c,d]=cbicv5(x,y)
%
% this script generates the co-efficient of the cubic spline
%
n = length(x);

h = x(2:n) - x(1:n-1);
d = (y(2:n) - y(1:n-1))./h;

lower = h(1:end-1);
main  = 2*(h(1:end-1) + h(2:end));
upper = h(2:end);

T = spdiags([lower main upper], [-1 0 1], n-2, n-2);
rhs = 6*(d(2:end)-d(1:end-1));

r = T\rhs;

r = [ 0; r; 0];

a = y;
b = d - h.*(2*r(1:end-1) + r(2:end))/6;
c = r/2;
d =(r(2:end)-r(1:end-1))./(6*h);