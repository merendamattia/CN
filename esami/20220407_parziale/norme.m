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
