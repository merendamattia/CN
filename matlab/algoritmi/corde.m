function [x, iter] = metodo_corde(f, x0, x1, tol, max_iter)
    % Calcola l'approssimazione della radice della funzione f(x) mediante il metodo delle corde
    %
    % Input:
    %   - f: la funzione di cui si cerca la radice
    %   - x0, x1: i due punti di partenza per l'interpolazione lineare
    %   - tol: la tolleranza dell'errore assoluto per la convergenza
    %   - max_iter: il numero massimo di iterazioni consentite
    %
    % Output:
    %   - x: l'approssimazione della radice
    %   - iter: il numero di iterazioni effettuate
    %
    
    % Inizializzazione delle variabili
    iter = 0;
    x = x0;
    
    % Calcolo dei valori iniziali della funzione nei due punti di partenza
    f0 = f(x0);
    f1 = f(x1);
    
    % Ciclo principale dell'algoritmo
    while (iter < max_iter)
        
        % Calcolo dell'intersezione della retta con l'asse delle ascisse
        x = x0 - f0/(f1 - f0) * (x1 - x0);
        
        % Calcolo del valore della funzione nel nuovo punto
        fx = f(x);
        
        % Verifica della condizione di convergenza
        if (abs(fx) < tol)
            return;
        end
        
        % Aggiornamento dei valori dei punti di partenza
        if (fx * f0 < 0)
            x1 = x;
            f1 = fx;
        else
            x0 = x;
            f0 = fx;
        end
        
        % Aggiornamento del contatore delle iterazioni
        iter = iter + 1;
    end
    
    % Se l'algoritmo non converge entro il numero massimo di iterazioni consentite,
    % viene generato un messaggio di errore e restituita l'ultima approssimazione trovata
    warning('Metodo delle corde: limite di iterazioni raggiunto');
end
    