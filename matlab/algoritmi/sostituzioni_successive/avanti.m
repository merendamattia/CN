function [x] = trianginf(A,b)
    % x = trianginf(A,b)
    %
    % Metodo delle sostituzioni successive in avanti
    % per la risoluzione del sistema lineare
    %
    % Ax = b
    %
    % assumendo che la matrice dei coefficienti A sia
    % triangolare inferiore.
    %
    % A =
    %      10     0     0     0
    %       8     9     0     0
    %       5     6     7     0
    %       1     2     3     4

    [rig, col] = size(A);
    
    if (rig ~= col)
        error("La matrice A non è quadrata")
    end
    
    dim_b = length(b);
    
    if (dim_b ~= rig)
        error("Le dimensioni di A e b noti non sono compatibili")
    end
    
    x = b(:); % copio in x il vettore b

    if (A(1,1) == 0)
        error("Impossibile risolvere il sistema")
    end

    x(1) = x(1) / A(1,1);
    
    for i = 2 : dim_b
        if A(i,i) == 0
            error("Impossibile risolvere il sistema")
        end

        x(i) = (x(i) - A(i, 1 : i - 1) * x(1 : i - 1)) / A(i,i);
    end