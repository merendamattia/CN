function [approx, num_iter] = newton(fun, dfun, x0, toll, max_iter)
    % fun: la funzione da trovare lo zero
    % dfun: la derivata della funzione f
    % x0: il punto di partenza dell'iterazione
    % toll: la tolleranza dell'errore
    % max_iter: il numero massimo di iterazioni
    
    x = x0;
    approx = [x];
    num_iter = 0;
    crit_arr = 1;
    
    % criterio di arresto: numero di iterazioni + residuo
    while(num_iter < max_iter && crit_arr > toll)
        num_iter = num_iter + 1;

        x_next = x - (fun(x) / dfun(x));
        
        approx = [approx; x_next];
        
        %crit_arr = abs(x_next - x); % criterio incremento
        crit_arr = abs(fun(x_next)); % criterio residuo
        
        x = x_next;
    end
end
    