% Scrivere la matrice A 15x15 triang. superiore e il vettore b = (100, 99, ..., 86)'
% A =
%   1   0   1   2   3   ...     13
%   0   1   14  15  16  ...     26
%   0   0   1   27  28  ...     38
%   ...     ...     ...     ...
%   0   0   0   0   0   ...     1
%
% e risolvere, se possibile, il sistema Ax=b


clear
clc

b = [100 : -1 : 86]';

A = [];
counter = 0;

for i = 1 : 15
    A(i, i) = 1;
end 

for i = 1 : 15
    for j = 1 : 15
        if i + j < 16
            A(i, i + j) = counter;
            counter = counter + 1;
        end
    end
end

format long

x = triangsup(A, b);