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
