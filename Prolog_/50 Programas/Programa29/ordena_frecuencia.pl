% ===============================================
% Autor: Erick Corrales
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que ordena una lista de listas segun la frecuencia
%              de la longitud de  las sublistas

% -------- Código en Python (comentado) ------------
% from collections import defaultdict

% def length_frequency(l):
%     length_groups = defaultdict(list)

%     for sublist in l:
%         length = len(sublist)
%         length_groups[length].append(sublist)

%     result = []
%     for length, groups in sorted(length_groups.items()):
%         count = len(groups)  
%         for group in groups:
%             result.append([count, group])

%     return result

% lista = [['a', 'b'], ['c'], ['d', 'e', 'f'], ['g'], ['h', 'i'], ['j']]
% resultado = length_frequency(lista)
% print("Frecuencia de longitudes:", resultado)
% -----------------------------------------

% -------- Código en Prolog --------------------

% Predicado length_frequency(L, F) ordena una lista de listas segun la frecuencia de la
% longitud de las sublistas

% Ordena una lista de listas de acuerdo con la frecuencia de la longitud de las sublistas.
length_frequency(L, F) :- 
    map_list_to_pairs(length, L, P), 
    msort(P, SP),                   
    encode(SP, F).                  

% Codifica la frecuencia de las longitudes.
encode([], []).
encode([H|T], [[Count, Length]|Rest]) :-
    H = _-Length,                  
    count_occurrences(Length, [H|T], Count), 
    encode(T, Rest).

% Cuenta las ocurrencias de una longitud en la lista de pares.
count_occurrences(_, [], 0).                    
count_occurrences(Length, [_-Length|T], Count) :-  
    count_occurrences(Length, T, Count1),
    Count is Count1 + 1.
count_occurrences(Length, [_-L|T], Count) :-     
    Length \= L,
    count_occurrences(Length, T, Count).

% -----------------------------------------------------------------
% Ejemplos de uso
% ?- length_frequency([[a, b], [c], [d, e, f], [g]], F).
% Output:
% F = [[1, [c]], [1, [g]], [1, [a, b]], [1, [d, e, f]]]
% -----------------------------------------------------------------
