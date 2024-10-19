% ===============================================
% Autor: Erick Corrales
% Fecha: 18 de octubre de 2024
% Descripción: Programa en Prolog que codifica una lista de modo
%              Run-Length 
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
% ?- encode([a, a, a, b, b, c, c, c, c, d], R).
%       R = [[3, a], [2, b], [4, c], [1, d]]
% -----------------------------------------------------------------
