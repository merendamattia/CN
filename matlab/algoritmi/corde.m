function [x, resVect, nIter] = corde(f, a, b, x0, t, maxIter, print)
    
    %{
    - f: funzione
    - a: inizio intervallo
    - b: fine intervallo
    - x0: punto di innesco dell'iterazione
    - t: tolleranza
    - maxIter: numero massimo di iterazioni
    - x: x approssimata
    - resVect: vettore dei risultati
    - nIter: numero dell'iterazione
    - print: flag per fprintf
    %}
   
    x = x0;
    nIter = 0;
    resVect = [x];
    
    while(nIter < maxIter && abs(f(x)) > t)
        if(print > 0)
            fprintf("\nInterazione numero: %i, valore di x: %e", nIter, x);
        end
        nIter = nIter + 1;
        x = x - (b-a)/(f(b)-f(a))*f(x);
        resVect = [resVect; x];
    end
    if(print > 0)
        fprintf("\n");
    end
end

