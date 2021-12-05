function [V,err]=main(N)
x=0:pi/N:pi;
global intp
global ho

a = 0;
b = pi;
ho = (b-a)/N;
intv(1) = 0;
for k = 2:N
    intv(k) = intv(k-1) + ho*p(x(k));
end
intp = intv;
V = femSIME(x);
x1 = 0:pi/N:pi; l = length(x1);
for i=1:l
  exact(i) = soln(x1(i));
  v_fem(i) = fem_soln(x,V,x1(i)); 
end

err = norm(v_fem-exact,inf);