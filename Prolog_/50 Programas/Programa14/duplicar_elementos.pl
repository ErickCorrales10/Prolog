% ===============================================
% Autor: Erick Corrales
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que duplica los elementos de una lista 
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% class Program
% {

%     static List<T> DuplicarElementosLista<T>(List<T> lista)
%     {
%         List<T> result = new List<T>();
%
%         % Iterar sobre cada elemento en la lista
%         foreach (var item in lista)
%         {
%             result.Add(item); % Agregar el elemento original
%             result.Add(item); % Agregar el elemento duplicado
%         }
%
%         return result; % Devolver la lista duplicada
%
%     }
%
%     static void Main(string[] args)
%     {
%         List<char> lista = new List<char>() {'a', 'b', 'c', 'd', 'e'};
%
%         % Duplicar los elementos de la lista
%         List<char> listaDuplicada = DuplicarElementosLista(lista);
%
%         % Imprimir la lista duplicada
%         Console.WriteLine("La lista duplicada es: " + string.Join(", ", listaDuplicada));
%         Console.ReadKey(); % Esperar a que el usuario presione una tecla
%     }
%
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Predicado dupli([], []) que duplica los elementos de una lista

% Caso base: la lista vacia se mantiene vacia
dupli([], []).

% Caso recursivo: duplica el primer elemento y continua con el resto
dupli([H|T], [H,H|R]) :-
    dupli(T, R).

% -----------------------------------------------------------------
% Ejemplos de uso
% ?- dupli([a, b, c], R).
% Output:
% R = [a, a, b, b, c, c].
% -----------------------------------------------------------------
