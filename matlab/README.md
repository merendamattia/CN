# Comandi Matlab
> I parametri racchiusi tra parentesi quadre [] sono facoltativi

> Credits to Gabriel Benolli

---

```matlab
x = 2 + 3;  
c = a + b;  
s = 'stringa';  
```
- ans -> variabile temporanea che contiene il risultato più recente
- pi -> Pigreco
- i, j -> unità immaginaria
- NaN -> "Not-a-Number" (l'espressione calcolata non è un numero macchina) - Inf infinito
- flops -> numero di operazioni macchina effettuate
- eps -> epsilon macchina
- realmax -> massimo numero di macchina positivo
- realmin -> minimo numero di macchina positivo
- format long -> rappresenta i numeri con 15 cire significative
- format short -> rappresenta i numeri con 4 cifre significative
- sin() -> seno
- cos() -> coseno
- asin() -> arcoseno
- acos() -> arcocoseno
- tan() -> tangente
- atan() -> arcotangente
- exp() -> esponenziale
- log() -> logaritmo naturale
- log10() -> logaritmo in base 10
- sqrt() -> radice quadrata
- abs() -> valore assoluto o modulo
- diary `<nome file>` -> salva il testo della sessione Matlab
- clc -> cancella il contenuto della Command Window
- clear -> elimina tutte le variabili dalla memoria
- clear var1 var2 -> elimina var1 e var2 dalla memoria
- exist (‘nomevar’) -> determina se un file o una variabile hanno il nome specificato
- quit/exit -> chiude MatLab
- who/whos -> elenca le variabili presenti in memoria
- : -> genera un vettore di elementi regolarmente intervallati
	- es x=[2:5] -> x=[2 3 4 5]
	- es y=[1:0.1:2] -> y=[1 1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9 2]
- , -> separa istruzioni e elementi di una riga di un array
- ; -> esclude la visualizzazione di un risultato di un istruzione e separa le righe di un array
- [] -> per assegnare vettori e matrici 
    - A = [1 2 3 4]; 
    - B = [1 2 3; 4 5 6]; 
    - C = B' (' indica la trasposizione) 
- length(x) -> fornisce le dimensioni di un array
- size(x) -> fornisce le dimensioni di un array, che possiamo memorizzare in un vettore scrivendo:  [n,m] = size (b)
- linspace(v_iniziale,v_finale,n_passi) -> crea un vettore riga di n elementi linearmente intervallati, estremi compresi
- logspace(a,b,n) -> genera un array di elementi intervallati logaritmicamente,n è il numero di punti tra 10a e 10b
- eye(n) -> genera la matrice identità di ordine n
- ones([m],n) -> genera una matrice di m righe e n colonne i cui elementi sono tutti uguali a 1
- zeros([m],n) -> genera una matrice di m righe e n colonne i cui elementi sono tutti uguali a 0
- rand([m],n) -> genera un vettore o una matrice di numeri casuali
- A(ir,ic) -> se A è una matrice, vengono selezionati gli elementi di indice ir e ic
	- B = A(1:4, 3) B = A(:, 3) B = A(1:4, :) B = A(:, [2 4 ])   //i ':' indicano tutte le righe o colonne
	- A([1 2],[1 2]), A(1:2,1:2) B = A([2 2 2 1],:)
	B(1:2,:) = [ ] // per rimuvere gi elementi selezionati

- diag(A,[k]) -> A è una matrice. Estrae la k-ma diagonale della matrice
- diag(v,[k]) -> v è un vettore. Genera una matrice quadrata con k-ma diagonale uguale al vettore 
- tril(A,[k]) -> estrae da una matrice la parte triangolare inferiore (lower) a partire dalla k-ma diagonale
- triu(A,[k]) -> estrae da una matrice la parte triangolare superiore (upper) a partire dalla k-ma diagonale

## Comandi su un vettore 
- a = sum(x) -> genera lo scalare sommatoria elementi del vettore
- a = prod(x) -> genera lo scalare produttoria elementi del vettore
- a = max(x) -> massimo tra gli elementi del vettore
- a = min(x) -> minimo tra gli elementi del vettore
- a = norm(x) -> genera lo scalare norma2 ovvero -> sqrt(sum(x.^2))
- a = norm(x,1) -> genera lo scalare norma1 ovvero -> sum(abs(x))
- a = norm(x,inf) -> genera lo scalare norma infinito ovvero -> max(abs(x))

## Comandi su una matrice
- a = norm(A) -> genera lo scalare norma2, ovvero -> sqrt(max(abs(eig(A'*A))))
- a = norm(A,1) -> genera lo scalare norma1, ovvero -> max(sum(abs(A)))
- a = norm(A,inf) -> genera lo scalare norma infinito, ovvero -> max(sum(abs(x),2))
- x = sum(A) -> genera il vettore riga con valore somma elementi colonna dell matrice
- x = max(A) -> genera il vettore riga con valore massimo tra gli elementi colonna della matrice
- x = min(A) -> genera il vettore riga con valore minimo tra gli elementi colonna della matrice
- x = diag(A) -> genera il vettore colonna contenenete i calori della diagonale della matrice
- B = abs(A) -> genera la matrice con i valori in modulo
- B = sort(A) -> Dispone gli elementi di ogni colonna in ordine crescente

## Operazioni puntuali in Matlab
- A' ->  trasposizone
- A+b -> addizione di array-scalare
- A-b -> sottrazione di array-scalare
- A+B -> addizione di array, elemento x elemento
- A-B -> sottrazione di array, elemento x elemento
- A.*B -> moltiplicazione di array, elemento x elemento
- A./B -> divisione di array, elemento x elemento
- A.^B -> elevamento a potenza di array, elemento x elemento
- C*D -> C e D matrici, prodotto riga-clonna
- d = det(A) -> calcola il determinante di A
- B = inv(A) -> calcola matrice inversa di A
- H = hilb(n) -> costruisce la matrice di Hlbert di ordine n
- [M,D] = eig(A) -> calcola autovalori e autovettori di A
- A\B -> calcola la soluzione del sistema lineare Ax=b con eliminazione di Gauss

## Grafica in Matlab
- plot(x,y,['opzioni']) -> crea il grafico della funzione
	- opzioni: 
        -  w -> bianco	
        - `.` -> punto	  
        - `-` -> continua
		- y -> giallo	
        - o -> circoletto	  
        - `:` -> punteggiata
		- r -> rosso	 	  
        - `-.` -> tratto-punto
		- g -> verde	
        - `+` -> più	  
        - `--` -> tratteggiata
		- b -> blu	
        - `*` -> asterisco
		- k -> nero	
        - s -> quadrato
		 
- axis([xmin xmax ymin ymax]) -> modifica e impostazoni dei valori limite per gli assi
- axis square -> seleziona i limiti degli assi in modo che il diagramma sia quadrato
- axis equal -> seleziona i fattori di scala e la spaziatura dei segni di graduazione in modo che siano uguali nei due assi
- axis auto -> attiva le impostazioni di MATLAB che calcolano i limiti ideali degli assi in modo automatico
- grid on -> aggiunge la griglia, grid off la si esclude
- semilogx(x,y) -> La rappresentazione di grafici in scala logaritmica sull’asse x
- semilogx(x,y) -> La rappresentazione di grafici in scala logaritmica sull’asse y
- loglog(x,y) -> La rappresentazione di grafici in scala logaritmica su entrambe le assi
- title('...') -> Inserisce un titolo nel grafico
- xlabel('...') -> Inserisce un nome per l’asse x
- ylabel('...') -> Inserisce un nome per l’asse y
- legend -> Inserisce una legenda per identificare le rappresentazioni diverse
- hold on -> Fa sovrappor i grafici successivi nella stessa finestra grafica e non li sovrascrive
- subplot(m,n,p) -> suddivide la finestra in una serie di pannelli rettangolari disposti su m righe, n colonne. la variabile p indica su quale pannello porre l'output del comando plot che segue il comando subplot 


## Tipi di file in Matlab
- MAT-File -> hanno estensione .mat sono utilizzati per salvare i nomi e i valori delle variabili create
    - save <nomefile> crea un file .mat
    - load <nomefile> carica un file .mat

- File Dati -> sono file dati in formato ASCII utili per analizzare i dati. Un esempio di file dati è il diary.
- Diary on -> crea un file diario. salverà in esso tutto cioò che verrà scritto dopo quel comando.
- M-File -> hanno estensione .m e in essi vengono memorizzati i programmi e le funzioni di MATLAB. Eseguire un M-file equivale a digitare titti i comandi in esso contenuti uno alla volta. Nel promt per avviarlo baasta digtare il nome del file.
- % -> per creare commenti
- Function-File -> utili per ripetere iù volte una sequenza di programmi e danno la possibilità di passare parametri. usati per creare sottoprogrammi. Il nome del file contenente la funzione DEVE essere necessariamente salvato con lo stesso nome dato alla funzione.

-> La prima riga del file deve essere del tipo:

```matlab
FUNCTION [out1,out2,...,outn] = nome_funzione(in1,in2,...,inm);
```

-> Si usano parentesi quadre per gli output e tonde per gli input:
```matlab
function [mat,detminori]=mathilb(n)

mat = hilb(n);
for i=1:n
  detminori(i) = det(mat(1:i,1:i));
end
```

Per richiamare la funzione:
```matlab
[a,determinanti] = mathilb(5);
```

## Operatori relazionali in Matlab
- == 	-> UGUALE
- ~= 	-> DIVERSO
- < 	-> MINORE
- <= 	-> MINORE-UGUALE
- `>` 	-> MAGGIORE
- `>=` 	-> MAGGIORE-UGUALE

## Operatori logici in Matlab 
- ~ -> NOT -> ~A restituisce un array delle stesse dimensioni di A; gli elementi del nuovo array sono pari a 1 se quelli di A sono nulli,
altrimenti sono pari a 0.
- & -> AND -> A & B restituisce un array delle stesse dimensioni di A e di B; gli elementi del nuovo array sono pari a 1 se i corrispondenti
elementi di A e B sono entrambi diversi da a 0, altrimenti sono pari a 0.
- | -> OR -> L’istruzione A | B restituisce un array delle stesse dimensioni di A e di B; gli elementi del nuovo array sono pari a 1 se almeno uno dei due elementi corrispondenti di A e B è diverso da a 0; sono pari a 0 se entrambi se entrambi gli elementi corrispondenti di A e B sono nulli.

## Costrutti sintattici in Matlab  
- BREAK -> consente di uscire in maniera forzata da un ciclo ed evita in questo caso che siano calcolati più di N termini della successione.
- RETURN -> interrompe l'esecuzione della funzione e ritorna al programma da cui tale funzione era stata chiamata.

```matlab
% ciclo numero finito di volte
FOR variabile = inizio : incremento : fine
	blocco istruzioni
END
% ------------------------------------------

% ciclo fino che la condizione diventa falsa
WHILE condizione
	blocco di istruzioni
END

condizione -> espressine booleana interpretata vera se diversa da 0
% ------------------------------------------

IF condizione
	corpo di istruzioni
END
% ------------------------------------------

IF condizione
	corpo di istruzioni 1
ELSE
	corpo di istruzioni 2
END
% ------------------------------------------

IF condizione
	corpo di istruzioni 1
ELSEIF
	corpo di istruzioni 2	
ELSEIF
	corpo di istruzioni 3
ELSE
	corpo di istruzioni 4
END
% ------------------------------------------

SWITCH espressione (scalare o stringa)
CASE val1
	corpo di istruzioni 4
CASE val2
	corpo di istruzioni 4
CASE val3
	corpo di istruzioni 4
OTHERWISE
	disp('eccezione');
END
% ------------------------------------------

```
-> VETTORE RESIDUO
```matlab
r = b - A(x + δx)
```

-> CONDIZIONAMENTO

```
||δx||                    ||r||
------- <= ||A||||A^-1|| --------
 ||x||                    ||b||    
```