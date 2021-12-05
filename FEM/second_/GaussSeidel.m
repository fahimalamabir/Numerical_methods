function v=GaussSeidel(M,b)
% Use Gauss-Seidel iterative method to solve x for Mx=b;
[n,m]=size(M); 
if n~=m | n<0
error('A must be a square matrix');
end
Toler = 1e-5; % Set precision
MaxIter = 10000; % Set maximum iterations
Iter = 1;
v0 = zeros(n,1); % Initial value
v = zeros(n,1); % output x
while Iter < MaxIter
for j=1:n
v(j) =(-M(j,1:j-1)*v(1:j-1)-M(j,j+1:n)*v0(j+1:n)+b(j))/M(j,j);
end
if norm(v-v0)<Toler
break;
end
v0=v;
Iter = Iter+1;
end
disp(['Number of Iterations:' num2str(Iter)]);
if Iter >= MaxIter
disp('Maximum Number of Iterations exceeded!');
end