% ===============================================
% Autor: Erick Corrales
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que modifica la codificación
%              Run-Length de una lista
% ===============================================

% -------- Código en Python (comentado) ------------
% def encode_modified(list):
%     encoded = encode(list)
%     return modify(encoded)
%
% def modify(encoded):
%     result = []
%
%     for count, element in encoded:
%         if count == 1:
%             result.append(element)
%         else:
%             result.append(f'{count}{element}')

%     return result  

% def encode(list):
%     packed = pack(list)
%     return transform(packed)

% def pack(list):
%     if not list:
%         return []
    
%     packed = []
%     current_group = [list[0]]

%     for element in list[1:]:
%         if element == current_group[-1]:
%             current_group.append(element)
%         else:
%             packed.append(current_group)
%             current_group = [element]

%     packed.append(current_group)
%     return packed

% def transform(packed):
%     return [(len(sublista), sublista[0]) for sublista in packed]

% lista = ['a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e']
% result = encode_modified(lista)
% print(result)

% ----------------------------------------------

% -------- Código en Prolog --------------------

% Predicado encode_modified(L, R) que permite modificar la codificación Run-Length de una lista

% Si un elemento no tiene duplicados, se mantiene sin empaquetar
encode_modified(L, R) :-
    encode(L, Enc),
    modify(Enc, R).

% Caso base: lista vacía
modify([], []).

% Si hay un solo elemento, agregalo directamente
modify([[1, X]|T], [X|R]) :-
    modify(T, R).

% Si hay mas de un elemento, manten el formato (N, X)
modify([[N, X]|T], [[N, X]|R]) :-
    N > 1,
    modify(T, R).

% Predicado encode(L, R) que permite codificar una lista usando Run-Length
encode(L, R) :-
    pack(L, P),
    transform(P, R).

% Caso base: una lista vacía se agrupa como una lista vacía
pack([], []).

% Caso recursivo: transfiere todos los elementos consecutivos iguales a una sublista
pack([X|Xs], [[X|Ys]|Zs]) :-
    transfer(X, Xs, Ys, Rest),
    pack(Rest, Zs).

% Transforma sublistas en parejas (N, X), donde N es la cantidad de elementos
transform([], []).
transform([[X|Xs]|Ys], [[N, X]|Zs]) :-
    length([X|Xs], N),
    transform(Ys, Zs).

% Transfiere los elementos duplicados consecutivos a una sublista
transfer(X, [], [], []).

% Si el siguiente elemento es diferente, termina la transferencia
transfer(X, [Y|Ys], [], [Y|Ys]) :-
    X \= Y.

% Si el siguiente elemento es igual, agrégalo a la sublista
transfer(X, [X|Xs], [X|Ys], Rest) :-
    transfer(X, Xs, Ys, Rest).


% -----------------------------------------------------------------
% Ejemplos de uso
% ?- encode_modified([a, a, a, b, c, c, a, a, d, e, e, e], R).
% Output:
% R = [[3, a], b, [2, c], [2, a], d, [3, e]]
% -----------------------------------------------------------------
