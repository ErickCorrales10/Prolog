% ===============================================
% Autor: Erick Corrales
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que decodifica una lista codificada
%              mediante Run-Length
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% class Program
% {
%     % Método para decodificar la lista codificada
%     public static List<T> Decode<T>(List<Tuple<int, T>> encodedList)
%     {
%         List<T> decodedList = new List<T>();
%
%         % Iterar sobre cada par en la lista codificada
%         foreach (var par in encodedList)
%         {
%             int count = par.Item1;   % Obtener el contador del par
%             T elemento = par.Item2;  % Obtener el elemento del par
%
%             % Expandir el elemento y agregarlo a la lista decodificada
%             decodedList.AddRange(Expand(elemento, count));
%         }
%
%         return decodedList; % Devolver la lista decodificada
%     }
%
%     % Método auxiliar para expandir un elemento en una lista de longitud N
%     public static List<T> Expand<T>(T elemento, int count)
%     {
%         List<T> expandedList = new List<T>();
%
%         % Agregar el elemento a la lista expandida 'count' veces
%         for (int i = 0; i < count; i++)
%             expandedList.Add(elemento);
%
%         return expandedList; % Devolver la lista expandida
%     }
%
%     % Método principal
%     static void Main(string[] args)
%     {
%         % Ejemplo de uso: lista codificada
%         List<Tuple<int, char>> encodedList = new List<Tuple<int, char>>()
%         {
%             Tuple.Create(3, 'a'), % Tres veces 'a'
%             Tuple.Create(2, 'b'), % Dos veces 'b'
%             Tuple.Create(1, 'c')   % Una vez 'c'
%         };
%
%         % Decodificar la lista
%         List<char> decodedList = Decode(encodedList);
%
%         % Imprimir la lista decodificada
%         Console.WriteLine("Lista decodificada:");
%         Console.WriteLine(string.Join(", ", decodedList));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Predicado decode([],[]) que permite decodificar una lista codificada mediante
% Run-Length

% Decodifica una lista codificada mediante Run-Length.
% Expande cada par (N, X) en una lista con N elementos X.
decode([], []).
decode([[N,X]|T], R) :- 
    decode(T, R1), 
    expand(X, N, E), 
    append(E, R1, R).

% Expande un elemento X en una lista de longitud N.
expand(_, 0, []).
expand(X, N, [X|T]) :- 
    N > 0, 
    N1 is N - 1, 
    expand(X, N1, T).

% -----------------------------------------------------------------
% Ejemplos de uso
% ?- decode([[3,a],[1,b],[2,c]], R).
% Output:
% R = [a, a, a, b, c, c].
% -----------------------------------------------------------------
