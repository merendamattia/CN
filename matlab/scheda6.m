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
% Es. 3
clear
clc
close all

a = -3;
b = 3;

% f = @(x) exp(x) .* cos(4 * x); % PARTE 1
f = @(x) abs(x - 1); % PARTE 2

dominio_f = linspace(a, b, 100);
immagine_f = f(dominio_f);

hold on
c = plot(dominio_f, immagine_f, 'DisplayName', 'f(x)');
c.Color = '#BF40BF';
legend

n = 20; % degree

x = linspace(a, b, n); % Mi servono n + 1 punti
y = f(x);

coeff_f = polyfit(x, y, n - 1); % coefficienti del polinomio interpolatore calcolati con polyfit
pippo = vander(x); % matrice di Vandermonde calcolata su x
res = pippo \ y'; % coeff. del pol. interp. calcolati con la matrice di Vande.

errore = norm(coeff_f - res'); % errore assoluto 

topolino = polyval(coeff_f, dominio_f); % valori interpolati del polinomio

hold on
c = plot(dominio_f, topolino, '--', 'DisplayName', 'p(x)');
c.Color = 'black';
legend

hold on
c = plot(x, y, '*', 'DisplayName', 'coeff. pol. inter.');
c.Color = 'blue';
legend


% All'aumentare del numero dei nodi avremo che l'errore tenderà a 0
% perchè il grado delle n derivare rimane sempre lo stesso.

% ----------------------------------------------------------------------
% Es. 4
clear
clc
close all

a = -1;
b = 1;

f = @(x) sin(x);
dominio_f = linspace(a, b, 100);

n = 22; % numero nodi
degree = n - 1; % grado polinomio

pippo = linspace(a, b, n);

f_tilde = [];
f_normale = [];

for i = 1 : n
    tmp_normale = f(pippo(i));
    f_normale = [f_normale tmp_normale];

    tmp_tilde = f(pippo(i)) * (1 + (-1)^i * 10^-4);
    f_tilde = [f_tilde tmp_tilde];
end

coeff_normale = polyfit(pippo, f_normale, degree);
coeff_tilde = polyfit(pippo, f_tilde, degree);

griglia = linspace(a, b, 100);

poly_norm = polyval(coeff_normale, griglia);
poly_tilde = polyval(coeff_tilde, griglia);

hold on
c = plot(dominio_f, poly_norm, 'DisplayName', 'poly norm');
c.Color = 'black';
legend

hold on
c = plot(dominio_f, poly_tilde, 'DisplayName', 'poly tilde');
c.Color = 'red';
legend

hold on
c = plot(pippo, f_normale, '*', 'DisplayName', 'nodi');
c.Color = 'blue';
legend

errore = norm(poly_norm - poly_tilde)
