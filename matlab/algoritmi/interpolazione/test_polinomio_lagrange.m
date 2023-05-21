close all
clc
clear

% definisco gli estremi dell'intervallo
a = 1;
b = 5;

n = 10; % nodi da interpolare
degree = n - 1; % grado polyfit

f = @(x) sin(x);

% % utilizzo la funzione linspace per generare un vettore x
% %   con 'nodi' elementi compresi tra 'estremoA' e 'estremoB'

x = linspace(a, b, 100);

% % definisco una funzione da applicare alle x
y = f(x);

% % genero un vettore z con tutti i punti dell'intervallo
z = linspace(a, b, n);
% z = x;

% % genero il polinomio di lagrange
for i = 1 : length(z)
    p_lagrange(i) = lagrange(x, y, z(i));
end


figure
hold on

plot(x, y, 'red', 'DisplayName', 'f(x)');
legend

plot(z, p_lagrange, 'blue', 'DisplayName', 'p(x) Lagrange');
legend

c = plot(z, f(z), '*', 'DisplayName', 'nodi');
c.Color = 'black';
legend

coeff_polyfit = polyfit(z, f(z), degree);
valori_interpolati = polyval(coeff_polyfit, z);

c = plot(z, valori_interpolati, '--', 'DisplayName', 'p(x) polyfit');
c.Color = 'green';
legend

grid on

errore = norm(valori_interpolati - p_lagrange)

