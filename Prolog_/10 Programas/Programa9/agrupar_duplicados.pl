% ===============================================
% Autor: Erick Corrales
% Fecha: 18 de octubre de 2024
% Descripción: Programa en Prolog que agrupa duplicados consecutivos
%              de los elementos de una lista en sublistas
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