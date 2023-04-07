clear
clc

format rat 

A1 = [10 0 0 0; 8 9 0 0; 5 6 7 0; 1 2 3 4];
A2 = [10 0 0 0; 8 9 0 0; 5 6 0 0; 1 2 3 4];
A3 = [1 2 3 4; 0 9 8 7; 0 0 3 9; 0 0 0 4];
b = [10 17 18 10]';

x_calculated = trianginf(A1, b);
x_matlab = A1 \ b;
test1 = [x_calculated x_matlab]; % true

% x_calculated = trianginf(A2, b); % restituisce errore perche A2 non è una matrice triangolare inferiore
% x_matlab = A2 \ b;
% test2 = [x_calculated x_matlab]; % false

x_calculated = triangsup(A3, b);
x_matlab = A3 \ b;
test3 = [x_calculated x_matlab]; % true


% ------------------------------------------------------
% Esempi visti a lezione

% Esempio 1
A = [3 2; -1 2];
b = [18; 2];
x = A \ b; % x = [4; 3]
rcond_1 = rcond(A);

% Esempio 2
A = [-1/2 1; -1/2 1];
b = [1; 1/2];
x = A \ b; % x = -Inf ~ non esistono soluzioni
rcond_2 = rcond(A);

% Esempio 3
A = [-2.3/5 1; -1/2 1];
b = [1.1; 1];
x = A \ b; % x = [2.5; 2.25]
rcond_3 = rcond(A);

% Esempio 4
A = [-1/2 1; -1 2];
b = [1; 2];
x = A \ b; % x = NaN ~ esistono infinite soluzioni
rcond_4 = rcond(A);