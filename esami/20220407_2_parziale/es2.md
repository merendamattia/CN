> Realizzato da @SimoneColli
- Definire la norma 1, 2 e inf di un vettore

_Norma 1_
$$
||x||_1=\displaystyle\sum_{i=1}^{n}{|x_i|}
$$
_Norma 2_
$$
||x||_2=\sqrt{\displaystyle\sum_{i=1}^{n}{|x_i|^2}}
$$
_Norma $\infty$_
$$
||x||_\infty = \displaystyle\max_{i=1}^{n}{|x_i|}
$$
Norma p
$$
||x||_p=\sqrt[p]{\displaystyle\sum_{i=1}^{n}{|x_i|^p}}
$$

 - Dimostrare che il metodo di bisezione è globalmente covergente

Il metodo di bisezione è globalmente convergente, anche se in maniera non monotona decrescente, grazie al teorema degli zeri.
Dato un intervallo chiuso e continuo $[a,\ b]$ e una funzione $f(x)$, $f([a,\ b])\to\mathbb{R}$,  $f(a)f(b)<0$, allora $\exists\alpha\in\mathbb{R}$ tale che $f(\alpha)=0$