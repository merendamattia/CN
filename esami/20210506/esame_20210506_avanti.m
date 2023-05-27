function [x] = esame_20210506_avanti(A,b)
    [rig, col] = size(A);

    if (rig ~= col)
        error("La matrice A non Ã¨ quadrata")
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
end