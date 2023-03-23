% Es. 4
clear
clc
format short;
x = 10.^[0:10];
y1 = x .* (sqrt( x.^2 + 1 ) - x );
y2 = x .* sqrt( x.^2 + 1 ) - x.^2 ;
y3 = x ./ (sqrt( x.^2 + 1 ) + x );
z = [y1; y2; y3]';


% Es. 5
clear
clc
V = -2 * ones(9,1);
W = ones(8,1);
A = diag(V, 0) + diag(W, 1) + diag(W, -1);

tmp = A(3, 1:9); % invece dell'intervallo '1:9' si può usare direttamente ':'
A(3, 1:9) = A(6, 1:9);
A(6, 1:9) = tmp;

tmp = A(1:9, 1);
A(1:9, 1) = A(1:9, 4);
A(1:9, 4) = tmp;


% Es. 6
clear
clc

A = [1:4; 5:8; 9:12];

size(A); % stampa la dimensione della matrice, righe e colonne
B = A .* A; % prodotto elemento per elemento
% B = A * A; % errore: non fa il prodotto riga e colonna perchè non è una matrice quadrata
B = A' * A;
A(1:2,4)  % stampa gli elementi di colonna 4 delle righe 1 e 2
A(:,3) % stampa tutte le righe della colonna 3
A(1:2, :) % stampa tutte le colonne delle righe 1 e 2
A(: , [2 4]) % stampa tutte le righe delle colonne 2 e 4
A([2 3 3]) % stampa gli elementi di riga 2 e 3 della colonna 1, da evitare crea confusione
A(3,2) = A(1,1); % copia il valore di A(1,1) in A(3,2)
A(1:2,4) = zeros (2,1) % imposta il valore 0 nelle celle di riga 1 e 2 di colonna 4
A(2,:) = A(2,:) - A(2,1) / A(1,1) * A(1,:) % imposta un nuovo valore per tutta la riga 2