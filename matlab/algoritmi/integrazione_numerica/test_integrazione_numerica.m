clear
clc
close all

format long

a = 0;
b = 2 * pi;
m = 1000; % sotto intervalli

f = @(x) x .* exp(-x) .* cos(2 * x);

dominio_f = linspace(a, b);
immagine_f = f(dominio_f);

q_trap = trapezio(f, a, b) % formula trapezio
q_trap_composita = trapezio_composita(f, a, b, m) % formula trapezio composita

q_pto_medio = punto_medio(f, a, b) % formula punto medio
q_pto_medio_composita = punto_medio_composita(f, a, b, m) % formula punto medio composita

%{ 
figure 
grid on
hold on
legend
c = plot(dominio_f, immagine_f, 'DisplayName', 'f(x)');
c.Color = 'red';
%}