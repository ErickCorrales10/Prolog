% ===============================================
% Autor: Erick Corrales
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que rota una lista un numero n
%              de lugares a la izquierda
% ===============================================

% -------- Código en Python (comentado) ------------
% def rotar_lista(lista, n):
%     % Verificar si la lista está vacía
%     if len(lista) == 0:
%         return lista
%
%     length = len(lista) % Obtener la longitud de la lista
%
%     n = n % length % Ajustar n para que esté dentro del rango
%
%     % Retornar la lista rotada
%     return lista[n:] + lista[:n]
%
% lista = [1, 2, 3, 4, 5]
% print(f"Lista original: {lista}")
% print(f"Lista rotada: {rotar_lista(lista, 2)}")
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Predicado rotate(L, N, R) que rota una lista un numero N de lugares a la izquierda

% Utiliza la longitud de la lista para manejar rotaciones mayores que la longitud.
rotate(L, N, R) :- 
    length(L, Len),
    Len > 0,
    N1 is N mod Len,
    split(L, N1, L1, L2),
    append(L2, L1, R).

% La longitud de la primera parte esta dad por el segundo argumento
split(L, 0, [], L).

split([H|T], N, [H|L1], L2) :-
    N > 0,
    N1 is N - 1,
    split(T, N1, L1, L2).

% -----------------------------------------------------------------
% Ejemplos de uso
% ?- rotate([1, 2, 3, 4, 5], 2, R).
% Output:
% R = [3, 4, 5, 1, 2].
% -----------------------------------------------------------------
