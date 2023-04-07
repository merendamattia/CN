function [x] = triangsup(A,b)
    % x = triangsup(A,b)
    %
    % Metodo delle sostituzioni successive all'indietro
    % per la risoluzione del sistema lineare
    %
    % Ax = b
    %
    % assumendo che la matrice dei coefficienti A sia
    % triangolare superiore.
    %
    % A =
    %   1   2   3   4       
    %   0   9   8   7       
    %   0   0   3   9       
    %   0   0   0   4

    [rig, col] = size(A);
    
    if (rig ~= col)
        error("La matrice A non è quadrata")
    end
    
    dim_b = length(b);
    
    if (dim_b ~= rig)
        error("Le dimensioni di A e b noti non sono compatibili")
    end
    
    x = b(:); % copio in x il vettore b

    if (A(dim_b, dim_b) == 0)
        error("Impossibile risolvere il sistema")
    end

    x(dim_b) = x(dim_b) / A(dim_b, dim_b);
    
    for i = dim_b - 1 : -1 : 1 % -> for(int i = dim_b - 1; i > 0; i--)
        if (A(i, i) == 0)
            error("Impossibile risolvere il sistema")
        end
        x(i) = (x(i) - A(i, i + 1 : dim_b) * x(i + 1 : dim_b)) / A(i, i);
    end
end