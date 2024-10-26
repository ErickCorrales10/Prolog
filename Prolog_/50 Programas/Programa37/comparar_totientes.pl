% ===============================================
% Autor: Erick Corrales
% Fecha: 26 de octubre de 2024
% Descripción: Programa en Prolog que compara dos metodos para calcular
%              la función totiente de Euler

% -------- Código en Python (comentado) ------------
% from math import gcd, isqrt
% from functools import reduce
% from collections import Counter
%
% def compare_totient(n):
%     phi_basic = totient(n)
%     phi_improved = totient_improved(n)
%     print(f"Phi (método básico): {phi_basic}")
%     print(f"Phi (método mejorado): {phi_improved}")
%
% def totient(n):
%     if n == 1:
%         return 1
%     return sum(1 for k in range(1, n + 1) if gcd(n, k) == 1)
%
% def totient_improved(n):
%     factors = prime_factors_with_multiplicity(n)
%     return reduce(lambda phi, p_m: phi * ((p_m[0] - 1) * p_m[0] ** (p_m[1] - 1)), factors, 1)
%
% def prime_factors_with_multiplicity(n):
%     factors = prime_factors(n)
%     return list(Counter(factors).items())
%
% def prime_factors(n):
%     factors = []
%     factor = 2
%     while factor * factor <= n:
%         while n % factor == 0:
%             factors.append(factor)
%             n //= factor
%         factor += 1 if factor == 2 else 2  % Pasar al siguiente número impar
%     if n > 1:
%         factors.append(n)
%     return factors
%
% compare_totient(30)
% -----------------------------------------

% -------- Código en Prolog --------------------

% Predicado compare_totient(N) que calcula los dos metodos para calcular la  
% funcion totiente de Euler

compare_totient(N) :-
    totient(N, Phi1),
    totient_improved(N, Phi2),
    write('Phi (metodo basico):  '), 
    write(Phi1), 
    nl, 
    write('Phi (metodo mejorado): '), 
    write(Phi2), 
    nl.

totient_improved(N, Phi) :-
    prime_factors_mult(N, F),
    totient_phi(F, Phi).

totient_phi([], 1).
totient_phi([(P, M)|T], Phi) :-
    totient_phi(T, Phi1),
    Phi is Phi1 * (P - 1) * P ** (M -1).

% Determina los factores primos con su multiplicidad.
prime_factors_mult(N, L) :- 
    prime_factors(N, F), 
    encode(F, L).

prime_factors(N, L) :- 
    N > 1,
    prime_factors(N, 2, L).

prime_factors(1, []).

% Si N es divisible por F, se agrega F a la lista de factores y se continúa con N // F
prime_factors(N, F, [F|L]) :- 
    N > 1,
    0 is N mod F, 
    N1 is N // F, 
    prime_factors(N1, F, L).

% Si N no es divisible por F, buscar el siguiente factor
prime_factors(N, F, L) :- 
    N > 1,
    F * F =< N,
    0 \= N mod F,  % Solo buscar si no es divisible
    next_factor(F, F1), 
    prime_factors(N, F1, L).

% Si N es mayor que 1 y F es mayor que la raíz cuadrada de N, agregar N a la lista
prime_factors(N, F, [N]) :- 
    N > 1,
    F * F > N.

next_factor(2, 3).  
next_factor(F, F1) :- 
    F > 2,
    F1 is F + 2.

% Para manejar la codificación de la multiplicidad
encode([], []).
encode([H|T], [(H, Count)|EncodedTail]) :-
    count_occurrences(H, [H|T], Count),
    remove_occurrences(H, T, NewTail),
    encode(NewTail, EncodedTail).

count_occurrences(X, List, Count) :-
    include(=(X), List, Occurrences),
    length(Occurrences, Count).

remove_occurrences(_, [], []).
remove_occurrences(X, [X|T], R) :- remove_occurrences(X, T, R).
remove_occurrences(X, [Y|T], [Y|R]) :- X \= Y, remove_occurrences(X, T, R).

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
% ?- compare_totient(10).
% Output:
% Phi = 4
% Phi = 4
% -----------------------------------------------------------------
