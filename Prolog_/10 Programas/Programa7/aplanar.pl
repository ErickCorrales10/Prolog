% ===============================================
% Autor: Erick Corrales
% Fecha: 18 de octubre de 2024
% Descripción: Programa en Prolog que aplana una lista anidada
%              en una lista simple.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para encontrar el último elemento de una lista en C#.
%     static T MyLast<T>(List<T> list)
%     {
%         if (list == null || list.Count == 0)
%             throw new ArgumentException("La lista no puede estar vacía.");
%         
%         return list[list.Count - 1]; // Devuelve el último elemento.
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd' };
%         char ultimoElemento = MyLast(lista);
% 
%         Console.WriteLine("El último elemento es: " + ultimoElemento);
%     }
% }
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