% ===============================================
% Autor: Erick Corrales
% Fecha: 26 de octubre de 2024
% Descripción: Programa en Prolog encunetra dos numeros primos
%              que sumen un numero par dado segun la conjetura de Goldbach

% -------- Código en Python (comentado) ------------
% def goldbach(n):
%     if n <= 2 or n % 2 != 0:
%         raise ValueError("El número debe ser un número par mayor que 2.")
%     
%     primes = prime_list(2, n)
%     for p1 in primes:
%         p2 = n - p1
%         if is_prime(p2):
%             return (p1, p2)
%     
%     return None
%
% def prime_list(low, high):
%     return [p for p in range(low, high + 1) if is_prime(p)]
%
% def is_prime(n):
%     if n < 2:
%         return False
%     if n in (2, 3):
%         return True
%     if n % 2 == 0:
%         return False
%     return not has_factor(n, 3)
%
% def has_factor(n, l):
%     if l * l > n:
%         return False
%     if n % l == 0:
%         return True
%     return has_factor(n, l + 2)
%
% n = 28  % Cambia este valor para probar con otros números
% result = goldbach(n)
% if result:
%     print(f"Los dos primos que suman {n} son: {result[0]} y {result[1]}")
% else:
%     print(f"No se encontraron dos primos que sumen {n}.")
% -----------------------------------------

% -------- Código en Prolog --------------------

% Predicado goldbach(N, [P1, P2]) que encuentra dos numeros primos que sumen un numero
% par dado segun la conjetura de Goldbach

goldbach(N, [P1, P2]) :-
    N > 2,
    N mod 2 =:= 0,
    prime_list(2, N, Primes),
    member(P1, Primes),
    P2 is N - P1,
    is_prime(P2).

prime_list(Low, High, Primes) :-
    findall(P, (between(Low, High, P), is_prime(P)), Primes).

% Verifica si un número entero dado es primo.
is_prime(2).
is_prime(3).
is_prime(P) :-
    P > 3,
    P mod 2 =\= 0,
    \+ has_factor(P, 3).

% Verifica si un número tiene factores.
has_factor(N, L) :- 
    N mod L =:= 0.
has_factor(N, L) :- 
    L * L < N,
    L2 is L + 2,
    has_factor(N, L2).

% -----------------------------------------------------------------
% Ejemplos de uso
% ?- goldbach(28, [P1, P2]).
% Output:
% P1 = 5,
% P2 = 23.
% -----------------------------------------------------------------
