function r=GaussSeidel_sp(T,rhs)
% Use Gauss-Seidel iterative method to solve x for Mx=b;
[n,r]=size(T); 
if n~=r | n<0
error('A must be a square matrix');
end
Toler = 1e-5; % Set precision
MaxIter = 10000; % Set maximum iterations
Iter = 1;
r0 = zeros(n,1); % Initial value
r = zeros(n,1); % output x
while Iter < MaxIter
for j=1:n
r(j) =(-T(j,1:j-1)*r(1:j-1)-T(j,j+1:n)*r0(j+1:n)+rhs(j))/T(j,j);
end
if norm(r-r0)<Toler
break;
end
r0=r;
Iter = Iter+1;
end
disp(['Number of Iterations:' num2str(Iter)]);
if Iter >= MaxIter
disp('Maximum Number of Iterations exceeded!');
end