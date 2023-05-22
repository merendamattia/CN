%{
    By Di Agostino Manuel
    @manueldiagostino
    manuel.diagostino@studenti.unipr.it
%}

function [z] = poly_mol(x,y)
    % Restituisce i coefficienti del risultato
    % della moltiplicazione tra x e y (in ordine crescente di grado)

    x_degree = length(x)-1;
    y_degree = length(y)-1;

    z = zeros(1, x_degree + y_degree + 1); % vettore dei risultati
    for i=0:x_degree
        for j=0:y_degree
            z(i+j+1) = z(i+j+1) + x(i+1)*y(j+1);
        end
    end

end

