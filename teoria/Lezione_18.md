## Equazione del calore

$$
\begin{cases}
u''(x)=\dfrac{d^2u}{dx^2}(u)=f(x) \qquad sorgente\ di\ calore \\
x\in(0,\ 1)\\
u(0) = a\\
u(1)=b
\end{cases}
$$


Si può scrivere con lo sviluppo di Tailor
$$
F(x+h) = F(x) + hF'(x) + \dfrac{h^2}{2!}F''(x) + \dfrac{h^3}{x!}F'''(x)+o(h^4)
$$
$$
F(x-h) = F(x) - hF'(x) + \dfrac{h^2}{2!}F''(x) - \dfrac{h^3}{x!}F'''(x)+o(h^4)
$$
Sommo le 2 espressioni
$$
F(x+h) + F(x-h) = 2F(x)+h^2F''(x)+o(h^4)
\to
F''(x) = \dfrac{F(x+h) + F(x-h) - 2F(x)}{h^2}+\cancel{o(h^2)}
$$

È possibile costruire una griglia di N-1 punti e n sottointervalli:

$x_i = ih\qquad h=\dfrac{1}{N}$ con $i=0,\ \ldots,\ N$

Collocando nei punti interni $u''(x_i)=f(x_i)$ con $i=1,\ \ldots,\ N-1$

$$
u''(x_i)\approx\dfrac{u(x_{i-1})-2u(x_i)+u(x_i+1)}{h^2}+\cancel{o(h^2)}
$$

_Risolvo_
$$
u_i\approx u(x_i)\qquad
\begin{cases}
	u_{i-1}-2u_i+u_{i+1} = h^2f(x_i)\qquad i=1,\ \ldots,\ N-1\\
	u_0 = u(0) = a\\
	u_N = u(x_N) = b
\end{cases}

$$

Mi ritrovo con una matrice del tipo

$$
\left(
\begin{array}{cc}
	-2 & 1 & 0 & \ldots & 0\\
	1 & -2 & 1 & \ldots & 0\\
	0 & 1 & -2 & \ddots & \vdots\\
	0 & \ldots & \ddots & \ddots & \vdots\\
	0 & 0 & \ldots & 1 & -2
\end{array}
\right)\cdot
\left(
\begin{array}{cc}
u_1\\
u_2\\
u_3\\
\vdots\\
u_{N-1}\\
\end{array}
\right)=h^2
\left(
\begin{array}{cc}
f_1\\
f_2\\
f_3\\
\vdots\\
f_{N-1}\\
\end{array}
\right)
$$

---

## Approssimazione di dati e funzioni

Set di dati $(x_i, y_i)$ con $i = 1,\ \ldots,\ N$

#todo_grafico
Considerando $n+1$ punti $x_0,\ \ldots,\ x_n$ con $x_i\ne x_j$

Il problema dell'interpolazione consiste nel trovare un polinomio p di grado opportuno tale che $p(x_i) = y_i$. Così da definire ogni punto con una coppia di coordinate $(x_i,\ y_i)$

#todo_grafico

> Nota
> $p(x_i) = y_i$ si chiama condizione di interpolazione

#### Definizione

$x_i$ si dicono nodi di interpolazione.

_polinomio di grado 0_
$p(x_i) = a_0$

_polinomio di grado 1_
$p(x_i) = a_0 + a_1x_i$

_polinomio di grado 2_
$p(x_i) = a_0 + a_1x_i + a_2x^2_i$

_polinomio di grado m_
$p(x_i) = a_0 + a_1x_i + a_2x_i^2 + \ldots + a_mx_i^m$

Con:
- $a_j \in \mathbb{R}\qquad j=0,\ \ldots,\ m$
- $m + 1$ coefficienti incogniti
- $n + 1$equazioni

#### Osservazione

Se $n>m\to$ sisteama è sovradeterminato
Se $n<m\to$ sisteama è sottodeterminato
Se $n=m\to$ si dimostra che il isstema ha una sola soluzione

$$
\left(\begin{array}{cc}
1 & x_0 & x_0^2 & \ldots & x_0^n\\
1 & x_1 & x_1^2 & \ldots & x_1^n\\
\vdots & \vdots & \vdots & \ddots & \vdots\\
1 & x_n & x_n^2 & \ldots & x_n^n
\end{array}\right)
\cdot
\left(\begin{array}{cc}
a_0\\a_1\\ \vdots\\ a_n
\end{array}\right)
=
\left(\begin{array}{cc}
y_0\\ y_1\\ \vdots\\ y_n
\end{array}\right)
\left(\begin{array}{cc}
=p(x_0)\\=p(x_1)\\ \vdots\\=p(x_n)
\end{array}\right)
$$

La matrice sulla sinistra si chiama matrice di Vandermonde, `vander` in Mathlab

> Nota
> $det(V)\ne0$



#### Teorema
Dati $n+1$ punti con ascisse $x_0,\ \ldots,\  x_n$ e $x_i\ne x_j$ per $i\ne j$ e ordinate $y_0,\ \ldots,\  y_n$, allora esiste ed è unico il polinomio interpolatore di grado $n$.
$y_i = p(x_i)\qquad i=0,\ \ldots,\ n$


_Esempio problema_

$x_i = [300, 400, 500]$
$y_i = [0.616, 0.525, 0.457]$
$p(x) = a_0 + a_1x+a_2x^2$

Matrice:

$$
\left(\begin{array}{cc}
1 & 300 & 90000  \\
1 & 400 & 160000 \\
1 & 500 & 250000
\end{array}\right)
\cdot
\left(\begin{array}{cc}
a_0\\ a_1 \\ a_2
\end{array}\right)
=
\left(\begin{array}{cc}
0.161\\0.525\\0.457
\end{array}\right)
$$
#### Osservazione

La matrice di Vandermande ha condizionamenti molto elevati

#### Definizione

Polinomio interpolatore di forma di Lagrange
$$
p(x)=\displaystyle\sum_{i=0}^n{y_i}\mathcal{L}_i(x)
$$

Con $\mathcal{L}$ che corrisponde ai polinomi fondamentali di Lagrange.

$$
p(x_j)=y_j=\displaystyle\sum_{i=0}^n{y_i}\mathcal{L}_i(x_j)
$$

Gli $\mathcal{L}_i(x)$ sono tali che $\mathcal{L}_i(x_j) = \delta_{ij}=\begin{cases}1\qquad se\ i=j\\\\0\qquad altrimenti\end{cases}$

>Nota
> $\delta_{ij}$ è chiamato delta di Kronecher


Quindi è possibile calcolare l'$i$-esimo polinomio fondamentale di Lagrange come segue

$$
\mathcal{L}_i(n)=\displaystyle\prod_{j=0,\ j\ne i}^n{\dfrac{x-x_j}{x_i-x_j}}
$$

_Esempio_

$$
\left(\begin{array}{cc} x_0 \\ x_1 \\ x_2 \end{array}\right) = \left(\begin{array}{cc} 3 \\ 7 \\ 11\end{array}\right)
\qquad
\left(\begin{array}{cc} y_0 \\ y_1 \\ y_2 \end{array}\right) = \left(\begin{array}{cc} 9 \\ 49 \\ 121\end{array}\right)

\qquad p(x)=x^2
$$
$$
\mathcal{L}_0(x)=\displaystyle\prod_{j=0,\ j\ne 0}^2{\dfrac{x-x_j}{x_i-x_j}}=\dfrac{x-x_1}{x_0-x_1}\cdot\dfrac{x-x_2}{x_0-x_2}=\dfrac{(x-7)(x-11)}{(3-7)(3-11)}=\dfrac{x^2-18x+77}{32}
$$
$$
\mathcal{L}_1(x)=\displaystyle\prod_{j=0,\ j\ne 1}^2{\dfrac{x-x_j}{x_i-x_j}}=\dfrac{x-x_0}{x_1-x_0}\cdot\dfrac{x-x_2}{x_1-x_2}=\dfrac{x^2-14x+33}{-16}
$$
$$
\mathcal{L}_2(x)=\displaystyle\prod_{j=0,\ j\ne 2}^2{\dfrac{x-x_j}{x_i-x_j}}=\dfrac{x-x_0}{x_2-x_0}\cdot\dfrac{x-x_1}{x_2-x_1}=\dfrac{x^2-10x+21}{-32}
$$

Quindi

$$
p(x)=\displaystyle\sum_{i=0}^2{y_i\mathcal{L}_i(x)}=9\mathcal{L}_0(x)+49\mathcal{L}_1(x)+121\mathcal{L}_2(x)=\ldots=x^2
$$

#### Teorema

Sia $f(x)\in e^{n+1}(\mathit{I}_x)$, dove $\mathit{I}_x$ è il minimo intervallo contenente i nodi $x_0,\ \ldots,\ x_n$ e il punto x, allora esite un ascissa $e_x\in\mathit{I}_x$ tale che 
$$
E_n(x)=f(x)-p(x)=\dfrac{f^{n+1}(e_x)}{(n+1)!}w_{n+1}(x)
$$
Dove $w_{n+1}(x)=\displaystyle\prod_{i=0}^n{x-x_i}$

#todo_pagina_13

#### Osservazione

$|E_n(x)|=\dfrac{|f^{n+1}(e_x)|}{(n+1)!}|w_{n+1}(x)|\le\dfrac{\displaystyle\max_{x\in\mathcal{I}_x}{|f^{(n+1)}(x)|}}{(n+1)!}|w_{n+1}(x)|\le\dfrac{M}{(n+1)!}|\mathcal{I}_x|^{n+1}$
