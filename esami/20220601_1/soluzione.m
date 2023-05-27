clear
clc
close all

% Esercizio 1
% Una formula di quadratura di tipo interpolatorio è un metodo numerico per approssimare l'integrale di una funzione 
% definita su un intervallo. Questo tipo di formula si basa sull'idea di approssimare la funzione con un polinomio 
% interpolante e calcolare l'integrale di tale polinomio anziché dell'intera funzione.
% Il processo per ottenere una formula di quadratura di tipo interpolatorio comprende i seguenti passaggi:
% 1. Selezione dei punti di interpolazione: Si scelgono opportunamente dei punti nell'intervallo di integrazione. 
%   Questi punti, chiamati nodi, possono essere equispaziati o determinati da altre distribuzioni, come i nodi 
%   di Chebyshev o di Gauss.
% 2. Costruzione del polinomio interpolante: Utilizzando i punti di interpolazione, si costruisce un polinomio che 
%   passa per tali punti. Un approccio comune per ottenere il polinomio interpolante è utilizzare il metodo dei 
%   polinomi di Lagrange o il metodo di Newton.
% 3. Calcolo dei pesi: Una volta che il polinomio interpolante è determinato, si calcolano i pesi corrispondenti 
%   a ciascun punto di interpolazione. I pesi determinano l'importanza relativa di ciascun punto nel calcolo dell'integrale.
% 4. Calcolo dell'integrale approssimato: Utilizzando i punti di interpolazione e i pesi corrispondenti, si calcola 
%   l'integrale approssimato del polinomio interpolante. Questo viene fatto sommando i contributi dei punti di 
%   interpolazione moltiplicati per i rispettivi pesi.

% Esercizio 2
% La formula del punto medio semplice per definire un integrale definito è
% definita da Q[f] = f((a+b)/2)*(b-a). Questa formula ha grado di esattezza
% pari a 1 in quanto integra esattamente tutti i polimomi con grado <= 1 ed
% esiste almento un polinomio di grado 2 che non viene integrato
% correttamente.

% Esercizio 3
a_3 = - (pi / 2);
b_3 = pi / 2;
f = @(x) sin(x);

dominio_f = linspace(a_3, b_3, 100);
immagine_f = f(dominio_f);

q_3 = f( (a_3 + b_3) / 2) * (b_3 - a_3)
% in questo caso la formula applicata è corretta, in quanto l'integrale è
% uguale a 0

% Esercizio 4
a_4 = 0;
b_4 = pi;

dominio_f_4 = linspace(a_4, b_4, 100);
immagine_f_4 = f(dominio_f_4);

q_4 = f( (a_4 + b_4) / 2) * (b_4 - a_4)
% in questo caso l'approssimazione non è corretta, in quanto il valore esatto 
% dell'integrale è pari a 2.

% Esecizio 5
% La formula del punto medio composita è pari a Q[f] = H * sum( f( ((x(1 : m) + x(2 : m + 1)) / 2) ) );
% dove H = (b - a) / m. In poche parole andiamo a dividire l'intervallo su
% cui dobbiamo integrare la funzione in m+1 sotto intervalli, in modo tale
% da poter applicare la formula del punto medio in ogni sotto intervallo,
% per poi infine sommare i risultati finali.

% Esercizio 6
m = 100; % sotto-intervalli
q_6 = esame_20220601_1_pto_medio_composita(f, a_4, b_4, m)

% Esercizio 7
res = [1 q_4];
for i = 1 : 20
    m = i * 4;
    res = [res; m, esame_20220601_1_pto_medio_composita(f, a_4, b_4, m)];
end

res

% ------
function [q] = esame_20220601_1_pto_medio_composita(f, a, b, m)
    x = linspace(a, b, m + 1);
    H = (b - a) / m;
    q = H * sum( f( ((x(1 : m) + x(2 : m + 1)) / 2) ) )
end
% ------

% -------------------------------------------
% Disegni
figure
hold on
grid on

subplot(1,2,1);
% f(x) es 3
c = plot(dominio_f, immagine_f, 'DisplayName', 'sin(x)');
c.Color = "black";
hold on

% Punto medio
c = plot((a_3 + b_3) / 2, f((a_3 + b_3) / 2), '*', 'DisplayName', 'pto medio');
c.Color = 'blue';
hold on

% Estremi
c = plot(a_3, f(a_3), '*', 'DisplayName', '- (pi / 2)');
c.Color = 'red';
c = plot(b_3, f(b_3), '*', 'DisplayName', '+ (pi / 2)');
c.Color = 'red';
hold on

l = legend;
l.Location = 'northwest';


subplot(1,2,2);
% f(x) es 4
c = plot(dominio_f_4, immagine_f_4, 'DisplayName', 'sin(x)');
c.Color = "black";
hold on

% Punto medio
c = plot((a_4 + b_4) / 2, f((a_4 + b_4) / 2), '*', 'DisplayName', 'pto medio');
c.Color = 'blue';
hold on

% Estremi
c = plot(a_4, f(a_4), '*', 'DisplayName', '0');
c.Color = 'red';
c = plot(b_4, f(b_4), '*', 'DisplayName', 'pi');
c.Color = 'red';
hold on


l = legend;
l.Location = 'northwest';