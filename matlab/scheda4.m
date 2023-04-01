% Es. 1
clear 
clc

dim = 20;
x = linspace(0.5, 4.1, 1000);

C1 = [1 -6 11 -6];
roots_C1 = roots(C1);

p1 = @(x) x.^3 - 6*(x.^2) + 11*x - 6;
% sol = [fzero(p1, 0)];

sol = [];

C2 = [1 -7 15 -13 4];
roots_C2 = roots(C2);

p2 = @(x) x.^4 - 7*x.^3 + 15*x.^2 - 13*x + 4;
fzero(p2, 1.6);

subplot(2, 1, 1);
plot(x, p1(x));
grid on

subplot(2, 1, 2);
plot(x, p2(x));
grid on

%{
for i = 1:3
    sol(i) = fzero(p1, 0);
    for j = 1:i
        p1 = @(x) pi ./ (x - sol(i));
    end
    %p1 = @(x) (x.^3 - 6*(x.^2) + 11*x - 6) / (x - sol(i));
end
%}

% -----------------------------------

% Es. 2
% POLINOMIO 1 - Bisezione e Newton
clear 
clc

x = linspace(0.5, 4, 1000);

C1 = [1 -6 11 -6];
roots_C1 = roots(C1)';

p1 = @(x) x.^3 - 6*(x.^2) + 11*x - 6;
df_p1 = @(x) 3*x.^2 - 12*x + 11; % derivata di p1

plot(x, p1(x));
grid on

epsilon = 1e-4;
n_iterazioni = 15;

[ris1, fx1, n1] = bisection(p1, 0.5, 1.5, epsilon, n_iterazioni);
[ris2, fx2, n2] = bisection(p1, 1.5, 2.5, epsilon, n_iterazioni);
[ris3, fx3, n3] = bisection(p1, 2.5, 3.5, epsilon, n_iterazioni);

[ris4, n4] = newton(p1, df_p1, 0.5, epsilon, n_iterazioni);
[ris5, n5] = newton(p1, df_p1, 1.5, epsilon, n_iterazioni);
[ris6, n6] = newton(p1, df_p1, 2.5, epsilon, n_iterazioni);

roots_bisection = [ris1, ris2, ris3]

ris4;
ris5;
ris6;

roots_C1;

% ----------------------

% POLINOMIO 2 - Bisezione
clear 
clc

x = linspace(0.5, 4.5, 1000);

C2 = [1 -7 15 -13 4];
roots_C2 = roots(C2)';

p2 = @(x) x.^4 - 7*x.^3 + 15*x.^2 - 13*x + 4;

plot(x, p2(x));
grid on

epsilon = 1e-4;
n_iterazioni = 15;

[ris1, fx1, n1] = bisection(p2, 0.5, 1.5, epsilon, n_iterazioni);
[ris2, fx2, n2] = bisection(p2, 3, 4.5, epsilon, n_iterazioni);

roots_bisection = [ris1, ris2];
roots_bisection;
roots_C2;
