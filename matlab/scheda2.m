% Es. 4
clear
clc
format short;
x = 10.^[0:10];
y1 = x .* (sqrt( x.^2 + 1 ) - x );
y2 = x .* sqrt( x.^2 + 1 ) - x.^2 ;
y3 = x ./ (sqrt( x.^2 + 1 ) + x );
z = [y1; y2; y3]';
% ------------------------------------------

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
% ------------------------------------------

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
% ------------------------------------------

% Es. 7 
clear 
clc

dim = 8;

% punto A
X = ones(1,dim);
Y = (1:dim);

A = X.*Y';

S = triu(A);
I = tril(A);

% punto B
for i=1:dim
    S(i,i) = 0;
    I(i,i) = 1;
end

B1 = zeros(8);
B2 = zeros(8);
B3 = zeros(8);

for i = 1 : 8
    B1(i,i) = A(i,i);
    B2(i,i) = A(i,i);
    B3(i,i) = A(i,i);
end

for i = 1 : 7
    B2(i, i + 1) = A(i, i + 1);
    B3(i + 1, i) = A(i + 1, i);
end

% ------------------------------------------

% Es. 8
% file es_8.m
function [sol, controllo, errore] = es_8(a);

    p = (10.^a)';
    b = (1 + p.^2)./p; % se a molto grande -> b tende a p
    
    t_pos = (b + sqrt(b.^2 - 4)) / 2;
    t_neg = (b - sqrt(b.^2 - 4)) / 2; % quindi b^2 è circa p^2
    
    sol = [-sqrt(t_pos) sqrt(t_pos) -sqrt(t_neg) sqrt(t_neg)];
    controllo = [-sqrt(p) sqrt(p) -sqrt(1/p) sqrt(1/p)];
    errore = abs( abs( sol - controllo ) ./ controllo );
    
end

% file scheda2_es8.m
clear
clc

% a = [1 : 1: 10];
a = 10;
[sol, controllo, errore] = es_8(a);
[sol; controllo; errore]
% ------------------------------------------