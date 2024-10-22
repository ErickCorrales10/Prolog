% ===============================================
% Autor: Erick Corrales
% Fecha: 18 de octubre de 2024
% Descripción: Programa en Prolog que aplana una lista anidada
%              en una lista simple.
%              Se incluye una versión comentada
%              en Python para referencia.
% ===============================================

% -------- Código en Python (comentado) ------------
%
% def ingresar_elementos():
%   entrada = input("Ingresa una lista anidada (por ejemplo, [1, [2, [3, 4]], 5]): ")
%
%   try:
%       lista_anidada = eval(entrada)  # eval convierte la cadena a una lista
%       if isinstance(lista_anidada, list):  # Asegurarse de que la entrada sea una lista válida
%           resultado = my_flatten(lista_anidada)
%           print("Lista aplanada:", resultado)
%       else:
%           print("La entrada no es una lista válida.")
%   except:
%       print("Error: La entrada no es válida.")
%
% def my_flatten(lista_anidada):
%   lista = []  # Lista para almacenar los elementos aplanados
%   for elemento in lista_anidada:
%       if isinstance(elemento, list):
%           lista.extend(my_flatten(elemento))  # Aplanar recursivamente si es una lista
%       else:
%           lista.append(elemento)  # Agregar el elemento si no es lista
%   return lista
%
% ingresar_elementos()

% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado my_flatten([H|T], Flat) que aplana una lista anidada en una lista simple.

% Caso base: la lista vacía se aplana a una lista vacía
my_flatten([], []).

% Caso recursivo: si la cabeza es una lista, aplana la cabeza y la cola recursivamente
my_flatten([H|T], Flat) :-
    my_flatten(H, FH),
    my_flatten(T, FT),
    append(FH, FT, Flat).

% Si la cabeza no es una lista, simplemente agrégala al resultado
my_flatten(X, [X]) :-
    X \= [], \+ is_list(X).

% Ejemplo de uso:
% ?- my_flatten([a, [b, a], [[d], e]], Flat).
%       Flat = [a, b, a, d, e] .

% ?- my_flatten([], Flat).
%       Flat = [] .

% ?- my_flatten([1, 2, 3], Flat). 
%       Flat = [1, 2, 3] .

% ?- my_flatten([1, [2, [3, 4], 5], 6], Flat). 
%       Flat = [1, 2, 3, 4, 5, 6] 
% ----------------------------------------------