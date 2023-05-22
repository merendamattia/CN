%{
    By Di Agostino Manuel
    @manueldiagostino
    manuel.diagostino@studenti.unipr.it
%}

function [res] = lagr_poly(i,x)
    %LAGRANGE:  calcola i coefficienti dell'i-esimo polinomio di Lagrange
    %   i: i-esimo polinomio di lagrage da calcolare (i= 1, .. , n+1)
    %   x: vettore delle coordinate x

    x_len = length(x);
    res_degree = x_len-1; % grado polinomio risultante
    res = [1]; % vettore risultato

    den = 1;
    for j=1:length(x)
        if (j ~= i)
            den = den * (x(i) - x(j));

            fatt = [-x(j), 1];
            res = poly_mol(res, fatt);
        end
    end

    res = res ./ den;

end
