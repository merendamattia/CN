#### Ricorda

Nella risoluzione dei sistemi linari i metodi iterativi costituiscono una successione di vettori $\{\underline x^{(k)}\}_{k=1,\ \ldots}\qquad \underline x^{(k)}\in\mathbb{R}$

apporssimativamente la soluzione esatta de sistema lineare $A\underline x = \underline b$

#### Osservazione

Ci si aspetta che $\underline x^{(k)} \to_{k\to\infty} \underline x$

#### Definizione

Sia $\underline x^{(k)}$ una successione di vettori $\in\mathbb{R}^n$, che converge al vettore $\underline x\in\mathbb{R}^n$ se esiste una norma vettoriale per cui
$\lim\limits_{k\to+\infty}{||\underline x^{(k)}-\underline x||} = 0$

#### Osservazione

$|x_i-x_i^{(k)}|\le||\underline x-\underline x^{(k)}||_{\infty}\to 0$ per $i=1,\ \ldots,\ n$


---


## Metodi iterativi lineari

$$
\begin{cases}
x_0\ dato\\
x_{k+1} =B\underline x_k + \underline q\qquad k=1,\ 2,\ \ldots\qquad B\in\mathbb{R}^{n*n}
\end{cases}
$$


#### Definizione
Un metodo iterativo si dice consistente se

$$
\underline x_k \equiv \underline x \implies \underline x_{k+i}\equiv\underline x\qquad i=1,\ 2,\ \ldots 
$$

#### Osservazione
Un metodo iterativo lineare è consistente se e solo se
$$
\underline q = (\mathit{I} - B)\cdot A^{-1}\cdot\underline b
$$
#### Dimostrazione

$$
\underline x = B\underline x+\underline q\qquad A\underline x=\underline b\implies\underline x = A^{-1}\underline b
$$
$$
A^{-1}\underline b = B(A^{-1}\underline b)+\underline q\iff\underline q=(\mathit{I}-B)A_{-1}\underline b
$$

> Nota
> $B$ è una matrice generica e $\mathit{I}$ è la matrice identità

#### Osservazione
Il costo di un metodo diretto per una matrice piena è $\mathbb{O}(n^3)$, mentre il costo di un passo di un metodo iterativo lineare è $\mathbb{O}(n^2)$.
Quindi il metodo sarà svantaggioso se si raggiunge la accuratezza richiesta in un numero di passi minore di n
$$
||\underline x_n - \underline x||_\infty < \mathcal{E}
$$

> Nota
> $\mathcal{E}$ è la tolleranza

#### Osservazione 
Il costo del prodotto matrice-vettore si abbassa se B è fortemente sparsa.

> Nota
> Per fortemente sparsa si intende che il numero di elementi pari a 0 è molto maggiore rispetto al numero di elementi diversi da 0

#### Teorema
La successione dei vettori $\{\underline x_k\}$ ottenuta con il sistema
$$
\begin{cases}
x_0\ dato\\
x_{k+1} =B\underline x_k + \underline q\qquad k=1,\ 2,\ \ldots
\end{cases}
$$
convere alla soluzione $\underline x$ del sistema lineare $A\underline x=\underline b$ se e solo se il raggio spettrale $\rho{(B)}<1$

> Nota
> $\rho{(B)}:=\max{|\lambda_i|}$ per $i=1,\ \ldots,\ n$ dove $\lambda_i$ è l'autovalore di B (=matrice di iterazione)


#### Dimostrazione
$$
\underline x=B\underline x+\underline q\qquad\underline x^{(k+1)}=B\underline x^{(k)} + \underline q
$$
$$
e^{(k+1)}=\underline x^{(k+1)}-\underline x = B(\underline x^{(k)}-\underline x) = Be^{(k)}
$$
$$
e^{(k+1)}=Be{(k)}=B^2e^{(k-1)}=\ldots=B^{(k+1)}e^{(0)}
$$
$$
	\lim\limits_{k\to+\infty}{e^{k+1}}=\lim\limits_{k\to+\infty}{B^{k+1}e^{(0)}}=0\forall e^{(0)}
$$
$$
\lim\limits_{k\to+\infty}{B^{(k)}}=0\iff\rho{(B)<1}
$$

#### Osservazione

Calcolare il raggio spettrale è dispendioso e quindi si cercherà di evitarlo 

#### Osservazione

Se $||B||<1$ allora $\rho{(B)}<1$ (condizione sufficiente)

Sapendo che $||B\underline x||=|\lambda|\cdot||\underline x||$ allora  $||B\underline x||=||B||\cdot||\underline x||$ quindi $||B||\ge||B\underline x||=|\lambda|$  per $\underline x \ne \underline 0$


#### Osservazione

Condizione necessaria:

Se $\rho{(B)}<1$ allora $\det{(B)}<1$

#### Osservazione
La convergenza è collegata solo alle proprietà della matrice di iterazione B


## Cotruzione dei metodi iterativi lineari con tecnica di splitting

$$
A\cdot\underline x=\underline b\qquad A=P-N
$$
$$
(P-N)\cdot\underline x=\underline b\qquad P\cdot\underline x = N\cdot\underline x+\underline b
$$
$$
	P\cdot\underline x^{(k+1)} = N\cdot\underline x^{(k)}+\underline b
$$
$$
	\underline x^{(k+1)} = P^{-1}\cdot\underline x^{(k)}+\underline b
$$
#### Osservazione

P dovrà essere scelta non singolare e invertibile con basso costo computazionale


## Metodo di Jacobi

$A=D+C$
$$
A=\left(
\begin{array}{cc}
a_{11} & a_{12} & \ldots & a_{1n}\\
a_{21} & a_{22} & \ldots & a_{2n}\\
\vdots & \vdots & \ddots & \vdots\\ 
a_{n1} & a_{n2} & \ldots & a_{nn}\\
\end{array}
\right)=
\left(
\begin{array}{cc}
a_{11} & 0 & \ldots & 0\\
0 & a_{22} & \ldots & 0\\
\vdots & \vdots & \ddots & \vdots\\ 
0 & 0 & \ldots & a_{nn}\\
\end{array}
\right)+
\left(
\begin{array}{cc}
0 & a_{12} & \ldots & a_{1n}\\
a_{21} & 0 & \ldots & a_{2n}\\
\vdots & \vdots & \ddots & \vdots\\ 
a_{n1} & a_{n2} & \ldots & 0\\
\end{array}
\right)
$$

Dove $A\underline x=\underline b$ è uguale a $(D+C)\underline x=\underline b$ con $a_{ii}\ne0$, condizione necessaria (è possibile eprmutare righe e colonne per ottenerla)

$$
D\underline x=-C\underline x+\underline b
\qquad
\underline x = -D^{-1}C\underline x + D^{-1}\underline b
$$
$$
\begin{cases}
\underline x^{(0)}\qquad assegnato\\
\underline x^{(k+1)}=-D^{-1}C\underline x^{(k)}+D^{-1}\underline b
\end{cases}
$$

Dove $-D^{-1}C = B_j$ e $D^{-1}\underline b=\underline q_j$

$$
B_j = -
\left(
\begin{array}{cc}
0 & \dfrac{a_{12}}{a_{11}} & \dfrac{a_{13}}{a_{11}} & \ldots & \dfrac{a_{1n}}{a_{11}}\\
\dfrac{a_{21}}{a_{22}} & 0 & \dfrac{a_{23}}{a_{22}} & \ldots & \dfrac{a_{2n}}{a_{22}}\\
\dfrac{a_{31}}{a_{33}} & \dfrac{a_{32}}{a_{33}} & 0 & \ldots & \dfrac{a_{2n}}{a_{33}}\\
\vdots & \vdots & \vdots & \ddots & \vdots \\
\dfrac{a_{1n}}{a_{nn}} & \ldots & \ldots & \ldots & 0
\end{array}
\right)
$$

_Metodo per componenti_

$$
\begin{cases}
\underline x^{(0)}\qquad assegnato\\
\underline x_i^{(k+1)}=\dfrac{1}{a_{ii}}[-\displaystyle\sum_{j=i,\ j\ne i}^{n}{a_{ij}x_j^{(k)}}+b_i]\qquad i=1,\ \ldots,\ n\qquad k=0,\ \ldots 
\end{cases}
$$

#### Osservazione

Il metodo di Jacobi è fortemente parallelo, perché può essere facilmente parallelizzato su un architettura a memoria distribuita o su un cluster di computer.
Questo significa che è possibile eseguire il calcolo simultaneamente su più processori

#### Osservazione

Se la matrice A è strettamente diagonale dominante allora il metodo di Jacobi converve

#### Definizione

Una matrice $A\in\mathbb{R}^{n*n}$ si dice strettamente diagonale dominante per:
- righe se $|a_{ii}|>\displaystyle\sum^{n}_{j=1,\ j\ne i}{|a_{ij}|}$ per $i=1,\ \ldots,\ n$
- colonne se $|a_{ii}|>\displaystyle\sum^{n}_{j=1,\ j\ne i}{|a_{ji}|}$ per $i=1,\ \ldots,\ n$

#### Codice

![[Pasted image 20230511185658.png | 500]]


## Metodo di Gauss-Seidel

$A=D+E+F$

$$
A=\left(
\begin{array}{cc}
a_{11} & a_{12} & \ldots & a_{1n}\\
a_{21} & a_{22} & \ldots & a_{2n}\\
\vdots & \vdots & \ddots & \vdots\\ 
a_{n1} & a_{n2} & \ldots & a_{nn}\\
\end{array}
\right)=
\left(
\begin{array}{cc}
a_{11} & 0 & \ldots & 0\\
0 & a_{22} & \ldots & 0\\
\vdots & \vdots & \ddots & \vdots\\ 
0 & 0 & \ldots & a_{nn}\\
\end{array}
\right)+
\left(
\begin{array}{cc}
0 & 0 & \ldots & 0\\
a_{21} & 0 & \ldots & 0\\
\vdots & \vdots & \ddots & \vdots\\ 
a_{n1} & a_{n2} & \ldots & 0\\
\end{array}
\right)+
\left(
\begin{array}{cc}
0 & a_{12} & \ldots & a_{1n}\\
0 & 0 & \ldots & a_{2n}\\
\vdots & \vdots & \ddots & \vdots\\ 
0 & 0 & \ldots & 0\\
\end{array}
\right)
$$

Dove $A\underline x = \underline b$ è uguale a $(E+D+F)\underline x=\underline b$ e $(E+D)\underline x=-F\underline x+\underline b$

$$
\begin{cases}
x^{(0)}\qquad assegnato\\
\underline x^{(k+1)}=-(E+D)^{-1}F\underline x^{(k)}+(E+D)^{-1}\underline b\qquad k=1,\ \ldots,\ n
\end{cases}
$$

Dove $-(E+D)^{-1}F = B_{GS}$ e $(E+D)^{-1}\underline b=\underline q_{GS}$

_Metodo per componenti_

$$
\begin{cases}
x_1^{k+1}=\dfrac{1}{a_{11}}(b_1-a_{12}x_2^{(k)}-a_{13}x_3^{(k)}-\ldots-a_{1n}x_n^{(k)})\\
x_2^{k+1}=\dfrac{1}{a_{22}}(b_2-a_{21}x_2^{(k)}-a_{23}x_3^{(k)}-\ldots-a_{2n}x_n^{(k)})\\
x_3^{k+1}=\dfrac{1}{a_{33}}(b_3-a_{31}x_2^{(k)}-a_{32}x_3^{(k)}-a_{34}x_3^{(k)}-\ldots-a_{3n}x_n^{(k)})\\
\vdots\\
x_n^{k+1}=\dfrac{1}{a_{nn}}(b_n-a_{n1}x_2^{(k)}-a_{n2}x_3^{(k)}-a_{n3}x_3^{(k)}-\ldots-a_{n(n-1)}x_{n-1}^{(k)})\\
\end{cases}
$$

_Riassumendo_

$$
\begin{cases}
\underline x^{(0)}\qquad assegnato\\
x_i^{k+1}=\dfrac{1}{a_{ii}}(b_i-\displaystyle\sum_{j=1}^{i-1}{a_{ij}x_j^{(k+1)}}-\displaystyle\sum_{j=i+1}^{n}{a_{ij}x_j^{(k)}})\qquad i=1,\ \ldots,\ n\qquad k=0,\ \ldots
\end{cases}
$$

#### Osservazione

Rispetto al metodo di Jacobi si perde la caratteristica di essere fortemente parallelo, ma si può ridurre l'occupazione di memoria andando ad aggiornare ad ogni passo le componenti già calcolate $(x_1^{(k)}\ x_2^{(k)}\ x_3^{(k)}\ \ldots\ x_n^{(k)})$

**Vantaggi Jacobi**
Le componenti del vettore $\underline x^{(k+1)}$ vengono calcolate in maniera indipendentende l'una delle altre.

**Vantaggi Gauss-Seidel**
La convergenza del metodi è più rapida perché le componenti del vettore $\underline x^{(k+1)}$ vengono calcolate ne corso del $k-1$ esima iterazione.

#### Teorema

Se $A$ è strettamente diagonale dominante il metodo di Gauss-Seiden è convergente.
> Nota
> Se la matrice $A$ è strettamente diagonale dominante, allora gli elementi diagonali sono "grandi" rispetto agli eleemnti guori diagonale, e quindi il metodo di Gauss-Seiden enfatizza sempre di più gli elementi diagonali della matrice in ogni passo. 
> In altre parole, il metodo tente a migliorare la soluzione iterazione per iterazione "partendo" dalle componenti diagonali della matrice; poiché la matrice è strettamente diagonale dominante, questo processo non si blocca e la successione di vettori $x^{(k)}$ converge ad una soluzione esatta $x^*$ del sistema


#### Osservazione

I metodi appena elencati sono differenti, quindi può capitare che:
- entrambi convergano
- entrmbi divergano
- uno converga e l'antro no

#### Proposizione

Se $A$ è una matrice triangolare $\in\mathbb{R}^{n*n}$ non singolare con $a_{ii}\ne 0$ per $i = 1,\ \ldots,\ n$ allora i metodi di Jacobi e di Gauss-Seiden sono entrambi convergenti o divergenti. Nel caso di convergenza, im metodo di Gauss-Seiden converge due volte più velocemente del metodi di Jacobi

#### Codice

![[GaussSaidenCode.png]]

#### Osservazione

Analogamente ai metodi iterativi per la ricerca di radici di equazioni non lineari, viene data $\mathcal{E}$ una tolleranza prefissata e si utilizzano dei criteri d'arresto:

- Criterio del residuo, si arresta al primo $k$ tale che $||A\underline x^{(k)}-\underline b||\le\mathcal{E}$
- Criterio dell'incremento, si arresta al primo $k$ tale che $||\underline x^{(k+1)}-\underline x(k)||\le\mathcal{E}$

