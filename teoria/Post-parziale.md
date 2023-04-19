
*obbiettivo*
trovare una matrice $M$ tale che $M\cdot Ax = Mb$, dove:
- $M$ non è singolare
- $M\cdot Ax$ è triangolare
- $Mb = \tilde b$

Il costo è $\mathbb{O}(n^2)$

## Metodo di eliminaizone di Gauss
> Nota
> È richiesto $\det{(A)}\ne0$
$$
A^{(1)}=A=
\left(\begin{array}{c}
a_{11}^{(1)}& a_{12}^{(1)} & \ldots & a_{1n}^{(1)}\\
a_{21}^{(1)} & a_{22}^{(1)} & \ldots & a_{2n}^{(1)}\\
\vdots&\vdots&\ddots&\vdots\\
a_{n1}^{(1)} & a_{n2}^{(1)} & \ldots & a_{nn}^{(1)}\\
\end{array}\right)
\qquad\qquad b=
\left(\begin{array}{c}
b_1^{(1)}\\b_2^{(1)}\\\vdots\\b_n^{(1)}
\end{array}\right)
$$

Devo trasformare gli elementi $a_{21}$ in zero, per fare ciò sfrutto il moltiplicatore $m_{21}$ calcolato come segue:

$Hp:\ a_{11}^{(2)}\ne0$

$m_{21} = -\dfrac{a_{21}}{a_{(11}}$

$m_{21}\cdot 1°\ equazione+2°\ equazione \to 2°\ equazione$

$a_{2j}^{(2)}=m_{21}a_{1j}^{(1)}+a_{2j}^{(1)}\qquad j=1,\ \ldots,\ n$

$b_2^{(2)}=m_{21}b_1^{(1)}+b_2^{(1)}$

> Nota
> Pattern per la prima colonna
>
> $m_{i1}=-\dfrac{a_{i1}^{(1)}}{a_{11}^{(1)}}$ per $i = 2,\ \ldots,\ n$
> 
> $a_{ij}^{(2)}=m_{i1}\cdot a_{ij}^{(1)}+a_{ij}^{(1)}\qquad j=2,\ \ldots,\ n$
> 
> $b_i^{(2)}=m_{i1}b_1^{(1)}+b_i^{(1)}$
> 


E mi ritrovo in una situazione del tipo

$$
A^{(2)}=
\left(\begin{array}{c}
a_{11}^{(1)}& a_{12}^{(1)} & \ldots & a_{1n}^{(1)}\\
0 & a_{22}^{(2)} & \ldots & a_{2n}^{(2)}\\
\vdots&\vdots&\ddots&\vdots\\
a_{n1}^{(2)} & a_{n2}^{(2)} & \ldots & a_{nn}^{(2)}\\
\end{array}\right)
\qquad\qquad b=
\left(\begin{array}{c}
b_1^{(1)}\\b_2^{(2)}\\\vdots\\b_n^{(2)}
\end{array}\right)
$$


reiterando il procedimento arrivo a una situazione del tipo


Dopo k passi

$hp:\ a_{kk}^{(k)}\ne0$

Trovo i moltiplicatori per il k-esimo passo

$m_{ik}\cdot k°\ equazione+i°\ equazione \to i°\ equazione$

> Nota
> A seguire l'algoritmo di eliminazione di Gauss:

$m_{ik}=-\dfrac{a_{ik}^{(k)}}{a_{kk}^{(k)}}$ per $i = k+1,\ \ldots,\ n$$

$a_{ij}^{(k+1)}=m_{ij}\cdot a_{kj}^{(k)}+a_{ij}^{(k)}\qquad j=k+1,\ \ldots,\ n$  

$b_i^{(k+1)}=m_{i1}b_k^{(k)}+b_i^{(k)}\qquad k=1,\ \ldots,\ n-1$

<br>
<br>

Situazione finale:

$$
A^{(k)}=
\left(\begin{array}{c}
a_{11}^{(1)}& a_{12}^{(1)} & \ldots & a_{1n}^{(1)}\\
0 & a_{22}^{(2)} & \ldots & a_{2n}^{(2)}\\
\vdots&\vdots&\ddots&\vdots\\
0 & 0 & \ldots & a_{nn}^{(k)}\\
\end{array}\right)
\qquad\qquad b=
\left(\begin{array}{c}
b_1^{(1)}\\b_2^{(2)}\\\vdots\\b_n^{(k)}
\end{array}\right)
$$

#### Costo computazionale

| passo    | divisioni           | prodotti                                                                                | somme                                                                                   |
| -------- | ------------------- | --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- |
| 1°       | $(n-1)$             | $(n-1)+(n-1)^2$                                                                         | $(n-1)+(n-1)^2$                                                                         |
| 2°       | $(n-2)$             | $(n-2)+(n-2)^2$                                                                         | $(n-2)+(n-2)^2$                                                                         |
| $\vdots$ | $\vdots$            | $\vdots$                                                                                | $\vdots$                                                                                |
| k°       | $(n-k)$             | $(n-k)+(n-k)^2$                                                                         | $(n-k)+(n-k)^2$                                                                         |
| Tot      | $\dfrac{n(n-1)}{2}$ | $\displaystyle\sum_{i=1}^{n-1}{i^2}+\displaystyle\sum_{i=1}^{n-1}{i} = \mathbb{O}(n^3)$ | $\displaystyle\sum_{i=1}^{n-1}{i^2}+\displaystyle\sum_{i=1}^{n-1}{i} = \mathbb{O}(n^3)$ |
 
##### Osservazione
Con il metodo di eliminazione di Gauss trasformo il sistema lineare $A\underline x=\underline b$ in un sistema lineare equivalente (con la stessa soluzione) corrispondente ad una matrice triangolare superiore. In questo modo posso applicare il metodo di sostituzione all'indietro che ha complessità $\mathbb{O}(n^2)$

##### Osservazione
Con il metodo di eliminazione di Gauss risolvere un sistema lineare con matrice densa ha un consto computazionele pari a $\mathbb{O})n^3=$

##### Osservazione
Qualche elemento $a_{kk}^{(k)}$ potrebbe essere uguale a $0$, comportando uno scambio di righe/colonne nel sistema lineare.


##### Osservazione
Per la stabilità dell'algoritmo è meglio mettere in posizione $a_{kk}^{(k)}$ l'elemento di modulo maggiore nella restante sottomatrice.
$$
\left(\begin{array}{c}
a_{kk}^{(k)}& a_{kk}^{(k)} & \ldots & a_{kn}^{(k)}\\
\vdots&\vdots&\ddots&\vdots\\
a_{nk}^{(k)}& a_{nk+1}^{(k)} & \ldots & a_{nn}^{(k)}\\
\end{array}\right)
$$

##### Osservazione

Se vario il termine noto devo ripetere "tutto" l'algoritmo $A\underline x=\underline b\implies LU\underline x=\underline b$, dove $L = matrice\ triangolare\ inferiore$ e $U=matrice\ triangolare\ superiore$

Con $U\underline x = \underline y$, risolvo il sistema lineare $L\underline y=\underline b$ mediante le sostituzioni in avanti (complessità $\mathbb{O}(n^2)$).
> Nota
> In alternativa posso risolvere il sistema $U\underline x=\underline y$ mediante la sostituzione all'indietro

##### Osservazione

Come calcolare l'inversa di una matrice

$$
A\cdot A^{-1} = \mathit{I}_n =
\left(
\begin{array}{c}
1 & 0 & \ldots & 0\\
0 & 1 & \ldots & 0\\
\vdots & \vdots & \ddots & \vdots\\
0 & 0 & \ldots & 1
\end{array}
\right)
$$

devo risolvere i sistemi lineari $A\underline x_i=\underline e_i$ con $i = 1,\ \ldots,\ n$.

> Nota
> $e_i$ corrisponde al vettore che ha un 1 nella posizione $i$, ovvero corrisponde alla colonna $i$ della matrice $\mathit{I}_n$
> 
> _Esempi_
> 
> $$
> e_1=\left(\begin{array}{c}1\\0\\0\\\vdots\\0\end{array}\right)\qquad
> e_2=\left(\begin{array}{c}0\\1\\0\\\vdots\\0\end{array}\right)\qquad
> e_3=\left(\begin{array}{c}0\\1\\1\\\vdots\\0\end{array}\right)\qquad
> \ldots\qquad
> e_n=\left(\begin{array}{c}0\\0\\0\\\vdots\\n\end{array}\right)
> $$