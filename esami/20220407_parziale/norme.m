% Esercizio 2

% Implementazione di @simonecolli
% Norma 1 vettore
function [n] = norma1(v)
    n = 0;
    for i=1:length(v)
        n = n + abs(v(i));
    end
end

% Norma 2 vettore
function [n] = norma2(v)
    n = 0;
    for i=1:length(v)
        n = n + abs(v(i))^2;
    end
    n = sqrt(n);
end

% Norma infinito vettore
function [n] = normaInf(v)
    n = max(abs(v));
end


% Implementazione di @merendamattia
clear
clc

A = [1 2 3; 4 5 6; 7 8 9; 10 11 12];

n1 = norm(A, 1);
n2 = norm(A, 2);
ninf = norm(A, inf);

[rig col] = size(A);

% Norma 1 matrici
values = [];
tmp = 0;

for i = 1 : col
    for j = 1 : rig
        tmp = tmp + A(j, i);
    end
    values = [values tmp];
    tmp = 0;
end
n1_calculated = max(values);

% Norma 2 matrici
n2_calculated = max(sqrt(eig(A'*A)));

% Norma infinito matrici
values = [];
tmp = 0;

for i = 1 : rig
    for j = 1 : col
        tmp = tmp + A(i, j);
    end
    values = [values tmp];
    tmp = 0;
end
ninf_calculated = max(values);

% Tests
n1 == n1_calculated
n2 == n2_calculated
ninf == ninf_calculated