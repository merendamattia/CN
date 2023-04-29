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
ecc...
$$

$$
A^{(2)}=
\left(\begin{array}{c}
1 & 2 & 3\\
0 & 0 & -1\\
0 & -6 & -12
\end{array}\right)
\qquad\qquad \underline P=
\left(\begin{array}{c}
b_1\\b_2\\b_{3}\\
b_1\\b_2\\b_{3}\\
b_1\\b_2\\b_{3}\\
\end{array}\right)
$$

#### Osservazione

Matlab fornisce una funzione $L\cdot U$ per fattorizzazione con permutazioni. $P\cdot A = L\cdot U$


## Fattorizzazione

#### Osservazione
Il metodo di eliminazione di Gauss può essere reinterpretato come metodo di fattorizzazione.
$A\cdot\underline x = \underline b\to U\underline x = \underline{\tilde b}$

#### Vantaggi

La fattorizzazione dipende dalla sola matrice $A$ e non dal termine noto $\underline b$. Quindi la stessa fattorizzazione può essere utilizzata per risolvere diversi sistemi lineari di matrice $A$ ma con termine noto $\underline b$ variabile (es. matrice inversa)

#### Obiettivi

Trovare una matrice $L = \left(\begin{array}{c}1_{11} & 0 & \ldots & 0\\ 1_{21} & 1_{22} & \ldots & 0\\ 1_{31} & 1_{32} & \ldots & 0\\\vdots & \vdots & \ddots & \vdots\\1_{n1} & 1_{n2} & \ldots & 1_{nn}\\\end{array}\right)$


ecc....

Dopo $n-1$ passi:

$$
M_{n-1}\cdot\ldots\cdot M_{2\cdot}M_{1\cdot}A\underline x = M_{n-1}\cdot\ldots\cdot M_{2\cdot}M_{1\cdot}\underline b
\to
$$
$$A=L\cdot U$$
Con $L=\left(\begin{array}{c}1_{11} & 0 & \ldots & 0\\ -m_{21} & 1_{22} & \ldots & 0\\ -m_{31} & -m_{32} & \ldots & 0\\\vdots & \vdots & \ddots & \vdots\\-m_{n1} & -m_{n2} & \ldots & 1_{nn}\\\end{array}\right)$

---

Data una fattorizzazione $L\cdot U\qquad A=L\cdot U\qquad a_{ij}=\displaystyle\sum_{r=1}^{\min{(i,\ j)}}{l_{ir}\cdot u_{rj}}$

> Nota
> La sommatoria corrisponde al prodotto riga per colonna


> Nota
> Sono present $n^2$ equazioni ed $n^2$ incognite


---

## Metodo di Dolittle (algoritmo riga-colonna)


$$
\left(
\begin{array}{c}
1_{11} & 0 & \ldots & 0\\
l_{21} & 1_{22} & \ldots & 0\\
l_{31} & l_{32} & \ldots & 0\\
\vdots & \vdots & \ddots & \vdots\\
l_{n1} & l_{n2} & \ldots & 1_{nn}
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


