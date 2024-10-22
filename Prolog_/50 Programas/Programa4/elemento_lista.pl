% ===============================================
% Autor: Erick Corrales
% Fecha: 18 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              el número de elementos de una lista.
%              Se incluye una versión comentada
%              en Python para referencia.
% ===============================================

% -------- Código en Python (comentado) ------------
%   lista = []
%
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
%                   lista.append(elemento)
%           except:
%               lista.append(elemento)
%
%   print(lista)
%   print(f'La lista tiene {len(lista)} elementos')
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado list_length([a, b, c, d], N) que determina el número
% de elementos de una lista.

% Caso base: si la lista está vacía la longitud es 0
list_length([], 0).

% Caso recursivo: la longitud es 1 mas que la longitud de la cola.
list_length([_|T], N) :-
    list_length(T, N1),
    N is N1 + 1.

% Ejemplo de uso:
% ?- list_length([a, b, c, d], N).
% ----------------------------------------------