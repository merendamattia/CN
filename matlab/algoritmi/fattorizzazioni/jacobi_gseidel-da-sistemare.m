clear;
clc;

n = 3;
%A = [3 0 4; 7 4 2; -1 -1 2];
%A = [10 0 4; 7 15 2; -1 -1 5];
%A = [-3 3 -6; -4 7 -8; 5 7 -9];
A = [7 6 9; 4 5 -4; -7 -3 8]
toll = 10^-6;
D = diag(diag(A));
C = A - D;
x = [1 1 1]';
b = A * x;

B = -1 * inv(D) * C;

raggio_spett = max(abs(eig(B)))        
xx = rand(3, 1);
x = xx;
% Jacobi
step_jac = 0;
while (norm(A * x - b) > toll)
    x = B * x + inv(D) * b;
    step_jac = step_jac + 1;

end

% Gauss-Seidel
E = tril(C);
F = triu(C);

step_gauss = 0;
x = xx;
while norm(A * x - b) > toll
    x_prev = x;
    for i = 1:n
        x(i) = (1/A(i, i)) * (b(i) - A(i, 1:i-1) * x(1:i-1)...
            - A(i, i+1:n) * x_prev(i+1:n));
    end
    step_gauss = step_gauss + 1;
end
x
[raggio_spett max(abs(eig(inv(D + E) * F)))]
[step_jac step_gauss]