% Esercizio 1
% Implementazione di @simonecolli
function [matrix] = generate_matrix(n)
    matrix = [];
    l = []

    for i=1:n
        l = [l i];
    end
    
    for i=1:n
        matrix = [matrix; l];
        l = l+n;
    end
end

% Implementazione di @merendamattia
matrice = [];
col = [1 : n];

for i = 1 : n
   matrice = [matrice; col];
   col = col + n;
end