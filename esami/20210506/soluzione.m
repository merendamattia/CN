clear
clc
close all

format long

n = 5;
alpha = 3;

A = esame_20210506_make_A(n, alpha);

% Esercizio 2
x = ones(n, 1);
b = A * x;
x_new = esame_20210506_avanti(A,b);

% Esercizio 3
n = 10;
x = ones(n, 1);

n_cond = [];
n_err = [];
dominio_es3 = [];

for k = 1 : 10
    alpha = 10^k;
    A = esame_20210506_make_A(n, alpha);
    b = A * x;

    n_cond = [n_cond, cond(A, inf)];

    x_new = esame_20210506_avanti(A,b);

    n_err = [n_err, norm(x_new - x, inf)];

    dominio_es3 = [dominio_es3, alpha];
end

figure
hold on

subplot(2,2,1);
semilogy(dominio_es3, n_cond, 'DisplayName', 'n cond');
grid on
title('condizionamento A es3');
xlabel('alpha = 10^k , k = 1, ..., n')
ylabel('cond(A)')

subplot(2,2,2);
hold on
plot(dominio_es3, n_err, 'DisplayName', 'n err');
grid on
title('errore es3');
xlabel('k = 1, ..., n')


% Esercizio 4
alpha = 10;

n_cond = [];
n_err = [];

for i = 1 : 10
    n = i * 10;
    x = ones(n, 1);
    
    A = esame_20210506_make_A(n, alpha);
    b = A * x;

    n_cond = [n_cond, cond(A, inf)];

    x_new = esame_20210506_avanti(A,b);

    n_err = [n_err, norm(x_new - x, inf)];
end

dominio_es4 = [10:10:100];


hold on

subplot(2,2,3);
semilogy(dominio_es4, n_cond, 'DisplayName', 'n cond');
grid on
title('condizionamento A es4');
xlabel('n')
ylabel('cond(A)')

subplot(2,2,4);
hold on
plot(dominio_es4, n_err, 'DisplayName', 'n err');
grid on
title('errore es4');
xlabel('n')
