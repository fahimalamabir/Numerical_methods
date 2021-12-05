function V = femSIME(x)                                            
n = length(x);
for i=1:n-1
  h(i) = x(i+1)-x(i);
  mid(i)=0.5*(x(i+1)+x(i));
end

M = sparse(n,n); b=zeros(n,1);           % Initialize
M(1,1) = 1; b(1)=0;
M(n,n) = 1; b(n)=0;
M(2,2) = g_ph(x(1),x(2))/h(1)+g_ps(x(1),x(2))*(h(1)/3); 
b(2) = g_2(x(1),x(2));

for i=2:n-2
  M(i,i) = M(i,i) + g_ph(x(i),x(i+1))/h(i)+g_ps(x(i),x(i+1))*(h(i)/3);
  M(i,i+1)   = M(i,i+1) - g_ph(x(i),x(i+1))/h(i)+g_ps(x(i),x(i+1))*(h(i)/6);
  M(i+1,i)   = M(i+1,i) - g_ph(x(i),x(i+1))/h(i)+g_ps(x(i),x(i+1))*(h(i)/6);
  M(i+1,i+1) = M(i+1,i+1) + g_ph(x(i),x(i+1))/h(i)+g_ps(x(i),x(i+1))*(h(i)/3);
  b(i)       = b(i) + g_2(x(i),x(i+1));
  b(i+1)     = b(i+1) + g_2(x(i),x(i+1));
end

  M(n-1,n-1) = M(n-1,n-1) + g_ph(x(n-1),x(n))/h(n-1)+g_ps(x(n-1),x(n))*(h(n-1)/3);
  b(n-1)     = b(n-1) + g_2(x(n-1),x(n));
  

  V = GaussSeidel(M,b);
  return