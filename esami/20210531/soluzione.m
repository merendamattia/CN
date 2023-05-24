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

