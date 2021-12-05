function y = fem_soln(x,V,xp)

n = length(x);
for i=1:n-1
  if xp >=x(i) & xp <= x(i+1) %xp-> solution evaluation
     y = hat2(xp,x(i),x(i+1))*V(i) + hat1(xp,x(i),x(i+1))*V(i+1);
     return
  end
end