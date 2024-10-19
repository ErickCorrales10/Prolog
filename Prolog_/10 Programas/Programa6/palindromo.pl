% ===============================================
% Autor: Erick Corrales
% Fecha: 18 de octubre de 2024
% Descripción: Programa en Prolog que determina si 
%              una lista es un palíndromo.
%              Se incluye una versión comentada
%              en Python para referencia.
% ===============================================

% -------- Código en Python (comentado) ------------
%   lista = []
%
%   def ingresar_elementos():
%       while True:
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
%
%   def palindromo():
%       for i in range(len(lista)):
%           if lista[i] != lista[len(lista) - i - 1]:
%               return False
%       return True
%
%   ingresar_elementos()
%   print(lista)
%   print("La lista es palíndroma" if palindromo() else "La lista no es palíndroma")
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado palindrome(L) que verifica si una lista es un palíndromo.

% Una lista es un palíndromo si es igual a su inversa
palindrome(L) :-
    reverse_list(L, L).

% Utiliza un acumulador para ir construyendo la lista invertida.
reverse_list(L, R) :- 
    reverse_list(L, [], R).

% Caso base: cuando la lista original está vacía, el acumulador contiene la lista invertida.
reverse_list([], Acc, Acc).

% Caso recursivo: mueve el elemento de la cabeza al acumulador
reverse_list([H|T], Acc, R) :-
    reverse_list(T, [H|Acc], R).

% Ejemplo de uso:
% ?- palindrome([a, b, a]).
% ----------------------------------------------