% ===============================================
% Autor: Erick Corrales
% Fecha: 26 de octubre de 2024
% Descripción: Programa en Prolog que genera un arbol de Huffman dado un conjunto
%              de frecuencias

% -------- Código en C# (comentado) ------------

% -------- Código en Prolog --------------------

% Predicado huffman(Fs, Hs) que genera un arbol de Huffman dado un conjunto
% de frecuencias

% Define las frecuencias
frequencies(Fs) :- 
    Fs = [fr(a, 5), fr(b, 9)].  % Ejemplo con dos frecuencias.

% Predicado huffman(Fs, Hs) que genera un árbol de Huffman dado un conjunto de frecuencias.
huffman(Fs, H) :- 
    length(Fs, Len), 
    Len > 0,  % Permitir al menos una frecuencia
    sort(2, @=<, Fs, Sorted), 
    huffman_tree(Sorted, H).

% Caso base: un solo elemento en la lista.
huffman_tree([fr(X, _)], hc(X)) :- !.

% Caso para dos elementos: crear un nodo que combine las dos frecuencias.
huffman_tree([fr(X1, F1), fr(X2, F2)], hc(0, hc(X1, F1), hc(X2, F2))) :- !.

% Caso general: combinar los dos nodos de menor frecuencia.
huffman_tree([fr(X1, F1), fr(X2, F2) | Rest], Tree) :- 
    F is F1 + F2,
    NewNode = fr(0, F),  % Crear un nuevo nodo con la suma de frecuencias.
    append(Rest, [NewNode], NewList),
    sort(2, @=<, NewList, SortedList),
    huffman_tree(SortedList, Tree).

% Función para mostrar el árbol de Huffman
display_huffman_tree(hc(X)) :- 
    format('~w', [X]), !.

display_huffman_tree(hc(X, Left, Right)) :- 
    format('(~w ', [X]),
    display_huffman_tree(Left),
    format(' '),
    display_huffman_tree(Right),
    format(')'), !.

% Predicado para ejecutar y mostrar el árbol de Huffman
generate_huffman_tree :- 
    frequencies(Fs),
    huffman(Fs, H),
    write('Árbol de Huffman: '), nl,
    display_huffman_tree(H), nl.








% -----------------------------------------------------------------
% Ejemplos de uso
% ?- .
% Output:
% -----------------------------------------------------------------
