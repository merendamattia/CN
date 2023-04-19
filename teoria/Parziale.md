
## Definizione di errore

Tipi di errore:

- $errore\ assoluto = |valore\ esatto - valore\ approssimato|$

- $errore\ relativo = \dfrac{errore\ assoluto}{|valore\ esatto|}$

---

## Definizione di condizionamento

Un modello $f(x)$ si dice ben condizionato se vale una relazione del tipo:

$$	
\dfrac{||f(x + \delta x)-f(x)||}{||f(x)||}\le k\dfrac{||\delta x||}{||x||}\\
f(x) \ne 0, x \ne 0
$$

Dove
- k si dice numero/indice di condizionamento, correlato all'algoritmo utilizzato
- $f$ è una funzione/algoritmo

---

## Ricerca di radici di equazioni non lineari

Considerando il problema:

"Data $f(a,\ b) \subseteq \mathbb{R}\to\mathbb{R}$, si cerca $\alpha \in (a,\ b)$ tale che $f(\alpha) = 0$"

##### Definizione

$\alpha$ si dice radice semplice se $f(\alpha) = 0$ e  $f'(\alpha) = 0$

##### Definizione

$\alpha$ si dice radice di ordine m se $f^{(m-1)}(\alpha) = f^{(m-2)}(\alpha) = f^{(m-3)}(\alpha) =\ \ldots\ = f'(\alpha) = 0$. In tal caso scrivo $f(x) = (x-\alpha)^mh(x)$ con $h(\alpha) \ne 0$

> Nota
> $f\in c^0_{(a,\ b)}$ vuol dire che $f$ è continua
> $f\in c^1_{(a,\ b)}$ vuol dire che $f$ è derivabile una volta
> $f\in c^n_{(a,\ b)}$ vuol dire che $f$ è derivabile $n$ volte


_Esempio_
 
$\sqrt{2}$ è radice semplice della funzione $f(x) = x^2-2$

$f'(x)=2x$ e $f'(\sqrt{2})\ne0$

$\implies\sqrt{2}$ è radice semplice di $f(x) = x^2-2$

_Esempio_

$f(x) = x^2-2x+1 = (x-1)^2$, questa funzione ha una radice $x=1$ di ordine 2
$f'(x)=2x-2 \to f'(1) \ne0$
$f''(x)=2 \to f''(1) \ne0$


---

## Risoluzione di equazioni non lineari

#### Metodo di bisezione

Il metodo di bisezione si basa sul teorema di eseistenza degli zeri per funzioni continue

> Nota teo esistenza degli zeri

Data $f[a,\ b]\to\mathbb{R}$, una funzione continua in $[a,\ b]$ e tale che $f(a)f(b)<0$ allora $\exists\alpha\in(a,\ b)$ tale che $f(\alpha)=0$ (ovvero un punto in cui la funzione interseca l'asse delle ascisse).

![[sin.png | 200]]

Questo è un algoritmo ricorsivo che a ogni passo dati:
- $I = [a_i,\ b_i]$
-  $a = a_i$
-  $b = b_i$

Calcola $x_i = \dfrac{a + b}{2}$. Se $f(x_i) = 0$ l'algoritmo termina perché ha trovato una radice, se invece $f(x_i) \ne 0$ decido se proseguire a sinistra o a destra di $x_i$:

- Se $f(a_i)f(x_i) < 0$, $a = a_i$ e $b = x_i$
- Se $f(x_i)f(b_i) < 0$ $a = x_i$ e $b = b_i$

E reitero il procedimento finché non ottengo un $x_i = 0$

Supponendo di arrestare l'algoritmo al passo $m > 0$, $m\in\mathbb{N}$ ho:

$e_m = |x_m-\alpha| \le |b_m-a_m| = \dfrac{|b_0-a_0|}{2^m}$ che per $m\to\infty = 0$

##### Proposizione

Il metodo di bisezione è globalmente convergente

> Il metodo di bisezione è globalmente convergente perché garantisce la convergenza alla radice per qualsiasi intervallo chiuso e limitato, purché la funzione abbia valori di segno opposto ai due estremi dell'intervallo. Questa condizione è detta "teorema degli zeri" ed è fondamentale per la convergenza del metodo di bisezione

##### Osservazione
Se fisso una tolleranza $\mathcal{E} = {10^{-6}/10^{-7}/10^{-8}/\ldots}$ posso ottenere a priori il numero di passi encessari per ottenere un approssimazione della radice con la tolleranza richiesta

$$e_m \le \mathcal{E}$$
$$|x_m-\alpha| \le \mathcal{E}$$
$$e_m = |x_m-\alpha| < \dfrac{|b-a|}{2^{m+1}}$$
$$
\dfrac{|b-a|}{\mathcal{E}}\le 2^m\ \implies\log_{2}[\dfrac{b-a}{\mathcal{E}}] \le m
$$
Nota con il $\le m$ si ha un arrotondamento per eccesso all'intero successivo

##### Osservazione

Il metodo di bisezione non è a convergenza monotona e converge "lentamente" rispetto ad altri medoti.

> Il metodo di bisezione non è a convergenza monotona, ovvero non garantisce che il valore della funzione calcolata nell'intervallo diminuisca monotonicamente ad ogni iterazione. In effetti il valore della funzione può aumentare in alcune iterazioni, anceh se l'intervallo di ricerca viene sempre dirodotto della metà.
> Questo perché in metodo di bisezione si basa sull'idea di partizionare l'intervallo di ricerca in due parti uguali e di verificare in quale delle due parti si trova la rice cercata. In alcune situazioni può accadere che la radice si trovi in una delle due parti minori, dove il valore della funzione è maggiore rispetto all'altra parte; in questo caso, il valore della funzione potrebbe aumentare invece di diminuire durante l'iterazione.


##### Definizione

Si dice che la successione $\{x_{k}\}_{k=0,\ 1,\ \ldots}$ generata da un metodo numerico che converge ad $\alpha$ con ordine $p$ se:
$\exists e > 0\ :\ |x_{k+1} - \alpha| \le e|x_k-\alpha|^p$, $\forall k \ge k_0$, $k_0\in \mathbb{N}$

> Nota
> L'ordine di convergenza di un metodo indica quantitativamente com l'errore dell'approssimazione si riduce al diminuire del numero di iterazioni

##### Osservazione

Il metodo di bisezione è globalmente convergente ma non è neanche di ordine uno

> Il metodo di bisezione non è di rdine 1, ovvero non ha una convergenza lineare. Questo significa che, sebbene l'alagoritmo sia convergente, la velocità di convergenza non è particolarmente rapida.
> In particolare, la velocitò di convergenza del metodo di bisezione dipende dalla scelta iniziale dell'intervallo e dalla posizione della radice, ma in generale l'errore si riduce di un fattore $\dfrac{1}{2}$ ad ogni iterazione.

##### Osservazione
Nel caso $p = 1$ per avere la convergenza ad $\alpha$, necessariamente $e<1$

---

## Algoritmi con ordine di convergenza superiore

> Nota
> Gli algoritmi successivamente elencati saranno solo localmente convergenti

Supponendo che $\alpha$ sia la radice della funzione non lineare $f$. E supponendo anche che $f$ sia derivabile.
<br>
$$
0 = f(\alpha)=f(x_0)+f'(x_0)(\alpha-x_0)+f''(x_0)\dfrac{(\alpha-x_0)^2}{2!}+f'''(x_0)\dfrac{(\alpha-x_0)^3}{3!}+\ \ldots\ + \sigma(\alpha-x_0)^k
$$
Quindi
$$
\exists c \in (x_0,\ \alpha)\ :\ 0=f(\alpha)=f(x_0)+f'(c)(\alpha-x_0)
$$
Assumendo che $f'(c)\approx q$ e $\alpha = x_1$, allora
$$
0=f(\alpha)\ne f(x_0)+q(x_1-x_0) \iff x_1=\dfrac{-f(x_0)}{q_0}+x_0
$$
Da qui è possibile reiterare il procedimento, ottenendo:
$$
x_{k+1}=x_k-\dfrac{f(x_k)}{q_k}
$$

#### Metodo delle corde

Nel metodo delle corde il q preso in consideraizone è costante ed è pari a $q_k = \dfrac{f(b)-f(a)}{b-a}$
> Ricorda
> $q\approx f'(\alpha)$ e $\alpha$ è la radice

$$
\begin{cases}
x_0\ dato\\
x_{k+1} = x_k-\dfrac{b-a}{f(b)-f(a)}f(x_k)
\end{cases}
$$
> Nota
> Si può presentare un aconvergenza molto lenta se la funzione è piatta nella zona della radice

Considerando la corda(retta) passante per $(a,\ f(a))$ e $(b,\ f(b))$,
$$
r_1:\ y = \dfrac{f(b)-f(a)}{b-a}(x-a)+f(a)
$$

Considerando la corda parallela a $r_1$ e passante per $(x_k,\ f(x_k))$,
$$
r_2:\ y = \dfrac{f(b)-f(a)}{b-a}(x-x_k)+f(x_k)
$$

Successivamente si calcola l'intersezione tra la nuova corda($r_2$) e l'asse delle ascisse

$$
\dfrac{f(b)-f(a)}{b-a}(x-x_k)+f(x_k) = 0
$$
$$
\implies x = x_{k+1} = x_k - \dfrac{b-a}{f(b)-f(a)}f(x_k)
$$

##### Osservazione

Il metodo delle corde ha ordine di convergenza pari a 1.

> La convergenza della successione delle approssimaizoni della radice è lineare. Questo significa che, se l'errore assoluto della soluzione al passo $k$ è $t_k$, allora l'errore assoluto al passo successivo $k+1$ è approssimativamente uguale a $ct$, dove $c$ è una costante che dipende dalla funzione e dai punti di partenza. In altre parole, la successione delle approssimazioni converge alla radice della funzione con una velocità costante e proporzionale all'errore assoluto della soluzione al passo corrente.

##### Osservazione

Il metodo solo localmente convergente

> Ciò significa che, se il punto di partenza è suﬃcientemente vicino alla radice della funzione, il metodo delle corde converge rapidamente verso la radice. Ma se il punto di partenza è lontano dalla radice, la successione di approssimazioni può divergere o oscillare senza convergere alla radice.


##### Teorema
Il metodo delle corde converge se:
1. $sgn[f'(\alpha)] = sgn[q] = sgn[\dfrac{f(b)-f(a)}{b-a}]$

2. $(b-a) < 2 \dfrac{f(b)-f(a)}{f'(\alpha)}$

#### Metodo di newton

> Nota
> Il metodo niu newton è nomitanto anche metodo delle tangenti

$$
\begin{cases}
x_0\ dato\\
x_{k+1} = x_k-\dfrac{f(x_k)}{f'(x_k)}\qquad\quad k=0, 1,\ \ldots;f'(x_k) \ne 0 
\end{cases}
$$

##### Osservazione

Il metodo di newton è localmente convergente

##### Teorema

Sia $f \in C^2([a,\ b])$ e $f$ abbia un'unica soluzione $\alpha$ in $[a,\ b]$, se:

1. $f(a)f(b)<0$

2. $f'(x)\ne 0\qquad\forall x\in[a,\ b]$
3. $f''(x) \ge 0\qquad\forall x\in[a,\ b]$, oppure $f''(x)\le 0\qquad\forall x\in[a,\ b]$
4. $\dfrac{f(a)}{f'(a)}<(b-a)$ e $\dfrac{f(b)}{f'(b)}<(b-a)$

$\implies$allora il metodi di Newton converge all'unica $\alpha\in[a,\ b]\qquad\forall c_0\in[a,\ b]$

##### Osservazione
Il metodo di newton ha ordine di convergenza $p=2$. Ciò significa che l'errore dell'approssimazione  riduce approssimativamente come il quadrato della dimensione del passo.

---
## Criteri di arresto

Ricavando una successione  $\{x_{k}\}_{k=0,\ 1,\ \ldots}$ tale che $\lim_{k\to \infty}{(x_k)} = \alpha$.
Fissando una tolleranza $\mathcal{E}\in\mathbb{R}^+$.

#### Criterio del residuo

Il processo iterativo si arresta all'ultimo $k$ tale che $|f(x_k)|<\mathcal{E}$

##### Osservazione

$|f(x_k)|<\mathcal{E}$ non implica $|x_k-\alpha|<\mathcal{E}$. Quindi l'errore su $\alpha$ può essere comunque grande

#### Criterio dell'incremento

Il processo iterativo si arresta al minimo $k$ per cui $|x_{k+1}-x_k|<\mathcal{E}$

> Nota
> Se l'avanzamento verso la radice è "lento", non è un buon test
> $$
x_{k+1}-x_k=x_{k+1}\pm\alpha-x_k=(x_{k+1}-\alpha)+(\alpha-x_k)=e_{x+1}-e_x\approx0$$

#### Numero massimo di iterazioni

Il processo iterativo si arresta quando il numero di iterazioni raggiunge $nMax$

##### Osservazione

È opportuno abbinare più criteri d'arresto

---

## Condizionamento del calcolo di una radice

Data una funzione $f(x)=0$ riscritta nella forma $f(x)\ge\varphi(x)-d=0\qquad d\in\mathbb{R}$

$$
f(x)=\sin(x)\tan(x)=\sin(x)\tan(x)+3-3=0
$$
Dove $\varphi(x)=\sin(x)\tan(x)+3$ e $d=3$

$$
d+\delta d=\varphi(x+\delta x)=(sviluppo\ di\ taylor)=\varphi(x)+\varphi '(x)\delta x+\dfrac{\varphi ''(x)}{2}(\delta x)^2+\ \ldots\ + \dfrac{\varphi ^{k}(x)}{k!}(\delta x)^k+\sigma(\delta x)^m
$$
Supponendo che $x$ sia radice di ordine $m\ :\ \varphi^k(x)=0\qquad k=1,\ \ldots,\ m-1$

$$
\delta d=\dfrac{\varphi_m(x)}{m!}(\delta x)^m+\sigma(\delta x)^m=\dfrac{f_m(x)}{m!}(\delta x)^m
$$

È possibile trascurare $\sigma(\delta x)^m$

$$
(\delta x)^m\approx\dfrac{\delta d m!}{f_m(x)}
$$

Per calolare il condizionamento:
$$
cond.=\dfrac{||\delta x||}{\delta d}=|\dfrac{\delta d m!}{f_m(x)}|^{\frac{1}{m}}\dfrac{i}{|\delta d|}
$$

##### Osservazione

- $m=1$, se $f_m(x)\approx 0$ il problema è mal condizionato

- $m\ge1$, il problema potrebbe essere mal condizionato

---

## Numeri macchina

##### Definizione

I numeri macchina sono i numeri rappresentati esattemente in un calcolatore, secondo lo standard IEEE

##### Osservazione

Il numero di cifre rappresentabile è finito

##### Definizione

L'insieme di tutti i numeri macchina è detto sistema floating point.

> L'idea sottostante è che il punto decimale si sposta("floating") variando l'esponente della base 10 della potenza

> Nota
> 
> Matlab ha di default precizione double, con:
> 1 bit per il segno
> 11 bit per l'esponente
> 52 bit per la mantissa

##### Osservazione

Il numero più grande memorizzabile è $realmax$, effettuare un operazione tipo $realmax+1$ comporta un overflow($+\infty$)
Il numero più piccolo, vicino allo zero, rappresentabile è $realmin$

> Nota
> È possibile ottenere dei valori più piccoli, però per riuscirci è necessario rinunciare allo standard IEEE

> Nota
> Alcuni numeri speciali vengono rappresentati in modo specifico:
> $\pm$ Inf
> nan

> Nota
> Un altra quantità importante è la precisione di macchina

##### Definizione

L'epsilon macchina (EPS) è il più piccolo numero macchina positivo tale che
$$
min\{x\in\mathbb{F}:(1+x)> 1\}\approx10^{-16}
$$

Dove $\mathbb{F}$ rappresenta l'insieme floating point

##### Osservazione

EPS che non è il più piccolo numero positivo rappresntabile, definisce una stima di quanto possa variare al più l'errore relativo. Quindi indica la sensibilità del sistema floating point adottato.

_Esempi:_

- Errore di rappresentazione
```matlab
S(1) = 0;
for i=1:10000
	S(i+1) = S(i) + 0.0001;
end
fprintf("%f", S(end))% != 1 
```

- Errore di cancellazione numerica, si produce quando si sottraggono due numeri quasi uguali.

##### Osservazione

Per le operazioni macchina $x\ \oplus\ y = \mathbb{F}(\mathbb{F}(x)\ \oplus\ \mathbb{F}(y))$, dove $\oplus$ corrisponde a una operazione qualsiasi, vale solo la proprità commutativa

##### Definizione

$$
\dfrac{||f(x+\delta x)-f(x)||}{||f(x)||} \le k\dfrac{||\delta x||}{||x||}
$$

Dove $\dfrac{||f(x+\delta x)-f(x)||}{||f(x)||}= errore\ relativo\ dell'output$, $k = numero\ di\ condizionamento$ e $\dfrac{||\delta x||}{||x||} = errore\ relativo\ sull'input$




#### Condizionamento della somma

Studio del condizionamento della somma: $x,\ y\in\mathbb{R}$

$\bar x=\mathbb{F}(x)=x(1+\mathcal{E}_1)$
$\bar y=\mathbb{F}(y)=y(1+\mathcal{E}_2)$

$\dfrac{|(\bar x+\bar y)-(x+y)|}{|x+y|}=\dfrac{|\not x+x\mathcal{E}_1+\not y+y\mathcal{E}_2-\not x-\not y|}{|x+y|}=\dfrac{|x\mathcal{E}_1+y\mathcal{E}_2|}{|x+y|}\le\dfrac{|x|}{|x+y|}|\mathcal{E}_1|+\dfrac{|y|}{|x+y|}|\mathcal{E}_2|$

> Nota
> $\mathcal{E}_1\ e\ \mathcal{E}_2$ sono gli errori relativo
> 
> $\dfrac{|x|}{|x+y|}=k_1$
> 
> $\dfrac{|y|}{|x+y|}=k_2$

La somma è mal condizioanta se $x\approx-y$. Questa corrisponde all'errore di cancellazione numerica


#### Condizionamento del prodotto

$\dfrac{|\bar x\bar y-xy|}{|xy|}=\dfrac{|x(1+\mathcal{E}_1)y(1+\mathcal{E}_2)-xy|}{|xy|}=|\mathcal{E}_1+\mathcal{E}_2+\mathcal{E}_1\mathcal{E}_2|\le|\mathcal{E}_1|+|\mathcal{E}_2|+|\mathcal{E}_1\mathcal{E}_2|\le|\mathcal{E}_1|+|\mathcal{E}_2|+\dfrac{1}{2}(\mathcal{E}_1^2+\mathcal{E}_2^2)\le|\mathcal{E}_1|+|\mathcal{E}_2|+\dfrac{1}{2}|\mathcal{E}_1|+\dfrac{1}{2}|\mathcal{E}_2|=\dfrac{3}{2}|\mathcal{E}_1|+\dfrac{3}{2}|\mathcal{E}_2|$

> Nota
> Se $|\mathcal{E}|<1 \implies|\mathcal{E}^2|<|\mathcal{E}|$


---

## Norma di un vettore

##### Definizione

Un applicazione $\mathbb{R}^n\to\mathbb{R}$ è chiamata norma, $||x||$ se verifica le seguenti condizioni:

1. $||x||\ge0\qquad\forall x\in\mathbb{R}^n$

2. $||x||=0\ \iff\ x=0$

3. $||\alpha x|| = |\alpha|\cdot||x||\qquad\alpha\in\mathbb{R}$

4. $\forall x,\ y\in\mathbb{R}^n\qquad||x+y||\le||x||+||y||$

##### Definizione

Una norma $p$, con $1\le p<\infty$, si indica con $||x||_p=(\displaystyle\sum_{i=1}^{n}{|x_i|^p})^{\frac{1}{p}}$

Ci sono casi particolari di norme:
- Norma uno, $||x||_1 = \displaystyle\sum_{i=1}^{n}{|x_i|}$
- Norma euclidea, $||x||_2=\sqrt{\displaystyle\sum_{i=1}^{n}{|x_i|^2}}$
- Norma infinito, $||x||_\infty=\displaystyle\max_{i=1,\ \ldots,\ n}{|x_i|}$

## Norma di una matrice

Casi particolari di norme di matrici

- Norma uno, $||A||_1=\displaystyle\max_{j}{\sum_{i=1}^{n}{|a_{ij}|}}$, questo corrisponde con il massimo valore tra le sommatorie delle colonne, $j$ itera le colonne e $i$ itera le righe

- Norma due, $||A||_2=\displaystyle\sqrt{\rho(A^T\cdot A)}$, $\rho = ro,\ raggio\ spettrale = \max{\lambda_i}$ con $\lambda_i = \ autovalore\ di\ A^T\cdot A$. Bisogna calcolare l'autovalore più grande di $A^T$ moltiplicata per $A$

- Norma infinito, $||A||_\infty=\displaystyle\max_{i}{\displaystyle\sum_{j=1}^{n}{|a_{ij}|}}$, questo corrisponde con il massimo valore tra le sommatorie delle righe, $i$ itera le righr e $j$ itera le colonne


#### Norma di Frebenius

$||A||_F=\sqrt{\displaystyle\sum_{i,\ j = 1}^{n}{(A_{ij})^2}}$, questa non è una norma indotta

#### Norma indotta
$||A||_P = \displaystyle\max_{x\in\mathbb{R}^n}{\dfrac{||A||_P}{||x||_P}}$

> Proprietà
> $||A||_P\le ||A||_P\cdot||x||_P$

> Due norme sono equivalenti se $c_2||x||_{\displaystyle\tilde p}\le||A||_p\le c_1||x||_{\displaystyle\tilde p}\qquad p \ne\displaystyle\tilde p$


##### Osservazione

In matlab per il calcolo delle norme si utilizza il comando `norm`

#### Matrice di Hilbert

$a_{ij} = \dfrac{1}{i+j-1}$

---

## Risoluzione di sistemi lineari

Un sistema lienare è del tipo $A\underline x=\underline b$, dove $\underline x=\dfrac{A}{\underline b}$. $\underline x$ e $\underline b$ sono due vettori

##### Alcuni esempi

_Esercizio 1_


$$
\begin{cases}3x_1+2x_2=18\\\\-x_1+2x_2=2\end{cases}\qquad\to\qquad
\left(
\begin{array}{cc}
3 & 2 \\
-1 & 2
\end{array}
\right)
\left(
\begin{array}{c}
18 \\
2
\end{array}
\right)
\to\ \ldots\ \to
\left(
\begin{array}{cc}
3 & 2 \\
0 & \dfrac{8}{3}
\end{array}
\right)
\left(
\begin{array}{c}
18 \\
8
\end{array}
\right)
\implies
\begin{cases}x_1=4\\\\x=3\end{cases}
$$


![[es1_sistemi.png|250]]

_Esercizio 2_

$\begin{cases}-\dfrac{1}{2}x_1+x_2=1\\\\-\dfrac{1}{2}x_1+x_2=\dfrac{1}{2}\end{cases}\implies parallele \implies\nexists\ soluzione$

![[es2_sistemi.png|250]]

_Esercizio 3_
$\begin{cases}-\dfrac{1}{2}x_1+x_2=1\\\\-x_1+2x_2=2\end{cases}\implies coincidenti \implies\infty\ soluzioni$

![[es3_sistemi.png|250]]

_Esercizio 4_

$\begin{cases}-\dfrac{2.3}{5}x_1+x_2=1.1\\\\-\dfrac{1}{2}x_1+x_2=\dfrac{1}{2}\end{cases}\implies \begin{cases}x_1=2.5\\\\-x_2=2.25\end{cases}$

![[es4_sistemi.png|250]]

> Nota
> Se le rette sono vicine tra loro si parlerà di _condizionamento di sistema_


##### Teorema
La soluzione del sistema lineare $A\underline x=\underline b\qquad A\in\mathbb{R}^{n*n},\ b\in\mathbb{R}^n$, esiste ed è unica se $A$ è invertibile

$$
\begin{cases}
a_{11}x_1+a_{12}x_2+\ \ldots\ + a_{1n}x_n=b_1\\
a_{21}x_1+a_{22}x_2+\ \ldots\ + a_{2n}x_n=b_2\\
\vdots\\
a_{n1}x_1+a_{n2}x_2+\ \ldots\ + a_{nn}x_n=b_n\\
\end{cases}\qquad\implies\qquad
\left[
\begin{array}{c}
a_{11} & a_{12} & \ \ldots\ & a_{1n}\\
a_{21} & a_{22} & \ \ldots\ & a_{2n}\\
\vdots&\vdots&\ddots&\vdots\\
a_{n1} & a_{n2} & \ \ldots\ & a_{nn}\\
\end{array}
\right]
\left[
\begin{array}{c}
x_1\\
x_2\\
\vdots\\
x_n\\
\end{array}
\right]
=
\left[
\begin{array}{c}
b_1\\
b_2\\
\ldots\\
b_n\\
\end{array}
\right]
$$
> Ricorda
> Una matrice è invertibile se esiste un'altra matrice (detta matrice inversa), che moltiplicata per la matrice originale restituisce la matrice identità.

##### Osservazione

La soluzione è $x_i = \dfrac{A_i}{\det{(A)}}$, dove $A_i$ è il determinante della amtrice ottenuta sostiutuendo la $i$-esima colonna con il termine noto $b$

_Esempio 1_

$\left[\begin{array}{cc}3 & 2\\-1 & 2\end{array}\right]=8 \to1\ soluzione$

_Esempio 2_

$\left[\begin{array}{cc}-\dfrac{1}{2} & 1\\-\dfrac{1}{2} & 1\end{array}\right]=0 \to\nexists\ soluzione$


_Esempio 3_

$\left[\begin{array}{cc}-\dfrac{1}{2} & 1\\-1 & 2\end{array}\right]=0 \to\infty\ soluzioni$


_Esempio 4_

$\left[\begin{array}{cc}-\dfrac{1}{2} & 1\\-\dfrac{2.3}{5} & 1\end{array}\right]=-0.04 \to1\ soluzione$

##### Osservazione

A causa degli errori di arrotondamento, l'algoritmo di risoluzione di un sistema lineare non produrrà la soluzione esatta
$A\underline x=\underline b\to\underline b-A(\underline x+\underline{\delta x})=residuo=\underline r$

> Il numero di condizionamento della matrice A $cond_p{(A)} = ||A||_p\cdot ||A^{-1}||_p$

> Con matrice singolare si intende una matrice con il $\det = 0$

##### Osservazione

$\dfrac{||\delta x||}{||x||}\le cond{(A)}\cdot\dfrac{||\underline r||}{||\underline b||}$

> $\dfrac{||\delta x||}{||x||}$ indica l'errore relativo sulla soluzione

##### Osservazione

Matlab restuturisce $rcon = \dfrac{1}{cond}$

> $1=||\mathcal{I}||=||A\cdot A^{-1}||\le||A||\cdot||A^{-1}||=cond(A)$

##### Proposizione

Se la variazione $||\delta A|| < \dfrac{1}{||A^{-1}||}$ allora $\dfrac{||\delta\underline x||}{||\underline x||}\le\dfrac{cond{(A)}}{1-cond{(A)\cdot\dfrac{||\delta A||}{||A||}}}\cdot\left(\dfrac{||\delta A||}{||A||}+\dfrac{||\delta b||}{||b||}\right)$

_Esempio 1_
$$
D=
\left[
\begin{array}{c}
10^{-1} & 0 & \ldots & 0\\
0 & 10^{-1} & \ldots & 0\\
\vdots & \vdots & \ddots & \vdots\\
0 & 0 & \ldots & 10^{-1}
\end{array}
\right]
\qquad D\in\mathbb{R}^{n*n}\qquad\det{(D)}= 10^{-n}
$$
_Esempio 1.2_
$$
D^{-1}=
\left[
\begin{array}{c}
10 & 0 & \ldots & 0\\
0 & 10 & \ldots & 0\\
\vdots & \vdots & \ddots & \vdots\\
0 & 0 & \ldots & 10
\end{array}
\right]
\qquad cond_1(D)=||D||_1\cdot||D^{-1}||_1=1

$$

> l condizionamento di un sistema lineare può essere espresso quantitativamente tramite il numero di della matrice A, il quale è definito come il prodotto della norma della matrice A e della norma della sua matrice inversa. Un alto numero di condizionamento indica che la matrice A è mal condizionata e che il sistema è sensibile ai cambiamenti nei dati di input. Al contrario, un basso numero di condizionamento indica che la matrice A è ben condizionata e che il sistema è meno sensibile ai cambiamenti nei dati di input.

##### Osservazione

Una buona pratica per visolvere sistemi lineari è quella di valutare il numero di condizionamento della matrice prima di applicare un metodo risoluzione,in modo da scegliere il metodo più adatto in base alle specifiche esigenze del problema. 

##### Osservazione

Se $A$ ha condizionamento elevato si potrebbe comportare come una matrice $A+\delta A$ singolare

##### Esempio

Studiamo il condizionamento del sistema lineare $A\underline x=\underline b$

$$
A=
\left[
\begin{array}{c}
\mathcal{E} & 0\\
0 & \dfrac{1}{\mathcal{E}}
\end{array}
\right]
\qquad 0<\mathcal{E}\ll 1\qquad
A^{-1}=
\left[
\begin{array}{c}
\dfrac{1}{\mathcal{E}} & 0\\
0 & \mathcal{E}
\end{array}
\right]
$$
Cerchiamo ora la la matrice di "pre-condizionamento":
$cond(A)=||A||\cdot||A^{-1}||=\dfrac{1}{\mathcal{E}}\cdot\dfrac{1}{\mathcal{E}}=\dfrac{1}{\mathcal{E}^2}\gg 1$

> Strategia
> Risolvere un sistema equivalente ma con matrice ben condizionata

$$
C=
\left[
\begin{array}{c}
1 & 0\\
0 & \mathcal{E}^2
\end{array}
\right]\to questo\ è\ un\ buon\ precondizionatore
$$
$CA\underline x=C\underline b$

Dove $\tilde A\underline x = \tilde{\underline b}$ con $\tilde A = \left(\begin{array}{c}\mathcal{E}&0\\0&\mathcal{E}\end{array}\right)\qquad cond(\tilde A)=1$

##### Osservazione

La ricerca di precondizionatori è non banale

#### Metodi di risoluzione di un sistema lineare

Ci sono due categorie principali di metodi per risolvere un sistema lineare $A\underline x=\underline b$.

##### Metodi diretti

I metodi diretti risolvono il istema lineare in un numero finito di passi, senza richiedere l'uso di una soluzione iniziale. Questi metodi sono generalmente efficienti per matrici di piccole e medie dimensionni, ma possono richiedere un tempo di calcolo elevato per matrici di grandi dimensioni.
Questi metodi includono la fattorizzazione LU, di Cholesky e la QR.

##### Metodi iterativi

Partono da una soluzione iniziale e iterativamente cercano di migliorare questa soluzione fino raggiungere una soluzione accettabile. Questi metodi sono usati per matrici di grandi dimensioni e possono essere più efficienti dei metodi diretti. Tra i metodi iterativi più comuni troviamo il metodo di Jacobi, di Gauss-Seidel e del gradiente coniugato.

_Esempi metodi iterativi_

Matrice diagonale: $A\underline{x}=\underline{b}$

$$
A=
\left(\begin{array}{c}
a_{11}& 0 & \ldots & 0\\
0 & a_{22} & \ldots & 0\\
\vdots&\vdots&\ddots&\vdots\\
0 & 0 & \ldots & a_{nn}\\
\end{array}\right)
\left(\begin{array}{c}
x_1\\x_2\\\vdots\\x_n
\end{array}\right)=
\left(\begin{array}{c}
b_1\\b_2\\\vdots\\b_n
\end{array}\right)\to
\begin{array}{c}
x_1=\dfrac{b_1}{a_{11}}\\x_2=\dfrac{b_2}{a_{22}}\\\vdots\\x_n=\dfrac{b_n}{a_{nn}}
\end{array}
$$

$$
\det{(A)}\ne0\qquad\det{(A)}=\displaystyle\prod_{i=1}^{n}{a_{ii}}\qquad\implies a_{ii}\ne0\quad i=1,\ 2,\ \ldots
$$

> Costo computazionale= numero di divisioni 

Matrice triangolare inferiore

$$
A=
\left(\begin{array}{c}
a_{11}& 0 & \ldots & 0\\
a_{21} & a_{22} & \ldots & 0\\
\vdots&\vdots&\ddots&\vdots\\
a_{n1} & a_{n2} & \ldots & a_{nn}\\
\end{array}\right)
\left(\begin{array}{c}
x_1\\x_2\\\vdots\\x_n
\end{array}\right)=
\left(\begin{array}{c}
b_1\\b_2\\\vdots\\b_n
\end{array}\right)\quad\to\quad
\begin{array}{c}
a_{11}x_1=b_1\\
a_{21}a_{22}x_2=b_1 \iff\dfrac{b_2-a_{21}x_1}{a_{22}}\\
\vdots\\
x_n=\dfrac{b_n-\displaystyle\sum_{i=1}^{n-1}{a_{ni}x_i}}{a_{nn}}
\end{array}

$$
> Nota
> L'operazione per il calcolo di $x_n$ richiede $n-1$ somme, $n-1$ prodotti e $1$ divisione

> Nota
> Algoritmo di sostituzione in avanti
> 
> $x_i=\dfrac{b_i-\displaystyle\sum_{j=1}^{i-1}{a_{ij}x_j}}{a_{ii}}\qquad i=1,\ \ldots,\ n$
> 

> Nota
> Costo computazionale= numero divisioni
> $\dfrac{n(n-1)}{2}\approx\mathcal{O}(n^2)$ somme e prodotti


Matrice triangolare superiore

$$
A=
\left(\begin{array}{c}
a_{11}& a_{12} & \ldots & a_{1n}\\
0 & a_{22} & \ldots & a_{2n}\\
\vdots&\vdots&\ddots&\vdots\\
0 & 0 & \ldots & a_{nn}\\
\end{array}\right)
\left(\begin{array}{c}
x_1\\x_2\\\vdots\\x_n
\end{array}\right)=
\left(\begin{array}{c}
b_1\\b_2\\\vdots\\b_n
\end{array}\right)\quad\to\quad
\begin{array}{c}
a_{nn}x_n=b_n\to x_n=\dfrac{b_n}{a_{nn}}\\
a_{(n-1)(n-1)}x_{n-1}+a_{(n-1)n}x_n=b_{n-1} \to x_{n-1}\dfrac{b_{n-1}-a_{(n-1)n}x_n}{a_{(n-1)(n-1)}}\\
\vdots\\
x_i=\dfrac{b_i-\displaystyle\sum_{j=i+1}^{n}{a_{ij}x_j}}{a_{ii}}\qquad i=n,\ n-1,\ \ldots,\ 1
\end{array}

$$

> Nota
> Algoritmo di sostituzione all'indietro

> Nota
> Costo computazionale ${O}(n^2)$
