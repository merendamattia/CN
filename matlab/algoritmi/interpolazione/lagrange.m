% http://www.swappa.it/wiki/Uni/AN-Matlab-Lagrange

% Metodo di Lagrange
% ------------------
% restituisce un vettore pl (il polinomio di Lagrange)
% richiede tre vettori come parametri, che contengono le 
% coordinate x e y dei punti da interpolare, e l'insieme 
% dei valori di x che si trovano nell'intervallo

function [pl] = lagrange(xnodi, ynodi, x)
    % ricavo il numero di nodi
    n = length(xnodi);

    % inizializzo il polinomio di Lagrange a 0
    pl = 0;

    % polinomio L_i
    L = [];
    
    % calcolo i polinomi della base associati al nodo i
    for i = 1 : n
        
        % applico la proprietà L_i [x_i] = 1
        L(i) = 1;
        
        % calcolo le altre L_i
        for j = 1 : n
            
            % faccio la produttoria di tutti i nodi j, con j diverso da i
            if (j ~= i)
                L(i) = L(i) * (x - xnodi(j)) / (xnodi(i) - xnodi(j)); 
            end
        end
    end
    
    % formo il polinomio di Lagrange, dato dalla sommatoria
    %   dei prodotti delle y(i) per i polinomi della base
    pl = sum(L .* ynodi);
end