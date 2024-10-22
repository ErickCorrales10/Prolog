% ===============================================
% Autor: Erick Corrales
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que codifica Run-Length de manera
%              directa
% ===============================================

% -------- Código en Python (comentado) ------------
% def encode_direct(lista):
%     if not lista:
%         return []
%
%     encoded = []
%     count = 1
%     current = lista[0]
%
%     for i in range(1, len(lista)):
%         if lista[i] == current:
%             count += 1
%         else:
%             encoded.append((count, current))
%             current = lista[i]
%             count = 1
%
%     % Agregar el último grupo
%     encoded.append((count, current))
%     return encoded
%
% def count(x, lista):
%     count = 0
%     for item in lista:
%         if item == x:
%             count += 1
%         else:
%             break
%
%     return count
%
% def expand(x, n):
%     return [x] * n
%
% % Ejemplo de uso
% lista = ['a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd']
% codificada = encode_direct(lista)
% print(codificada)
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Predicado encode_direct([], []) que codifica directamente una lista usando codificacion
% Run-Length

% Cuenta cuántos elementos consecutivos son iguales.
encode_direct([], []).
encode_direct([X|Xs], [[N,X]|R]) :- 
    count(X, [X|Xs], N, Rest), 
    encode_direct(Rest, R).

% Cuenta cuántos elementos consecutivos son iguales.
count(_, [], 0, []).
count(X, [X|Xs], N, Rest) :- 
    count(X, Xs, N1, Rest), 
    N is N1 + 1.
count(X, [Y|Ys], 0, [Y|Ys]) :- 
    X \= Y.

% -----------------------------------------------------------------
% Ejemplos de uso
?- encode_direct([a, a, a, b, c, c, a, a, d, e, e, e], R).
% Output:
% R = [[3, a], [1, b], [2, c], [2, a], [1, d], [3, e]].
% -----------------------------------------------------------------
