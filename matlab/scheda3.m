% Es. 1
% punto 1
clear
clc

x1 = linspace(0, 1, 101);
y1 = ( (1 - x1./24) ./ (1 + x1./24 + x1.^2./384)).^8;
plot(x1, y1);

% punto 2
clear
clc

x2_1 = linspace(-2, 0, 51);
y2_1 = (2 - x2_1.^2 ./ 2).^2;

x2_2 = linspace(0, 2, 50);
y2_2 = (x2_2.^2 ./ 2 + 2).^2;

figure

plot(x2_1, y2_1);

hold on;

plot(x2_2, y2_2);

hold off;

% punto 3
clear
clc

x3_1 = linspace(-pi, 0, 51);
y3_1 = exp(-x3_1.^2);

x3_2 = linspace(0, pi, 50);
y3_2 = cos(x3_2);

figure 

plot(x3_1, y3_1, 'b');

hold on;

plot(x3_2, y3_2, 'b');

hold off;
% ------------------------------------------

% Es. 2
% file scheda3_es2.m
clc
clear

subplot(2,3,1);
sc3_es2(1);

subplot(2,3,2);
sc3_es2(2);

subplot(2,3,3);
sc3_es2(3);

subplot(2,3,4);
sc3_es2(4);

subplot(2,3,5);
sc3_es2(5);

subplot(2,3,6);
sc3_es2(6);

% versione iterativa 
for i = 1 : 6
    subplot(2, 3, i);
    sc3_es2(i);
end;

% file sc3_es2.m
function [] = sc3_es2(m);

    x1 = linspace(-m, 0, 100);
    x2 = linspace(0, m, 100);
    
    y1 = (m - x1.^2./m).^m;
    y2 = (m + x2.^2./m).^m;
    
    plot([x1 x2], [y1 y2]);
        
end
% ------------------------------------------

% Es. 3
clear
clc

t = linspace(0, 2 * pi, 361);
x = 3 + 6 * cos(t);
y = 8 + 6 * sin(t);

figure
plot(x, y)