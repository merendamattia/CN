%{
    Di Agostino Manuel
    manuel.diagostino@studenti.unipr.it
%}

clear
close all
clc

%% Esercizio 1

x = [0, pi/2, pi, 2*pi];
y = p(x,17);

%% Esercizio 2
x = linspace(-pi, pi, 200);
lim = 3; % numero di ripetizioni

plot(x,sin(x),'DisplayName', 'sin(x)');
axis equal
grid on
hold on

for i=1:lim
    name = strcat('p_', int2str(i), '(x)');
    plot(x, p(x,i),'DisplayName', name);
end
hold off;

lgd = legend;
lgd.NumColumns = int8((lim+1)/3)+1;

%% Esercizio 3
for i=1:lim
    e_a = abs(sin(x) - p(x,i));
    fprintf("e_{a%d} = %f \n",i , norm(e_a, 'inf'));
end
