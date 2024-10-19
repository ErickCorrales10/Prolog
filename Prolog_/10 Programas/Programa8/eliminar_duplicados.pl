% ===============================================
% Autor: Erick Corrales
% Fecha: 18 de octubre de 2024
% Descripción: Programa en Prolog que elimina duplicados consecutivos
%              de los elementos de una lista.
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