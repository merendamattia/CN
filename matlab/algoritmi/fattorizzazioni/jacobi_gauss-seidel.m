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

% Gauss-Seidel per componenti
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

% Gauss-Seidel non per componenti
clear
clc
close all

format short

A = [-3 3 -6; -4 7 -8; 5 7 -9]
x = [1 1 1]'
b = A * x
tolleranza = 10^-6;

max_iter = 1000;
n = size(A, 1);
D = diag(diag(A));
E = triu(A, 1);
C = tril(A, -1);
M = D + C;
N = E + D;

x = zeros(n, 1);
iter = 0;
errore = inf;

while errore > tolleranza && iter < max_iter
    x_prev = x;
    x = -inv(N) * C * x + inv(N) * b;
    errore = norm(x - x_prev);
    iter = iter + 1;
end

if iter == max_iter
    disp('Il metodo di Gauss-Seidel non ha raggiunto la convergenza entro il numero massimo di iterazioni.');
else
    disp(['Il metodo di Gauss-Seidel ha raggiunto la convergenza dopo ', num2str(iter), ' iterazioni.']);
end
