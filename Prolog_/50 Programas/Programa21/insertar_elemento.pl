% ===============================================
% Autor: Erick Corrales
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que inserta un elemento en una lista
%              en una posicion dada
% ===============================================

% -------- Código en Python (comentado) ------------
% def insertar_elemento(lista, elemento, posicion):
%     % Insertar el elemento en la posición especificada
%     lista.insert(posicion, elemento)
%     return lista
%
% lista = [1, 2, 3, 4, 'a']
% print(f"Lista original: {lista}")
% print(f"Lista modificada: {insertar_elemento(lista, 'x', 2)}")
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Predicado insert_at(X, [], K, []) que inserta un elemento en una lista en una posicion dada

% El índice K debe ser mayor que 0.
% Caso base: si K es 1, inserta X al principio de la lista.
insert_at(X, L, 1, [X|L]).
insert_at(X, [H|T], K, [H|R]) :- 
    K > 1,
    K1 is K - 1,
    insert_at(X, T, K1, R). % Llama recursivamente para insertar X en la posición K.

% -----------------------------------------------------------------
% Ejemplos de uso
% ?- insert_at(x, [], 1, R).
% Output:
% R = [x].


% ?- insert_at(a, [b, c], 1, R).
% R = [a, b, c].
% -----------------------------------------------------------------
