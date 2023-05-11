_Esercizio_

$$
A^{(1)}=A=
\left(\begin{array}{c}
1 & 2 & 3\\
2 & 4 & 5\\
7 & 8 & 9
\end{array}\right)
\qquad\qquad \underline b=
\left(\begin{array}{c}
b_1\\b_2\\b_3
\end{array}\right)
$$
$$
m_{21} = -\dfrac{a_{21}^{(1)}}{a_{11}^{(1)}} = -2 \implies m_{21}\cdot1°\ equazione\ +\ 2°\ equazione\to2°\ equazione
$$$$
m_{31} = -7 \implies m_{31}\cdot1°\ equazione\ +\ 3°\ equazione\to2°\ equazione
$$$$
A^{(2)}=
\left(\begin{array}{c}
1 & 2 & 3\\
0 & 0 & -1\\
0 & -6 & -12
\end{array}\right)
\qquad\qquad P=
\left(\begin{array}{c}
1 & 0 & 0\\
0 & 0 & 1\\
0 & 1 & 0\\
\end{array}\right)
$$
> Nota
> La matrice P corrisponde alla matrice permutazione

#### Osservazione

Matlab fornisce una funzione $L\cdot U$ per fattorizzazione con permutazioni $P\cdot A = L\cdot U$

---

## Fattorizzazione LU

> Nota
> $L$ rappresenta la matrice triangolare inferiore, $U$ rappresenta la matrice triangolare superiore


#### Osservazione

Il metodo di eliminazione di Gauss può essere reinterpretato come metodo di fattorizzazione.

$A\cdot\underline x = \underline b\to LU\underline x = \underline{\tilde b}\to\begin{cases}Ly=\underline b\\\\U\underline x=y\end{cases}$
> Nota
> Questo metodo coniste nel fattorizzare la matrice A in un prodotto di due matrici triangolari, una superiore $U$ e una inferiore $L$ tale che $A=LU$


#### Vantaggi

La fattorizzazione dipende dalla sola matrice $A$ e non dal termine noto $\underline b$. Quindi la stessa fattorizzazione può essere utilizzata per risolvere diversi sistemi lineari di matrice $A$ ma con termine noto $\underline b$ variabile (es. matrice inversa)

#### Obiettivi

Trovare una matrice $L = \left(\begin{array}{c}l_{11} & 0 & \ldots & 0\\ l_{21} & l_{22} & \ldots & 0\\ l_{31} & l_{32} & \ldots & 0\\\vdots & \vdots & \ddots & \vdots\\l_{n1} & l_{n2} & \ldots & l_{nn}\end{array}\right)$ e una matrice $U = \left(\begin{array}{c}u_{11} & u_{12} & \ldots & u_{1n}\\ 0 & u_{22} & \ldots & u_{2n}\\ 0 & 0 & \ldots & u_{3n}\\\vdots & \vdots & \ddots & \vdots\\0 & 0 & \ldots & l_{nn}\\\end{array}\right)$ tali che $A=L\cdot U$


_Passo 1_
$$
A^{(1)} = \left(\begin{array}{c}
a_{11}^{(1)} & a_{12}^{(1)} & \ldots & a_{1n}^{(1)}\\
a_{21}^{(1)} & a_{22}^{(1)} & \ldots & a_{2n}^{(1)}\\
a_{31}^{(1)} & a_{32}^{(1)} & \ldots & a_{3n}^{(1)}\\
\vdots & \vdots & \ddots & \vdots\\
a_{n1}^{(1)} & a_{n2}^{(1)} & \ldots & a_{nn}^{(1)}
\end{array}\right)
$$
$$
M_1 = \left(\begin{array}{c}
1 & 0 & 0 &\ldots & 0\\
m_{21} & 1 & 0 & \ldots & 0\\
m_{31} & 0 & 1 & \ldots & 0\\
\vdots & \vdots & \vdots & \ddots & \vdots\\
m_{n1} & 0 & \ldots & 0 & 1
\end{array}\right)
\qquad M_{1}\cdot A^{(1)} = A^{(2)},\quad M_{1}\cdot \underline b^{(1)} = \underline b^{(2)},\quad M_1\cdot A\underline x = M_1\underline b
$$



_Passo2_
$$
M_2 = \left(\begin{array}{c}
1 & 0 & 0 &\ldots & 0\\
0 & 1 & 0 & \ldots & 0\\
0 & m_{32} & 1 & \ldots & 0\\
\vdots & \vdots & \vdots & \ddots & \vdots\\
0 & m_{n2} & \ldots & 0 & 1
\end{array}\right)
\qquad M_{1}\cdot A^{(2)} = A^{(3)},\quad M_{2}\cdot \underline b^{(2)} = \underline b^{(3)}
$$



Dopo $n-1$ passi:

$$
M_{n-1}\cdot\ldots\cdot M_{2\cdot}M_{1\cdot}A\underline x = M_{n-1}\cdot\ldots\cdot M_{2\cdot}M_{1\cdot}\underline b
\to
$$
$$
M_1^{-1}\cdot M_2^{-1}\cdot\ldots\cdot M_{n-1}\cdot\ldots\cdot M_{2}\cdot M_{1}\cdot A = M_1^{-1}\cdot M_2^{-1}\cdot\ldots\cdot M_{n-1}\cdot\ldots\cdot M_{2}\cdot M_{1}\cdot U
$$
$$\mathit{I}\cdot A=L\cdot U$$
Con $L=\left(\begin{array}{c}1 & 0 & \ldots & 0\\ -m_{21} & 1 & \ldots & 0\\ -m_{31} & -m_{32} & \ldots & 0\\\vdots & \vdots & \ddots & \vdots\\-m_{n1} & -m_{n2} & \ldots & 1\\\end{array}\right)$



Data una fattorizzazione $L\cdot U\qquad A=L\cdot U\qquad a_{ij}=\displaystyle\sum_{r=1}^{\min{(i,\ j)}}{l_{ir}\cdot u_{rj}}$

> Nota
> La sommatoria corrisponde al prodotto riga per colonna


> Nota
> Sono present $n^2$ equazioni ed $n^2$ incognite

#### Osservazione
In matlab esiste una funzione LU  per la fattorizzazione con permutazioni $PA=LU$



#### Procedimento

1. Iniziare con la matrice A dei coefficienti del sistema lineare $A\underline x=\underline b$
2. Applicare la procedura di eliminazione di Gauss per ottenere una matrice triangolare superiore $U$ equivalente ad $A$. Durante l'applicazione dell'eliminazione di Gauss, emmorizzare i moltiplicatori utilizzati in una matrice triangolare inferiore $L$, aggiungendo 1 sulla diagonale, per ottenere la fattorizzazione $A=LU$
3. Scrivere il sistema $A\underline x=\underline b$ come $LU\underline x=\underline b$
4. Risolvere il sistema $L\underline y=b$ utilizzando la sostituzione in avanti
5. Risolvere il sistema $U\underline x=y$ utilizzando la sostituzione all'indietro
6. La soluzione del sistema originale $A\underline x=\underline b$ è il vettore c trovato nella fase di sostituzione all'indietro


_Versione manuel_
```mathlab
for i=1:n
	sub_matrix = A(1:i, 1:i)
	det_sub_matrix = [det_sub_matrix det(sub_matrix)];
	if det_sub_matrix < epsilon
		warning("Errore! Divisione per 0!");
		return;
	end
end

U = diag(diag(A, 1), 1);
L = eye(n);

for i=1:n
	% costruzione matrice U
	U(i, i) = det_sub_matrix(i+1) / det_sub_matrix(i);
	if(i <= n-1)
	% costruzione matrice L
	L(i+1, i) = A(i+1, i)*det_sub_matrix(i)/det_sub_matrix(i+1)
	end
end

```




---

## Metodo di Dolittle (algoritmo riga-colonna)

Il metodo di Dolittle è un metodo di fattorizzazione $LU$ utilizzato per risolvere sistemi lineari. L'idea alla base di questo metodo è quella di fattorizzare la matrice $A$ in due matrici triangolari $L$ e $U$, per poi risolvere i due sottosistemi trovati $L\underline y=\underline b$ e $U\underline x=\underline y$ rispettivamente tramite sostituzione in avanti e sostituzione all'indietro.

$$
\left(
\begin{array}{c}
1 & 0 & \ldots & 0\\
l_{21} & 1 & \ldots & 0\\
l_{31} & l_{32} & \ldots & 0\\
\vdots & \vdots & \ddots & \vdots\\
l_{n1} & l_{n2} & \ldots & 1
\end{array}
\right)\cdot
\left(
\begin{array}{c}
u_{11} & u_{12} & \ldots & u_{1n}\\
0 & u_{22} & \ldots & u_{2n}\\
0 & 0 & \ldots & u_{3n}\\
\vdots & \vdots & \ddots & \vdots\\
0 & 0 & \ldots & u_{nn}
\end{array}
\right)=
\left(
\begin{array}{c}
a_{11} & a_{12} & \ldots & a_{1n}\\
a_{21} & a_{22} & \ldots & a_{2n}\\
a_{31} & a_{32} & \ldots & a_{3n}\\
\vdots & \vdots & \ddots & \vdots\\
a_{n1} & a_{n2} & \ldots & a_{nn}
\end{array}
\right)
$$


$$
1\cdot u_{11} = a_{11}\quad1\cdot u_{12} = a_{12}\quad\ldots1\cdot u_{1n} = a_{1n}\qquad 1°\ riga\ L\cdot\ 1°\ colonna\ U
$$

da cui $u_{1j}=a_{1j}$ con $j = 1,\ \ldots,\ n$

$$
l_{21}u_{11} + 1*0 = a_{21}\to l_{21} = \dfrac{a_{21}}{u_{11}}
$$
$$
l_{31}u_{11} + l_{32}*0 + 1*0 = a_{31}\to l_{31} = \dfrac{a_{31}}{u_{11}}
$$
$$
\vdots
$$
$$
l_{i1}u_{11} = a_{i1}\to l_{i1} = \dfrac{a_{i1}}{u_{11}}
$$


Ora si conosce tutta la seconda riga di L e moltiplicandola per le colonne di U

$$
l_{21}u_{1j} + u_{2j} = a_{2j}\qquad j=2,\ \ldots,\ n\to u_{2j}=a_{2j}-l_{21}u_{1j}
$$

Ora si conosce la seconda colonna di U e moltiplicandola per tutte le righe di L

$$
l_{i1}u_{12} + l_{i2}u_{22} = a_{i2}\to l_{i2}=\dfrac{a_{i2}-l_{i1}u_{12}}{u_{22}}\qquad i=3,\ \ldots,\ n
$$

_Riassumendo_

Per $k=1,\ \ldots,\ n$

$$
\begin{cases}
u_{kj} = a_{kj}-\displaystyle\sum_{p=1}^{k-1}{l_{kp}u{pj}}\qquad j=k,\ \ldots,\ n\\
l_{ik} = \dfrac{\left[a_{ik}-\displaystyle\sum_{p=1}^{k-1}{l_{ip}u_{pk}}\right]}{u_{kk}}\qquad i=k+1,\ \ldots,\ n 
\end{cases}
$$

#### Casi particolari

**Matrice tridiagonale**

$$
\left(
\begin{array}{c}
a_{1} & c_{1} & 0 & 0 &\ldots & 0\\
b_{2} & a_{2} & c_{2} & 0 & \ldots & 0\\
0 & b_{3} & a_{3} & c_{3} & \ldots & 0\\
\vdots & \vdots & \ddots & \ddots & \ddots & \vdots\\
\vdots & \vdots & \ddots & b_{n-1} & a_{n-1} & c_{n-1}\\
0 & 0 & \ldots & 0 & b_n &a_{n}
\end{array}
\right)=
\left(
\begin{array}{c}
1 & 0 & 0 & \ldots & \ldots & 0\\
b_2\dfrac{d_0}{d_1} & 1 & 0 & \ldots & \ldots & 0\\
0 & b_3\dfrac{d_1}{d_2} & 1 & \ldots & \ldots & 0\\
\vdots & \vdots & \ddots & \ddots & \vdots & \vdots\\
0 & 0 & \ldots & b_n\dfrac{d_{n-3}}{d_{n-2}} & 1 & 0\\
0 & 0 & \ldots & 0 & b_n\dfrac{d_{n-2}}{d_{n-1}} & 1
\end{array}
\right)\cdot
\left(
\begin{array}{c}
\dfrac{d_1}{d_0} & c_1 & 0 & 0 & \ldots & 0\\
0 & \dfrac{d_2}{d_1} & c_2 & 0 & \ldots & 0\\
0 & 0 & \dfrac{d_3}{d_2} & c_2 & \ldots & 0\\
\vdots & \vdots & \ddots & \ddots & \ddots & \vdots\\
0 & 0 & 0 &  \ldots & \dfrac{d_{n-1}}{d_{n-2}} & c_{n-1}\\
0 & 0 & 0 & 0 & \ldots & \dfrac{d_n}{d_{n-1}}
\end{array}
\right)
$$

Con $d_0=1$, $d_1=a_1$ si calcola
$$
d_2 = a_1a_2-c_1b_2=d_1a_2-c_1b_2d_0
$$
$$
d_3=d_2a_3-c_2b_3d_1
$$
$$
\vdots
$$
$$
d_k=a_kd_{k-1}-b_kc_{k-1}d_{k-2}\qquad k=2,\ \ldots,\ n
$$


_Costo computazionale_

|  | Determinanti |
|---|---|
|Somme|n-1|
|Prodotti|3(n-1)|

|  | Fattorizzazione L |
|---|---|
|Divisioni|n-1|
|Prodotti|n-1|

Costo complessivo $\mathbb{O}(n)$


## RIsoluzione sistema lineare

Dato un sistma lineare $A\underline x=\underline t\to LU\underline x=\underline t$

- Ponendo $\underline y=U\underline x$ si risolve il sistema $L\underline y=\underline t$ mediante la sostituzione in avanti
$$
\begin{cases}
y_1 = t_1\\
b_2\dfrac{d_0}{d_1}y_1+y_2=t2\implies y_2=t_2-b_2\dfrac{d_0}{d_1}y_1\\
\vdots\\
y_k=t_k-b_k\dfrac{d_{k-2}}{d_{k-1}}y_{k-1}\qquad k = 2,\ \ldots,\ n
\end{cases}
$$

- Ponendo $\underline y=\dfrac{\underline t}{L}$ e si risolve il sistema $U\underline x=\underline y$ mediante la sostituzione indietro
$$
	\begin{cases}
	x_n\dfrac{d_n}{d_{n-1}} = y_n\implies x_n = \dfrac{d_{n-1}}{d_n}y_n\\
	\dfrac{d_{n_1}}{d_{n-1}}x_{n-1}+c_{n-1}x_n = y_{n-1}\implies x_{n-1}=(y_{n-1}-c_{n-1}x_m)\dfrac{d_{n-2}}{d_{n-1}}\\
	\vdots\\
		x_k=(y_k-e_kx_{k+1})\dfrac{d_{k-1}}{d_k}\qquad k = n-1,\ \ldots,\ 1 
	\end{cases}
$$

_Costo computazionale_
|  | Sostituzione all'indietro |
|--|--|
| Divisioni| n|
|Somme|n-1|

Costo complessivo $\mathbb{O}(n)$

## Matrice A simmetrica definita positiva

#### Definizione
Una matrice $A\in\mathbb{R}^{n*n}$ è definita positiva se $\forall\underline x\ne\underline o$
$$
\underline x'A\underline x>0
$$
#### Definizione
A è matrice simmetrica se $a_{ij}=a_{ji}$ con $j,\ i=1,\ \ldots,\ n$


#### Proprietà

Se A è simmetrica e definita positiva:
1. A ha gli autovalori positivi
2. Esiste una matrice singolare H tale che $A=HH'$


#### Teorema

Se $A\in\mathbb{R}^{n*n}$ matrice simmetrica deginita positiva, allora esiste una matrice B triangolare inferiore tale che $A=B\cdot B'$. Inoltre se gli elementi diagonali di B sono scelti positivi tale fattorizzazione è unica.


## Fattorizzazione di Cholesky

La fattorizzazione di Cholesky può essere scritta come $A=L\cdot L'$ dove $L$ è una matrice triangolare inferiore con gli elementi sulla diagonale positivi e $L'$ è la transposta di $L$.
Questo tipo di fattorizzazione è simile alla fattorizzazione $LU$, ma con la differenza che può essere usata solo per matrici simmetriche e definite positive. Inoltre, a differenza della $LU$, questa fattorizzazione produce una fattorizzazione unica e stabile, senza la necessità di pivoting iniziale.

$$
A=\left(
\begin{array}{cc}
a_{11} & a_{12} & \ldots & a_{1n}\\
a_{21} & a_{22} & \ldots & a_{2n}\\
\vdots & \vdots & \ddots & \vdots\\ 
a_{n1} & a_{n2} & \ldots & a_{nn}\\
\end{array}
\right)
\qquad
B=\left(
\begin{array}{cc}
b_{11} & 0 & \ldots & 0\\
b_{21} & b_{22} & \ldots & 0\\
\vdots & \vdots & \ddots & \vdots\\ 
b_{n1} & b_{n2} & \ldots & b_{nn}\\
\end{array}
\right)
$$

Con $i,\ j=1,\ \ldots,\ n$

$$
a_{ij} = \displaystyle\sum_{k=1}^{n}{b_{ik}}
\qquad\overline b_{kj}=\displaystyle\sum_{k=1}^{\min(i,\ j)}{b_{ik}}
\qquad\overline b_{kj}=\displaystyle\sum_{k=1}^{\min(i,\ j)}{b_{ik}b_{jk}}
$$

Basta calcolare $a_{ij} = \displaystyle\sum_{k=1}^{i}{b_{ik}b_{jk}}$ con $1\le i\le j\le n$

Con:

- $i=1$
$$
j=1\qquad a_{11}=b_{11}^2\implies b_{11}=\sqrt{a_{11}}
$$
$$
j=2\qquad a_{12}=b_{11}b_{21}\implies b_{21}=\sqrt{\dfrac{a_{12}}{b_{11}}}
$$
$$
\vdots
$$
$$
j=n\qquad a_{1n}=b_{11}b_{n1}\implies b_{n1}=\sqrt{\dfrac{a_{1n}}{b_{11}}}
$$

- $i=2$
$$
j=2\qquad a_{22}=b_{21}b_{21}+b_{22}b_{22}\implies b_{22}=\sqrt{a_{22}-b^2_{21}}
$$
$$
\vdots
$$
$$
j=n\qquad a_{2n}=b_{21}b_{n1}+b_{22}b_{n2}\implies b_{n2}=\sqrt{\dfrac{a_{2n}-b_{21}b_{n1}}{b_{22}}}
$$


_Riassumendo_

- $i=1,\ \ldots,\ n$
$$
\begin{cases}
b_{ii} = \sqrt{a_{ii}-\displaystyle\sum_{k=1}^{i-1}{b_{ik}^2}}\qquad per\ j=i\\
b_{ji} = \dfrac{a_{ji}-\displaystyle\sum_{k=1}^{i-1}{b_{ik}b_{jk}}}{b_{ii}}\qquad per\ j=i+1,\ \ldots,\ n
\end{cases}
$$



> Nota
> In Mathlab è presente la funzione `Chol`


## Polinomio di Wilkinson

$$
p(x) = \displaystyle\prod_{k=1}^{10}{x+k} = (x+1)(x+2)\ldots(x+10)=x^{10}+a_1x^9+\ldots+a_9x+a_{10}
$$
$$
\alpha_k=-k\qquad k=1,\ \ldots,\ 10\qquad radici\ del\ polinomio\ p(x)
$$