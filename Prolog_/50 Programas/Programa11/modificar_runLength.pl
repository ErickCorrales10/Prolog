% ===============================================
% Autor: Erick Corrales
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que modifica la codificación
%              Run-Length de una lista
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
% # Codificar en Run-Length
% def codificar():
%   if not lista:
%       return []
%   
%   lista_codificada = []
%
%   # Inicializar variables
%   anterior = lista[0]
%   contador = 1
%   
%   for i in range(1, len(lista)):
%       if lista[i] == anterior:
%           contador += 1
%       else:
%           lista_codificada.append((anterior, contador))
%           anterior = lista[i]
%           contador = 1
%   
%   lista_codificada.append((anterior, contador))
%   
%   return lista_codificada
%
% ingresar_elemenos()
% print(codificar())
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
% ?- 
% -----------------------------------------------------------------
