function [x, fx, n] = bisection(f, a, b, tol, maxiter)
    % f: la funzione da trovare lo zero
    % a, b: gli estremi dell'intervallo di ricerca
    % tol: la tolleranza dell'errore
    % maxiter: il numero massimo di iterazioni
    
    if f(a) * f(b) >= 0
        error('L''intervallo non soddisfa le condizioni di esistenza dello zero.')
    end
    
    n = 0;
    
    % criterio di arresto: numero di iterazioni
    while n < maxiter
        
        x = (a + b) / 2;
        fx = f(x);
        
        % criterio di arresto: residuo
        if abs(fx) < tol 
            return
        
        if f(a) * fx < 0
            b = x;
        else
            a = x;
        end

        n = n + 1;
    end
    
    warning('Raggiunto il numero massimo di iterazioni.')
end