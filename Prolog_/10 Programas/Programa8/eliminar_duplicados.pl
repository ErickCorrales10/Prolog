% ===============================================
% Autor: Erick Corrales
% Fecha: 18 de octubre de 2024
% Descripción: Programa en Prolog que elimina duplicados consecutivos
%              de los elementos de una lista.
%              Se incluye una versión comentada
%              en Python para referencia.
% ===============================================

% -------- Código en Python (comentado) ------------
% lista = []
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
% # Eliminar duplicados consecutivos 
% def eliminar_duplicados():
%   i = 0 # Indice para recorrer la lista
%
%   while i < len(lista) - 1:
%       if lista[i] == lista[i + 1]: 
%           lista.pop(i + 1) # Eliminar duplicado
%       else:
%           i += 1
%
% ingresar_elemenos()
% eliminar_duplicados()
% print(lista)
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado compress([X, X|T], R) que elimina duplicados consecutivos de una lista

% Caso base: una lista vacía se mantiene vacía
compress([], []).

% Si queda un solo elemento, no hay duplicados
compress([X], [X]).

% Caso recursivo: si el primer y segundo elemento son iguales, ignora el primero
compress([X, X|T], R) :-
    compress([X|T], R).

% Si el primer y segundo elemento son distintos, conserva el primero 
compress([X, Y|T], [X|R]) :-
    X \= Y, compress([Y|T], R).

% Ejemplo de uso:
% ?- compress([a, a, b, b, c, a, a], R).
%       R = [a, b, c, a]

% ?- compress([], R).
%       R = [] .

% ?- compress([X], R). 
%       R = [X] .

% ?- compress([1, 2, 3], R). 
%       R = [1, 2, 3].

% ?- compress([1, 1, 2, 2, 2, 3, 1, 1], R).
%       R = [1, 2, 3, 1].
% ----------------------------------------------