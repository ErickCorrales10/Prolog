% ===============================================
% Autor: Erick Corrales
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que determina los factores primos de un numero
%              entero positivo (con multiplicidad)

% -------- Código en Python (comentado) ------------
% def next_factor(f):
%     return f + 2 if f > 2 else 3
%
% def prime_factors(n):
%     factors = []
%     if n <= 1:
%         return factors
%     f = 2
%     while f * f <= n:
%         while n % f == 0:
%             factors.append(f)
%             n //= f
%         f = next_factor(f)
%     if n > 1:
%         factors.append(n)
%     return factors
%
% def count_occurrences(x, lst):
%     return lst.count(x)
%
% def remove_occurrences(x, lst):
%     return [y for y in lst if y != x]
%
% def encode(factors):
%     encoded = []
%     while factors:
%         h = factors[0]
%         count = count_occurrences(h, factors)
%         encoded.append((h, count))
%         factors = remove_occurrences(h, factors)
%     return encoded
%
% def prime_factors_mult(n):
%     % Determina los factores primos con su multiplicidad.
%     factors = prime_factors(n)
%     return encode(factors)
%
% print(prime_factors_mult(28))
% -----------------------------------------

% -------- Código en Prolog --------------------


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

% -----------------------------------------------------------------
% Ejemplos de uso
% ?- prime_factors_mult(28, L).
% Output:
% L = [(2, 2), (7, 1)].
% -----------------------------------------------------------------
