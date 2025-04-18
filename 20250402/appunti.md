Diciamo che x è sottolineato dappertutto

# Norma indotta

L'altra volta: norme matriciali
Nello specifico, le norme indotte
Norma indotta dalla norma vettoriale che conosciamo benissimo

Estremo superiore (maggiore o uguale a tutti gli elementi) di ||Ax||/||x||

Le norme hanno anche consistenza: ||Ax|| <= ||A||*||x||
E submoltiplicatività ||AB||<=||A||*||B||

Dalla definizione di norma indotta troviamo quella di norma consistente

Si scrive: ||A|| = sup_||x||!=0 ||Ax||/||x||

Teorema: ogni norma indotta è consistente
||A|| >= ||Ax||/||x|| => ||Ax|| <= ||A||*||x||, definizione di consistenza, quindi lo è

Teorema: ogni norma indotta è submoltiplicativa
Parto dalla definizione di norma indotta da un prodotto di matrici
||AB|| = sup_||x||!=0 ||ABx||/||x|| {matrice, ottenuta come prodotto ma comunque matrice, applicata a un vettore, fratto la norma di quel vettore}
||AB|| = sup// ||ABx||/||x|| * ||Bx||/||Bx||
Bx, matrice per vettore, fa vettore, chiamiamolo y
||AB|| = sup// ||Ay||/||y|| * ||Bx||/||x|| <= sup_||y||!=0 ||Ay||/||y|| * sup_x// ||Bx||/||x||
Per la proprietà di prima abbiamo dato i limiti superiori dei due fattori
Quindi:
||AB|| <= sup_||y||!=0 ||Ay||/||y|| * sup_||x||!=0 ||Bx||/||x||

# Raggio spettrale (rho)

rho(A) = max_{i=1,...,n} |lambda_i(A)|
Il raggio della circonferenza dove sono contenuti tutti i lambda
Rivedi matrici quindi AM e MD !!!!!

Sia ||.|| una norma consistente, allora per ogni matrice quadrata A si ha rho(A)<=||A||
Se ho un modo facile per calcolare una norma, allora ho un raggio minimo che racchiude tutti gli autovalori
Molto importante. Per trovare il raggio spettrale, devo fare tutti gli autovalori
Con la norma a 2 servono ok gli autovalori, ma con la somma a infinito e la somma a 1 è facile
Primo teorema di localizzazione degli autovalori

Teorema
Se ho una matrice quadrata A, allora esiste una norma indotta tale che ||A||<=rho(A)+epsilon
Epsilon piccolo quanto voglio

Teorema
Se una matrice non è difettiva, allora rho(A)=||A||
Succede sempre quando abbiamo una matrice simmetrica, e la norma a 2 per le matrici simmetriche è proprio calcolata in quel modo. Quindi non solo simmetriche, ma tutte quelle non difettive (superset)



# Nuovo argomento
# Sistemi lineari

n equazioni in n incognite
ahhh già visto con MD, recuperatelo
Qua dentro x non sottolineato
{
    a_1_1x_1 + a_1_2x_2 + ... + a_1_nx_n = b_1
    a_2_1x_1 + a_2_2x_2 + ... + a_2_nx_n = b_2
    .
    .
    .
    a_n_1x_1 + a_n_2x_2 + ... + a_n_nx_n = b_n
}

Se abbiamo questo:
[A_i_j]=a_i_j
x=[
    x_1
    ...
    x_n
]
sottolineato b=[
    b_1
    ...
    b_n
]
Allora Ax=b (sottolineati) è un'equazione che corrisponde a quel sistema lì sopra
Quindi il vettore soluzione x è uguale a A^{-1}b. Matrice n*n * vettore n*1 = vettore n*1

Questo in teoria. In pratica, mai. Non si calcola mai l'inversa di A per trovare la soluzione di un sistema, anzi, siccome il calcolo dell'inversa è un'operazione molto malcondizionata. Si fa il contrario! Si calcola l'inversa della matrice sfruttando questa formula, usando le equazioni lineari, perché sono operazioni non mal condizionate.

Quando lo facciamo? Se la soluzione esiste ed è unica. Quando avviene questo? det(A)!=0

Allora. Boh. Copio.
det(A) != 0
rank(A) = n
Ax = 0
|delta x|<=K|delta d|
dx: errore sulla soluzione
dd: errore sui dati
Quello era il condizionammento assoluto
Condizionamento relativo invece, a sinistra diviso per |x| e a destra per |d|

Vediamo adesso come si calcola il numero di condizionamento relativo alla risoluzione di un sistema lineare
Ax=b
Supponiamo di avere b~=b+deltab
Quindi trovo una x perturbata, x~=x+deltax

Ax~=b~, Ax+Adx=b+db, ma Ax=b, Adx=db
||db||=||Adx|| <= ||A||*||dx||
quindi come sono legati gli errori sui dati e gli errori sulla soluzione?
Con certi calcoli che non ho seguito, 1/||x||<=||A||*1/||b||
Prendo questa che ho ottenuto, la moltiplico con ||dx||<=||A^{-1}||*||db||, membro a membro
||dx||/||x||<=||A||*||A^{-1}||*||db||/||b||
Se lo confronti con l'altra ancora, k=||A||*||A^{-1}|| (numero di condizionamento relativo)
Quello assoluto è solo K=||A^{-1}||
Questa è la norma 1 btw, k_1(A)=||A||_1*||A^{-1}||_1

Esempio dal libro:
{
    ax_1 - ax_2 = 0
    x_2 = 1
}
Sistema di due equazioni incognite e c'è un parametro a
x = [
    1
    1
]
b~=b+db = [
    0
    1
] + [
    a
    a
] = [
    a
    1+a
]
con a che tende a 0
b~ = [
    0
    1
] = b

Cambiamo sistema. Ah e adesso li scrivo in orizzontale ma lì sono in verticale
ah e lì è alfa non a
{
    ax_1 - ax_2 = a → ax_1 = a + ax_2 = a+a(1+a) = a^2+2a
    x_2 = 1+a
}
Quindi x_1 = 2+a
x~ = [2+a 1+a], se a tende a 0, [2 1], che è diverso da x non perturbato

a→0 => b~→b, x~-!>x
Questa è una situazione orrenda, perché l'errore viene raddoppiato o roba del genere

k_inf(A) = ||A||_inf * ||A^{-1}||_inf
La matrice è [
    a -a
    0 1
]
L'inversa è [
    1/a 1
    0 1
]

Somma dei valori assoluti delle righe: 2|a|, 1, 1/|a|+1, 1
Il massimo, quando a tende a 0, per ciascuna matrice, è 1 (di sotto) e infinito (di sopra)
Quindi ||A||_inf = 1, ||A^{-1}||_inf → inf, quindi k_inf(A)=inf*1 = inf
Questo spiega perché una piccola perturbazione sui dati influisce così tanto sulla soluzione

Proprietà del numero di condizionamento di una matrice
È sempre maggiore di 1, k(A)>=1
Quali sono le matrici ottimali?
    La matrice identità I
    Le matrici ortogonali Q con la norma 2 k_2
    k(AB) <= k(A)*k(B)
    k_2(A) = sqrt(lambda*max(A^TA))/sqrt(lambda*min(A^TA))
        con A simmetrica, k_2(A) = |lambda*max(A)|/|lambda*min(A)| {non so se è * o _ lì btw, metto *}
Tra l'altro, lì a sinistra, nella radice quadrata, come sappiamo che è positivo? Gli autovalori lo sono sempre
Credo non sia un * né un _ comunque, credo sia di fianco e basta perché è un operatore unario

# Sistemi lineari "facili"
Diagonali, ortogonali, triangolari
Questi aggettivi corrispondono a quelli che possono descrivere la matrice boh non ho sentito

1. Diagonali
Dx = b (sempre sottolineati)
D = [d_1 0 ... 0
    0 d_2 ...
    ...
    0 ... d_n]
Insomma tutto 0 tranne la diagonale

Equivale a $d_ix_i=b_i i=0→n$, quindi x_i=b_i/d_i
Unico problema: divisione per 0. Però la determinante non è 0, quindi non c'è uno 0 nella diagonale
Se c'è uno 0 nella diagonale, non sto neanche facendo questo calcolo
Algoritmo O(n)

2. Ortogonali
Q^{-1} = Q^T, Qx=b=>x=Q^{-1}b, quindi x=Q^Tb, easy
O(n^2), perché è una moltiplicazione matrice per vettore

3. Triangolari

L è la matrice
Superiori o inferiori. Prima le inferiori
Sostituzione in avanti
Prima equazione: ottengo x_1
Seconda: uso x_1 per trovare x_2
E così via
Perché la prima è di primo grado, la seconda è di secondo, e così via
$x_n = 1/l_{nn} (b_n - somma(j=1→n-1) l_{nj}x_j)$
Complessità: O(n^2), perché fai n(n+1)/2 operazioni, è un triangolo

Hah, pensavi fosse finita, triangolari superiori
Va be' il contrario, parto da x_n e vado a ritroso
Per calcolare x_1 mi servono tutte da x_2 a x_n

Non sono ancora finiti gli arogmenti del primo parziale