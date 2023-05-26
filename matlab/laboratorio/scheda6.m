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

% funzione cheb() senza cicli
function [x] = cheb(a, b, n)
	
	% a: estremo sx dell'intervallo
	% b: estremo dx dell'intervallo
	% n: grado

	i = 0 : 1 : n;
	cos_ = ((2.*i+1)./(2.*n+2)).*pi
	x = (a+b)/2 - (b-a)/2 .* cos(cos_);

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

l = legend
l.Location = 'northwest';

errore = norm(poly_norm - poly_tilde)

% ----------------------------------------------------------------------
% Es. 5
clear
clc
close all

a = -1;
b = 1;
n = 20; % numero nodi
degree = n - 1; % grado per polyfit

f = @(x) exp(x) + 1;
dominio_f = linspace(a, b, 100);
immagine_f = f(dominio_f);

% x_punti = linspace(a, b, n);
x_punti = cheb(a, b, degree); % Ripetere l%esercizio usando i nodi di Chebyshev
y_punti = f(x_punti);

display(x_punti)

coeff_f = vander(x_punti) \ y_punti'; % coeff. del polin. inter. calcolati con Vander

immagine_f_tilde = [];

for i = 1 : n
    epsilon = (-1)^i * 10^-5;
    tmp = f(x_punti(i)) + epsilon;

    immagine_f_tilde = [immagine_f_tilde tmp];
end

coeff_f_tilde = vander(x_punti) \ immagine_f_tilde'; % coeff. del polin. inter. perturbato

% Confrontare i grafici dei polinomi p(x) e pˆ(x).
figure
hold on
grid on

c = plot(dominio_f, immagine_f, 'DisplayName', 'f(x)');
c.Color = 'black';

c = plot(x_punti, polyval(coeff_f, x_punti), '--', 'DisplayName', 'p(x)');
c.Color = 'red';

c = plot(x_punti, polyval(coeff_f_tilde, x_punti), '--', 'DisplayName', 'p(x) perturbato');
c.Color = 'green';

c = plot(x_punti, y_punti, '*', 'DisplayName', 'nodi');
c.Color = 'blue';
legend

% max|a_i - a^_i|
max_coeff = norm(coeff_f - coeff_f_tilde, inf);
display(max_coeff);

% max|p(t) - p^(t)|
t = linspace(a, b, 101);
max_p = norm(polyval(coeff_f, t) - polyval(coeff_f_tilde, t), inf);
display(max_p);

% Utilizzando i nodi di Cheb avremo un'approssimazione migliore rispetto
% all'utilizzo di nodi equidistanti

% ----------------------------------------------------------------------
% Es. 6
clear
clc
close all

f = @(x) sqrt(x);

% x = [0.49, 0.64, 0.81]; % nodi
x = [0.36, 0.49, 0.64, 0.81]; % nodi
y = f(x); % immagine nodi

n = length(x); % numero nodi
degree = n - 1; % grado 

coeff_x = polyfit(x, y, degree);

dom_f = linspace(0, 1, 100);

imm_lagrange = polyval(coeff_x, dom_f);
imm_sqrt = f(dom_f);

a = 0.6;
imm_a = polyval(coeff_x, a);
scarto = abs(imm_a - sqrt(a))

figure
grid on
hold on
l = legend;
l.Location = 'southeast';

c = plot(dom_f, imm_lagrange, 'DisplayName', 'p(x) Lagrange');
c.Color = 'blue';

c = plot(dom_f, imm_sqrt, 'DisplayName', 'y = sqrt(x)');
c.Color = 'red';

c = plot(x, y, '*', 'DisplayName', 'nodi');
c.Color = 'black';

% Versione con tabella delle differenze divise (di Newton)
% radice da calcolare
x = 0.6;

% nodi
x_0 = 0.49;
x_1 = 0.64;
x_2 = 0.81;

y_0 = 0.7; 
y_1 = 0.8;
y_2 = 0.9;

yy_01 = (y_1 - y_0)/(x_1-x_0); 
yy_12 = (y_2 - y_1)/(x_2-x_1); 

yyy_012 = (yy_12 - yy_01)/(x_2-x_0); 

p_x = y_0 + yy_01*(x-x_0) + yyy_012*(x-x_0)*(x-x_1);

sq = sqrt(x);
x_nodi = [x_0 x_1 x_2];
y_nodi = [y_0 y_1 y_2];
nNodi = 3;
pf = polyfit(x_nodi, y_nodi, nNodi-1);
pv = polyval(pf, x);

v = [p_x sq pv]

err_px = abs(p_x-sq)

% aggiungo un nodo

x_3 = 0.36;
y_3 = 0.6;

yy_23 = (y_3 - y_2)/(x_3-x_2); 
yyy_123 = (yy_23 - yy_12)/(x_3-x_1);
yyyy_0123 = (yyy_123 - yyy_012)/(x_3 - x_0); 

p_x = p_x + yyyy_0123*(x - x_0)*(x - x_1)*(x - x_2);

err_px = abs(p_x-sq)

% ----------------------------------------------------------------------