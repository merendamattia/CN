clear
clc
close all

a = -2;
b = 0.1;
f = @(x) sin(2 * x) + exp(x) + 1;

% Esercizio 1
nodi = [-2, -1.25, -0.7, 0.1];
n_nodi = length(nodi);
degree = n_nodi - 1;

dominio_f = linspace(a, b, 100);
immagine_f = f(dominio_f);

immagine_nodi = f(nodi);

coeff_f = polyfit(nodi, immagine_nodi, degree);
imm_coeff = polyval(coeff_f, dominio_f);


% Esercizio 2
figure
hold on 

c = plot(dominio_f, immagine_f, '--', 'DisplayName', 'f(x)');
c.Color = 'blue';

c = plot(dominio_f, imm_coeff, 'DisplayName', 'p(x)');
c.Color = 'red';

c = plot(nodi, f(nodi), '*', 'DisplayName', 'nodi');
c.Color = 'black';

legend
grid on


% Esercizio 3
dominio_griglia = linspace(a, b, 1000);
immagine_griglia = f(dominio_griglia);

imm_coeff_griglia = polyval(coeff_f, dominio_griglia);

errore_ass_interp = norm(imm_coeff_griglia - immagine_griglia, inf)


% Esercizio 4
coeff_minimi_quadrati = polyfit(nodi, immagine_nodi, 2);
imm_coeff_minimi_quadrati = polyval(coeff_minimi_quadrati, dominio_f);

c = plot(dominio_f, imm_coeff_minimi_quadrati, '--', 'DisplayName', 'min. quadrati');
c.Color = '#00cc00';


% Esercizio 5
imm_coeff_minimi_quadrati_griglia = polyval(coeff_minimi_quadrati, dominio_griglia);
errore_ass_min_quadrati = norm(immagine_griglia - imm_coeff_minimi_quadrati_griglia, inf)
% E' peggiore di quella di prima

% Esercizio 6
% integrale(f) = - cos(x)^2 + x + exp(x) ~= 2.25

% Esercizio 7
% coeff_f: coefficienti pol. interp. Lagrange

m = 500; % sotto-intervalli

x = linspace(a, b, m + 1);
immagine_f = f(x);

H = (b - a) / m;

% Formula Cavalieri-Simpson composita
q = immagine_f(1) + 2 * sum(immagine_f(2 : m)) + immagine_f(m + 1);
q = q * H / 2

q_lagrange = polyval(coeff_f, x(1)) + 2 * sum(polyval(coeff_f, x(2 : m))) + polyval(coeff_f, x(m + 1));
q_lagrange = q_lagrange * H / 2

errore_ass_integrazione_lagrange = norm(q - q_lagrange)

% Esercizio 8
% coeff_minimi_quadrati: coefficienti pol. ai minimi quadrati
q_min_quadrati = polyval(coeff_minimi_quadrati, x(1)) + 2 * sum(polyval(coeff_minimi_quadrati, x(2 : m))) + polyval(coeff_minimi_quadrati, x(m + 1));
q_min_quadrati = q_min_quadrati * H / 2

errore_ass_integrazione_min_quad = norm(q - q_min_quadrati)
