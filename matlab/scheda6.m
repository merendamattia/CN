% Es. 1 
clear
clc
close all

n = 5; % grado
a = 0; % start
b = 2; % fine

f = @(x) exp(x) .* sin(2 * x);

dominio_f = linspace(a, b, 100);
immagine_f = f(dominio_f);

figure
c = plot(dominio_f, immagine_f, 'DisplayName', 'f(x)');
c.Color = 'red';

legend
grid on
hold on

x = linspace(a, b, n + 1);
y = f(x);

c = plot(x, y, '*', 'DisplayName', 'nodi');
c.Color = 'blue';

p = polyfit(x, y, n); % coeff. polinomio interpolatore
g = linspace(a, b);

h = polyval(p, g);

plot(dominio_f, h, '--', 'DisplayName', 'p(x)');

errore = norm(h - immagine_f)

% ----------------------------------------------------------------------
% Es. 2
clear
clc
close all

n = 10; % grado
a = -5; % start
b = 5; % fine

f = @(x) 1 ./ (1 + x.^2); % funzione di Runge

dominio_f = linspace(a, b, 100);
immagine_f = f(dominio_f);

figure
c = plot(dominio_f, immagine_f, '--', 'DisplayName', 'f(x)');
c.Color = 'red';

legend
grid on
hold on

x = linspace(a, b, n + 1);
y = f(x);

c = plot(x, y, '*', 'DisplayName', 'nodi');
c.Color = 'blue';

p = polyfit(x, y, n); % coeff. polinomio interpolatore

h = polyval(p, dominio_f); % immagine interpolatore

plot(dominio_f, h, '--', 'DisplayName', 'p(x)');

errore_p = norm(h - immagine_f)


% Parte 2 - Chebyshev

x = cheb(a, b, n);
y = f(x);

c = plot(x, y, '*', 'DisplayName', 'nodi cheb');
c.Color = '#006400';

p = polyfit(x, y, n); % coeff. polinomio interpolatore

h = polyval(p, dominio_f); % immagine interpolatore

c = plot(dominio_f, h, '--', 'DisplayName', 'cheb(x)');
c.Color = 'black';

errore_cheb = norm(h - immagine_f) % errore con Chebyshev

% funzione cheb()
function [y] = cheb(a, b, n)
    % n: grado
    % a: estremo sx intervallo
    % b: estremo dx intervallo
    
    y = [];
    for i = 0 : n
        arg_cos = (2 * i + 1) / (2 * n + 2) * pi;
        tmp = (a + b) / 2 - (b - a) / 2 * cos(arg_cos);
        y = [y tmp];
    end
end


% ----------------------------------------------------------------------
