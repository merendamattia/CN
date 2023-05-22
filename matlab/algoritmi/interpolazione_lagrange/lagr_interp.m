%{
    By Di Agostino Manuel
    @manueldiagostino
    manuel.diagostino@studenti.unipr.it
%}

function [res] = lagr_interp(x,y)
    %LAGR_INTERP: calcola i coefficienti del polinomio interpolatore
    %   x: ascisse
    %   y: ordinate

    x_len = length(x);
    y_len = length(y);

    if (x_len ~= y_len)
        warning("Le dimensioni degli argomenti non coincidono");
        return
    end

    res = zeros(1, x_len); % il grado di res è (x_len-1)
    for i=1:x_len
        res = res + y(i)*lagr_poly(i, x);
    end

end
