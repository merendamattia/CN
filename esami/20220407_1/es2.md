> Realizzato da @SimoneColli
- Scrivere la definizione generale di condizionamento:

$$
\dfrac{||f(x+\delta x)-f(x)||}{||f(x)||}\le k\dfrac{\delta x}{x}\qquad f(x)\ne0, x\ne0
$$


- Definire il condizionamento di un sistema lineare e dimostrare che è sempre maggiore o uguale ad 1

Durante la risoluzione di un sistema linerare un algoritmodi risoluzione, non produrrà mai un risultato esatto a causa degli arrotondamento. 
Quindi si avrà un valore residuo $r=\underline b-A(\underline x+\underline{\delta x})$

Il condizionamento di un sistema si può calcolare così:
$$
cond{(A)}=||A||\cdot||A^{-1}||
$$

$cond(A)\ge 1$:
$$
cond(A) = ||A||\cdot||A^{-1}||\ge||A\cdot A^{-1}||=||\ \mathcal{I}\ || = 1
$$

Questo è possibile perché $||A||\cdot||A^{-1}||\ge||A\cdot A^{-1}||$
