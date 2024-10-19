% ===============================================
% Autor: Erick Corrales
% Fecha: 18 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              el número de elementos de una lista.
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