% Es. 1
% Fattorizzazione LU
clear
clc
close all

% Condizione: determinanti dei minori principali diversi da 0

format rat

n = 5; % dimensione matrice A
epsilon = 1 * 10^(-8); % tolleranza

D = 2 * [1 : n];
C = [1 : n-1];

A = diag(D) + diag(C, 1) + diag(C, -1);

det_sub_matrix = [1];

% A = zeros(n); Serve per verificare il controllo del determinante della
% sottomatrice diverso da zero

for i = 1 : n
    sub_matrix = A(1 : i, 1 : i);
    det_sub_matrix = [det_sub_matrix det(sub_matrix)];

    if det_sub_matrix < epsilon
        warning('Errore! Divisione per 0!');
        return;
    end
end

U = diag(diag(A,1), 1);
L = eye(n);

for i = 1 : n
    % Costruisco la matrice U
    U(i, i) = det_sub_matrix(i+1) / det_sub_matrix(i);

    if (i <= n - 1)
        % Costruisco la matrice L
        L(i+1, i) = A(i+1, i) * det_sub_matrix(i) / det_sub_matrix(i + 1);
    end
end

fprintf('Determinanti dei minori principali =\n');
disp(det_sub_matrix');

fprintf('L =\n');
disp(L);

fprintf('U =\n');
disp(U);

fprintf('L*U =\n');
disp(L*U);

fprintf('A =\n');
disp(A);

% ----------------------------------------------------------------------

% Es. 2
% Le funzioni trianginf e triangsup si trovano in 
% ./matlab/algoritmi/sostituzioni_successive/
clear
clc
close all

format rat 

A1 = [10 0 0 0; 8 9 0 0; 5 6 7 0; 1 2 3 4];
A2 = [10 0 0 0; 8 9 0 0; 5 6 0 0; 1 2 3 4];
A3 = [1 2 3 4; 0 9 8 7; 0 0 3 9; 0 0 0 4];
b = [10 17 18 10]';

x_calculated = trianginf(A1, b);
x_matlab = A1 \ b;
test1 = [x_calculated x_matlab] % true

% x_calculated = trianginf(A2, b); % restituisce errore perche A2 non è una matrice triangolare inferiore
% x_matlab = A2 \ b;
% test2 = [x_calculated x_matlab]; % false

x_calculated = triangsup(A3, b);
x_matlab = A3 \ b;
test3 = [x_calculated x_matlab] % true

% ----------------------------------------------------------------------

% Es. 4

clear
clc
close all

A = [2 3 1; 1 -1 1; 0 2 2];
B = [1 2 1; -1 2 -1; 2 0 2];
C = [1 0 1; 0 1 1; 1 0 2];

% (a) Calcolare AB e BA e mostrare che AB != BA
fprintf('\n');
fprintf('(a) Calcolare AB e BA e mostrare che AB != BA\n');
fprintf('AB =\n');
display(A*B);
fprintf('BA =\n');
display(B*A);

% (b) Confrontare (A + B) + C e A + (B + C)
fprintf('\n');
fprintf('(b) Confrontare (A + B) + C e A + (B + C)\n');
fprintf('(A + B) + C =\n');
display((A + B) + C);
fprintf('A + (B + C) =\n');
display(A + (B + C));

% (c) Confrontare A(BC) e (AB)C
fprintf('\n');
fprintf('(c) Confrontare A(BC) e (AB)C\n');
fprintf('A(BC) =\n');
display(A * (B * C));
fprintf('(AB)C =\n');
display((A * B) * C);

% (d) (d) Confrontare (AB)' e B' * A'
fprintf('\n');
fprintf("(d) Confrontare (AB)' e B' * A'\n");
fprintf("(AB)' =\n");
display((A * B)');
fprintf("B' * A' =\n");
display(B' * A');

% ----------------------------------------------------------------------

% Es. 5

clear 
clc
close all

n = 50;
res_det = [];
res_cond= [];

for i = 1 : n
    A = scheda5_es5_function(i);
    res_det = [res_det det(A)];
    res_cond = [res_cond cond(A)];
end

figure

x = [1 : n];

subplot(1, 2, 1);
plot(x, res_det, 'DisplayName', 'det');
grid on
legend

subplot(1, 2, 2);
plot(x, res_cond, 'DisplayName', 'cond');
grid on
legend

% function scheda5_es5_function originale
function [A] = scheda5_es5_function(n)
    
    A = zeros(n,n);

    for i = 1 : n
        for j = 1 : n
            if ((j + i) == (n + 1))
                A(i,j) = 2;
            end
            if ((j + i) == n)
                A(i,j) = -1;
            end
            if ((j + i) == (n + 2))
                A(i,j) = -1;
            end
        end
    end
end

% function scheda5_es5_function ottimizzata
function [A] = scheda5_es5_function(n)
    
    % matrice d'appoggio
    matrix = zeros(n, n);
    % diagonale principale
    dp = 2*ones(n, 1);
    % diagonale secondaria
    ds = -1*ones(n-1, 1);
    
    matrix = matrix + diag(dp) + diag(ds, -1) + diag(ds, 1);
    
    % crea la matrice a inserendo le righe della matrice di appoggio matrix partendo da i = n
    A=[];
    for i=n:-1:1
        A=[A; matrix(i, :)];
    end
end

% ----------------------------------------------------------------------

% Es. 6

clear
clc 
close all

A = hilb(1000);
B = rand(1000);
x = ones(1000,1);
y = x;

b = A*x;
c = B*y;

% Calcolo x e y con mldivide
x2 = A\b;
y2 = B\c;

condA = cond(A);
condB = cond(B);

erA = norm(x2-x)/norm(x);
erB = norm(y2-y)/norm(y);

condizionamento = [];
erA2 = [];

for i = 2:50
    A = hilb(i);
    x = ones(i, 1);
    b = A*x;
    x2 = A\b;
    erA2 = [erA2 norm(x2-x)/norm(x)];

    condizionamento = [condizionamento cond(A)];
end

semilogy(2:50,condizionamento);
title("Condizionamento")
figure
semilogy(2:50, erA2);
title("Errore relativo")

