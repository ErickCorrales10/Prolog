% ===============================================
% Autor: Erick Corrales
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que duplica los elementos de una lista 
%              un nuemero dado de veces
% ===============================================

% -------- Código en Python (comentado) ------------
% def duplicar(lista, n):
%     % Compresión de listas para duplicar los elementos
%     return [elemento for elemento in lista for _ in range(n)]
%
% lista = ['a', 'b', 'c']
% print(f'Lista original: {lista}')
% n = 3
% lista = duplicar(lista, n)
% print(f"Elementos duplicados en la lista {n} veces: {lista}")

% ----------------------------------------------

% -------- Código en Prolog --------------------

% Predicado dupli([], _, []) que duplica los elementos de una lista un 
% numero dado de veces

% Caso base: la lista vacia se mantiene vacia
dupli([], _, []).

% Caso recursivo: duplica el primer elemento N veces y continua con el resto
dupli([H|T], N, R) :-
    duplicate(H, N, D),
    dupli(T, N, R1),
    append(D, R1, R).

% Crea una lista con N repeticiones del elemento x
duplicate(_, 0, []).
duplicate(X, N, [X|R]) :-
    N > 0,
    N1 is N -1,
    duplicate(X, N1, R).

% -----------------------------------------------------------------
% Ejemplos de uso
% ?- dupli([a, b, c], 3, R).
% Output:
% R = [a, a, a, b, b, b, c, c, c].
% -----------------------------------------------------------------
