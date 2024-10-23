% ===============================================
% Autor: Erick Corrales
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que ordena una lista de listas de acuerdo con la longitud de las sublistas

% -------- Código en C# (comentado) ------------
% Importacion de los espacios de nombres necesarios.
% using System;
% using System.Collections.Generic;
% using System.Linq;

% Definicion de la clase Program.
% using System;
% using System.Collections.Generic;
% using System.Linq;

% class Program
% {
%     static List<List<T>> OrdenarListaDeListas<T>(List<List<T>> lista) => lista.OrderBy(sublista => sublista.Count).ToList();

%     static void Main(string[] args)
%     {
%         List<List<char>> lista = new List<List<char>> {
%             new List<char> {'a', 'b'}, 
%             new List<char> {'c'}, 
%             new List<char> {'d', 'e', 'f'}
%         };

%         List<List<char>> listaDeListas = OrdenarListaDeListas(lista);

%         Console.WriteLine("Lista de listas original: [[" + string.Join("], [", lista.Select(x => string.Join(", ", x))) + "]]");
%         Console.WriteLine("Lista de listas modificada: [[" + string.Join("], [", listaDeListas.Select(x => string.Join(", ", x))) + "]]");
%     }
% }

% -----------------------------------------

% -------- Código en Prolog --------------------

% Predicado lsort(L, S) que ordena una lista de listas de acuerdo con la longitud de las sublistas

lsort(L, S) :-
    map_list_to_pairs(length, L, P),
    keysort(P, SP),
    pairs_values(SP, S).

% -----------------------------------------------------------------
% Ejemplos de uso
% ?- lsort([[a, b], [c], [d, e, f]], Sorted).
% Output:
% Sorted = [[c], [a, b], [d, e, f]].
% -----------------------------------------------------------------
