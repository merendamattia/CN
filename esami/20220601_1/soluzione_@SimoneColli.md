
# 20220601 prova 1

_Esercizio 1_

Una formula di quadratura interpolatoria può essere utilizzata per approssimare un integrale definito. Questo metodo consiste nel sostituire l'integrale definito con una somma pesata dei valori della funzione approssimante nei punti di interpolazione.
I passi per ottenere una formula di quadratura interpolatoria per l'approssimazione di un integrale definito sono i seguenti:

1. Scegliere il polinomio interpolatore (esempio i polinomi di Lagrange). Questi saranno utilizzati per approssimare la funzione all'interno dell'intervallo d'integrazione.
2. Trovare dei punti di interpolazione all'interno dell'intervallo di integrazione.
3. Costruire il polinomio interpolatore passate per i punti trovati al passo precedente.
4. Calcolare i pesi relativi a ciascun punto d'interpolazione, questi permettono di attribuire un importanza a ciascun punto.
5. Calcolare l'approssimazione dell'integrale sostituendo l'integrale con una somma pesata dei valori della funzione approssimata al punto 3.

> Commento
> La precisione dell'interpolazione dipenderà dalla scelta dei nodi di interpolazione, dalla famiglia di polinomio interpolatore e dai pesi corrispondenti.
> Ovviamente un numero di nodi elevato, una famiglia di polinomi più precisa permetteranno un approssimazione più accurata



_Esercizio 2_

La formula semplice del punto medio, dati due estremi $a$ e $b$ consiste nell'approssimare l'integrale mediante la 'creazione' di un rettangolo che presenta l'altezza pari a $b-a$ e la base pari a $f((b-a)/2)$. Dopo aver creato questo rettangolo si va a calcolare l'area.

$$

	I_R =\dfrac{b-a}{2}\cdot f(\dfrac{a+b}{2})
$$
_Esercizio 3_

```c
clc;
clear;
close all;

% funzione
f = @(x) sin(x);

% estremi
a = -2*pi;
b = 2*pi;

% integrale
I = (b-a)*f((b+a)/2);


% disegno

plot(a-1:0.1:b+1, f(a-1:0.1:b+1), 'g');

hold on;

plot([a a], [0 f((b+a)/2)], 'b');

plot([a b], [f((b+a)/2) f((b+a)/2)], 'b');

plot([b b], [0 f((b+a)/2)], 'b');

plot([(b+a)/2 (b+a)/2], [0 f((b+a)/2)], 'r');
plot([a b], [0 0], 'r');
```

> Commento
> L'integrale esatto calcolato su matlab con la funzione `integral` restituisce il valore $9.9920e-16$, che data una tolleranza di $10^{-8}$ è considerabile 0.
> L'integrale calcolato a mano invece risulta come segue:

$$
\int_{-2\pi}^{2\pi} \sin{(x)}\quad dx = -cos(x)|_{-2\pi}^{2\pi} = -(-1+1) = 0
$$
 > Quindi il valore calcolato dalla formula del punto medio è corretta, perché $sin{(a)}=sin{(b)}=0$

_Esercizio 4_
```c
clc;
clear;
close all;

f = @(x) sin(x);

a = 0;

b = pi;

I = (b-a)*f((b+a)/2);

[I integral(f, a, b)]

plot(a-1:0.1:b+1, f(a-1:0.1:b+1), 'g');

hold on;

plot([a a], [0 f((b+a)/2)], 'b');

plot([a b], [f((b+a)/2) f((b+a)/2)], 'b');

plot([b b], [0 f((b+a)/2)], 'b');

plot([(b+a)/2 (b+a)/2], [0 f((b+a)/2)], 'r');

plot([a b], [0 0], 'r');
```

> Commento
> In questo caso il valore ottenuto è pari a $3.1416$ questo perché, come detto prima, la formula del punto medio va a 'creare' un rettangolo e ne calcola l'area.
> In questo modo viene compresa nel calcolo dell'integrale anche dell'area che non è effettivamente sottesa alla funzione, provocando quindi un errore in eccesso.
> Questo errore commesso può avvenire anche in difetto perché il rettangolo potrebbe escludere ad esempio calcolando l'integrale $\int_0^4 \sin{(x)}\ dx$ si può notare sia un errore in eccesso sia un errore in difetto.


_Esercizio 5_

La formula del punto medio composita utilizza la stessa logica della formula del punto medio, però aumentando il numero di intervalli in cui viene divisa la funzione. Per $n\to\infty$ l'errore tende a $0$.

_Esercizio 6_
```c
clc;
clear;
close all;

f = @(x) sin(x);

a = 0;

b = pi;

dom_f = -1-b : 0.1 : b+1;

img_f = f(dom_f);

plot(dom_f, img_f, 'r');

hold on;

h = b-a;

nIntervalli = 1000;

x = a : h/nIntervalli : b;

h = h/nIntervalli;

I = 0;

for i=1:nIntervalli

I = I + h*(x(1)+x(i+1))/2;

end

integral(f, a, b);
```

_Esercizio 7_
```c
clear;
clc;
close all;

nMax = 1000;

n = 1 : 1 : nMax;

values = [];

errors = [];

f = @(x) sin(x);

a = 0;

b = pi;

integ = integral(f, a, b);

for i=1 : nMax

I = puntoMedio(f, a, b, n(i));

values = [values I];

errors = [errors I-integ];

end

subplot(1, 2, 1);

plot(n, values, 'b', DisplayName='Valori calcolati');

hold on;

plot([n(1) n(nMax)], [integ integ], 'g', DisplayName='Valore esatto');

ylim([1 4]);

xlim([-100 1100]);

xlabel('numero intervalli');

legend;

subplot(1, 2, 2);

plot(n, errors, 'r', DisplayName='Errore');

ylim([-1 2]);

xlim([-100 1100]);

xlabel('numero intervalli');

legend;
```
