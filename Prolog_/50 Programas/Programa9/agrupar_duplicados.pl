% ===============================================
% Autor: Erick Corrales
% Fecha: 18 de octubre de 2024
% Descripción: Programa en Prolog que agrupa duplicados consecutivos
%              de los elementos de una lista en sublistas
%              Se incluye una versión comentada
%              en Python para referencia.
% ===============================================

% -------- Código en Python (comentado) ------------
% lista = []
% lista_agrupada = []
%
% def ingresar_elemenos():
%   while True:
%       print("Elemento a ingresar a la lista ('Salir' para terminar de agregar): ", end='')
%       elemento = input()
%       if elemento.lower() == 'salir':
%           break
%       else:
%           try:
%               if '.' in elemento:
%                   elemento = float(elemento) # Conversión a float
%               else:
%                   elemento = int(elemento) # Conversión a int
%               lista.append(elemento)
%           except:
%               lista.append(elemento)
%
% # Agrupar duplicados consecutivos
% def agrupar_duplicados():
%   if not lista:
%       return []
%   
%   i = 0
%   lista_agrupar = []
%
%   while i < len(lista):
%       lista_agrupar.append(lista[i])
%       while i < len(lista) - 1 and lista[i] == lista[i + 1]:
%           i += 1
%           lista_agrupar.append(lista[i])
%
%       lista_agrupada.append(lista_agrupar)
%       lista_agrupar = []
%       i += 1
%
% ingresar_elemenos()
% agrupar_duplicados()
% print(lista_agrupada)
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado pack([X|Xs], [[X|Ys]|Zs]) que agrupa duplicados consecutivos de una lista
% en sublistas

% Caso base: una lista vacía se agrupa como una lista vacía
pack([], []).

% Caso recursivo: transfiere todos los elementos consecutivos iguales a una sublista
pack([X|Xs], [[X|Ys]|Zs]) :-
    transfer(X, Xs, Ys, Rest),
    pack(Rest, Zs).

% Transfiere los elementos duplicados consecutivos a una sublista
transfer(X, [], [], []).

% Si el siguiente elemento es diferente, termina la transferencia
transfer(X, [Y|Ys], [], [Y|Ys]) :-
    X \= Y.

% Si el siguiente elemento es igual, agrégalo a la sublista
transfer(X, [X|Xs], [X|Ys], Rest) :-
    transfer(X, Xs, Ys, Rest).

% Ejemplo de uso:
% ?- pack([a, a, b, b, c, a, a], R).
%       R = [[a, a], [b, b], [c], [a, a]].

% ?- pack([], R).
%       R = [] .

% ?- pack([X], R).
%       R = [[X]].

% ?- pack([1, 2, 3], R).
%       R = [[1], [2], [3]].

% ?- pack([1, 1, 2, 2, 2, 3, 1, 1], R).
%       R = [[1, 1], [2, 2, 2], [3], [1, 1]].
% ----------------------------------------------