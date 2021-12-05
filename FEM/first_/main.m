function [V,err]=main(N)
x=0:pi/N:pi;

V = femSIME(x);


x1 = 0:pi/N:pi; l = length(x1);
for i=1:l
  exact(i) = soln(x1(i));
  v_fem(i) = fem_soln(x,V,x1(i)); 
end

err = norm(v_fem-exact,inf);