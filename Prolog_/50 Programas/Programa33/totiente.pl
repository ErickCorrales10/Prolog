% ===============================================
% Autor: Erick Corrales
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que calcula la funcion
%              totiente de Euler phi

% -------- Código en Python (comentado) ------------
% def gcd(x, y):
%     while y:
%         x, y = y, x % y
%     return x
%
% def coprime(x, y):
%     return gcd(x, y) == 1
%
% def totient_acc(m, k, acc):
%     if k == 0:
%         return acc
%     if coprime(m, k):
%         return totient_acc(m, k - 1, acc + 1)
%     else:
%         return totient_acc(m, k - 1, acc)
%
% def totient(m):
%     if m <= 1:
%         return 1
%     return totient_acc(m, m, 0)
%
% print(totient(10))
% print(totient(15))
% -----------------------------------------

% -------- Código en Prolog --------------------

% Predicado totient(M, Phi) que calcula la funcion totiente de Euler, que cuenta
% cuantos numeros menores que M son coprimos con M

totient(1, 1).
totient(M, Phi) :-
    M > 1,
    totient_acc(M, M, 0, Phi).

totient_acc(_, 0, Acc, Acc).
totient_acc(M, K, Acc, Phi) :-
    K > 0,
    coprime(M, K),
    Acc1 is Acc + 1,
    K1 is K - 1,
    totient_acc(M, K1, Acc1, Phi).

totient_acc(M, K, Acc, Phi) :- 
    K > 0, 
    \+ coprime(M, K),
    K1 is K - 1,
    totient_acc(M, K1, Acc, Phi).

coprime(X, Y) :-
    gcd(X, Y, 1).

% Predicado gcd(X, Y, G) que calcula el maximo comun divisor de X y Y
gcd(X, 0, X) :-
    X > 0.
gcd(X, Y, G) :-
    Y > 0,
    R is X mod Y,
    gcd(Y, R, G).

% -----------------------------------------------------------------
% Ejemplos de uso
% ?- totient(10, Phi).
% Output:
% Phi = 4
% -----------------------------------------------------------------
