Mi sono perso l'inizio della lezione

Allora, `nargin` è il numero di argomenti in entrata. Se sono meno di un tot, li mette default quelli che mancano.

Mettiamo tutti i controlli che riusciamo

```
function x = jacobi(A, b, x0, tau, k_max)

if abs(det(A)) < 1e-12 % essenzialmente 0
    error("Questo sistema può non ammettere soluzione")
    % "può" perché magari è davvero quasi 0 e non è solo 0 approssimato male

if nargin > 5
    error("Too many inputs")
end
if nargin < 5
    k_max = 1000
end
if nargin < 4
    tau = 1e-10
end
if nargin < 3
    x0 = zeros(size(A,1),1);
    x0(1) = 1;
end
D = diag(diag(A)); % prende A, ne prende la diagonale come vettore, e fa una matrice con quel vettore come diagonale
% E = (tril(A)-D)*-1
E = -tril(A,-1); % sono equivalenti
F = -triu(A,1);
% Essenzialmente insomma abbiamo la diagonale e le due triangolari senza diagonale

% Stiamo facendo il metodo di Jacobi

% Bj = D^-1 * (E+F)
Bj = D\(E+F) % equivalenti

% f = D^-1*b
f = D\b

Se rho<1, allora funziona

% vogliamo gli autovalori di Bj, ne vogliamo uno, e quello col maggiore dei valori assoluti
rho = abs(eigs(Bj,1,'largestabs'));
if rho > 1
    error ("il metodo non converge");
end

% questo è un algoritmo iterativo, quindi ripetiamo lo stesso processo finché non converge
% ogni passo si basa interamente su quello precedente
% ogni volta ci salviamo il risultato del passo precedente prima di iniziare il prossimo
% cominciamo a vedere il passo generico

% x = Bj * x0 + f;

% x0 sarebbe l'x precedente

while flag_iterazione
    x_new = Bj * x_old + f
    if norm(x_new-x_old) < tau
        flag_iterazione = false

end
```