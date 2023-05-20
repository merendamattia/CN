% http://www.swappa.it/wiki/Uni/AN-Matlab-Lagrange

% Metodo di Lagrange
% ------------------
% restituisce un vettore pl (il polinomio di Lagrange)
% richiede tre vettori come parametri, che contengono le 
%   coordinate x e y dei punti da interpolare, e l'insieme 
%   dei valori di x che si trovano nell'intervallo
function [pl] = lagrange(xnodi, ynodi, x)
    % ricavo il numero di nodi
    n = length(xnodi);
    % inizializzo il polinomio di Lagrange a 0
    pl = 0;
    % calcolo i polinomi della base associati al nodo i
    for i = 1 : n
        % applico la proprietà L_i [x_i] = 1
        L(i) = 1;
        % calcolo le altre L_i
        for j = 1 : n
            % faccio la produttoria di tutti i nodi j, con j diverso da i
            %   A                     B                    C
            %--------         ----------------     -----------------
            if (j ~= i)
                L(i) = L(i) * (x - xnodi(j)) / (xnodi(i) - xnodi(j)); 
            end
            % spieghiamo a cosa corrispondono le varie parti:
            % A = condizione che j deve essere diverso da i
            % B = (x - x(j))
            % C = (x(i) - x(j))
        end
    end
    % formo il polinomio di Lagrange, dato dalla sommatoria
    %   dei prodotti delle y(i) per i polinomi della base
    pl = sum(L .* ynodi);
    
    % esempio di utilizzo:
    % 
    % % definisco gli estremi dell'intervallo
    % estremoA = 2;
    % estremoB = 5;
    % % definisco il numero di nodi da interpolare
    % nodi = 4;
    % % utilizzo la funzione linspace per generare un vettore x
    % %   con 'nodi' elementi compresi tra 'estremoA' e 'estremoB'
    % x = linspace(estremoA,estremoB,nodi);
    % % definisco una funzione da applicare alle x
    % y = sin(x);
    % % genero un vettore z con tutti i punti dell'intervallo
    % z = estremoA:0.01:estremoB;
    % % genero il polinomio di lagrange
    % for i=1:length(z),
    %   pz(i) = lagrange(x,y,z(i));
    % end
    % % disegno il grafico che mi mostra la funzione, il
    % % polinomio interpolatore e i nodi
    % xdis = z; 
    % ydis = sin(xdis);
    % plot(xdis,ydis,'r:',z,pz,'b-.',x,y,'r*');