% ===============================================
% Autor: Erick Corrales
% Fecha: 18 de octubre de 2024
% Descripción: Programa en Prolog que invierte una
%              lista.
%              Se incluye una versión comentada
%              en Python para referencia.
% ===============================================

% -------- Código en Python (comentado) ------------
%  lista = []
%
%  while True:
%      print("Elemento a ingresar a la lista ('Salir' para terminar de agregar): ", end='')
%      elemento = input()
%      if elemento.lower() == 'salir':
%          break
%      else:
%          try:
%              if '.' in elemento:
%                  elemento = float(elemento) # Conversión a float
%              else:
%                  elemento = int(elemento) # Conversión a int
%              lista.append(elemento)
%          except:
%              lista.append(elemento)
%
%  print(lista)
%  lista_invertida = lista[::-1] # Invierte la lista creando una nueva lista, sin modificar la original
%  # lista.reverse() # Invierte la lista modificando la lista actual
%  # print(lista)
%  print(lista_invertida)
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado reverse_list([a, b, c, d], R) que invierte el
% orden de una lista.

reverse_list(L, R) :-
    reverse_list(L, [], R).

% Caso base: cuando la lista original está vacía, el acumulador contiene la lista invertida.
reverse_list([], Acc, Acc).

% Caso recursivo: mueve el elemento de la cabeza al acumulador
reverse_list([H|T], Acc, R) :-
    reverse_list(T, [H|Acc], R).

% Ejemplo de uso:
% ?- reverse_list([a, b, c, d], R).
% ----------------------------------------------