% ===============================================
% Autor: Erick Corrales
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que agrupa los elementos de un conjunto
%              en subconuntos disjuntos

% -------- Código en Python (comentado) ------------
% Importacion de la funcion combinations del modulo itertools.
% from itertools import combinations.

% Definicion de la funcion grupo_elementos que genera grupos de elementos segun el tamano especificado.
% def grupo_elementos(lista, tam):
%     % Caso base: si la lista y el tamano estan vacios, devuelve una lista con una lista vacia.
%     if not lista and not tam:
%         return [[]]
%     
%     % Caso base: si la lista o el tamano estan vacios, devuelve una lista vacia.
%     if not lista or not tam:
%         return []
%     
%     % Toma el primer elemento de la lista de tamanos.
%     tamanio = tam[0]
%     resultado = []
%     
%     % Itera sobre todas las combinaciones posibles de la lista del tamano especificado.
%     for group in combinations(lista, tamanio):
%         % Crea una lista de elementos restantes que no estan en el grupo actual.
%         elementos_restantes = [item for item in lista if item not in group]
%         % Llama recursivamente a la funcion para obtener grupos restantes segun los tamanos restantes.
%         grupos_restantes = grupo_elementos(elementos_restantes, tam[1:])
%         % Anade el grupo actual a los grupos restantes.
%         for rest_groups in grupos_restantes:
%             resultado.append([list(group)] + rest_groups)
% 
%     % Devuelve el resultado final.
%     return resultado
% 
% Lista de elementos a agrupar.
% lista = [1, 2, 3, 4, 5, 6]
% % Tamanos de los grupos a formar.
% tam = [2, 2, 2]
% % Intenta obtener los grupos resultantes y los imprime.
% try:
%     resultado = grupo_elementos(lista, tam)
%     print(f"Grupos resultantes:")
%     for i in resultado:
%         print(i)
% except ValueError as e:
%     print(e)
% -----------------------------------------

% -------- Código en Prolog --------------------

% Predicado group([N|Ns], Es, [G|Gs]) agrupa los elementos de un conjunto en subconjuntos disjuntos 
% dados los tamanios de los subgrupos

group([], [], []).
group([N|Ns], Es, [G|Gs]) :-
    combination(N, Es, G),
    subtract(Es, G, Rest),
    group(Ns, Rest, Gs).

combination(0, _, []).

combination(K, [H|T], [H|Comb]) :-
    K > 0,
    K1 is K - 1,
    combination(K1, T, Comb).

combination(K, [_|T], Comb) :-
    K > 0,
    combination(K, T, Comb).
% -----------------------------------------------------------------
% Ejemplos de uso
% ?- group([2, 2, 2], [1, 2, 3, 4, 5, 6], Gs).
% Output:
% Gs = [[1, 2], [3, 4], [5, 6]] ;
% Gs = [[1, 2], [3, 5], [4, 6]] ;
% Gs = [[1, 2], [3, 6], [4, 5]] ;
% Gs = [[1, 2], [4, 5], [3, 6]] ;
% Gs = [[1, 2], [4, 6], [3, 5]] ;
% Gs = [[1, 2], [5, 6], [3, 4]] ;
% Gs = [[1, 3], [2, 4], [5, 6]] ;
% Gs = [[1, 3], [2, 5], [4, 6]] ;
% Gs = [[1, 3], [2, 6], [4, 5]] ;
% Gs = [[1, 3], [4, 5], [2, 6]] ;
% Gs = [[1, 3], [4, 6], [2, 5]] ;
% Gs = [[1, 3], [5, 6], [2, 4]] ;
% Gs = [[1, 4], [2, 3], [5, 6]] ;
% Gs = [[1, 4], [2, 5], [3, 6]] ;
% Gs = [[1, 4], [2, 6], [3, 5]] ;
% Gs = [[1, 4], [3, 5], [2, 6]] ;
% Gs = [[1, 4], [3, 6], [2, 5]] ;
% Gs = [[1, 4], [5, 6], [2, 3]] ;
% Gs = [[1, 5], [2, 3], [4, 6]] ;
% Gs = [[1, 5], [2, 4], [3, 6]] ;
% Gs = [[1, 5], [2, 6], [3, 4]] ;
% Gs = [[1, 5], [3, 4], [2, 6]] ;
% Gs = [[1, 5], [3, 6], [2, 4]] ;
% Gs = [[1, 5], [4, 6], [2, 3]] ;
% Gs = [[1, 6], [2, 3], [4, 5]] ;
% Gs = [[1, 6], [2, 4], [3, 5]] ;
% Gs = [[1, 6], [2, 5], [3, 4]] ;
% Gs = [[1, 6], [3, 4], [2, 5]] ;
% Gs = [[1, 6], [3, 5], [2, 4]] ;
% Gs = [[1, 6], [4, 5], [2, 3]] ;
% Gs = [[2, 3], [1, 4], [5, 6]] ;
% Gs = [[2, 3], [1, 5], [4, 6]] ;
% Gs = [[2, 3], [1, 6], [4, 5]] ;
% Gs = [[2, 3], [4, 5], [1, 6]] ;
% Gs = [[2, 3], [4, 6], [1, 5]] ;
% Gs = [[2, 3], [5, 6], [1, 4]] ;
% Gs = [[2, 4], [1, 3], [5, 6]] ;
% Gs = [[2, 4], [1, 5], [3, 6]] ;
% Gs = [[2, 4], [1, 6], [3, 5]] ;
% -----------------------------------------------------------------
