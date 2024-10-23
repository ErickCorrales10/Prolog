% ===============================================
% Autor: Erick Corrales
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que genera combinaciones de K
%              elementos seleccionados de una lista dada

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% class Program
% {
%     static List<List<T>> Combinacion<T>(int k, List<T> lista)
%     {
%         % Lista de resultados donde se almacenarán las combinaciones
%         List<List<T>> resultado = new List<List<T>>();

%         % Caso base: si k es 0, agregar una lista vacía y retornar el resultado
%         if (k == 0)
%         {
%             resultado.Add(new List<T>());
%             return resultado;
%         }

%         % Si la lista está vacía, no hay combinaciones posibles, retornar resultado vacío
%         if (lista.Count == 0)
%             return resultado;

%         % Obtener la cabeza (primer elemento) y la cola (el resto de la lista)
%         T head = lista[0];
%         List<T> tail = lista.GetRange(1, lista.Count - 1);

%         % Generar combinaciones con el primer elemento
%         foreach (var combinacion in Combinacion(k - 1, tail))
%         {
%             combinacion.Insert(0, head);
%             resultado.Add(combinacion);
%         }

%         % Generar combinaciones sin el primer elemento
%         resultado.AddRange(Combinacion(k, tail));

%         return resultado;
%     }

%     static void Main(string[] args)
%     {
%         % Lista de enteros para generar combinaciones
%         List<int> lista = new List<int> { 1, 2, 3, 4, 5};
%         int k = 3;

%         % Generar las combinaciones de k elementos
%         List<List<int>> combinaciones = Combinacion(k, lista);

%         % Imprimir combinaciones
%         Console.WriteLine("Combinaciones");
%         foreach (var combinacion in combinaciones)
%             Console.WriteLine("[" + string.Join(", ", combinacion) + "]");
%     }

% }
% -----------------------------------------

% -------- Código en Prolog --------------------

% Predicado combination(K, [H|T], [H|Comb]) que genera todas las combinaciones de K elementos
% seleccionados de una lista dada

combination(0, _, []).

combination(K, [H|T], [H|Comb]) :-
    K > 0,
    K1 is K - 1,
    combination(K1, T, Comb).

combination(K, [_|T], Comb) :-
    K > 0,
    combination(K, T, Comb).

% -----------------------------------------------------------------
% Ejemplos de uso
% ?- combination(2, [a, b, c], Comb).
% Output:
% Comb = [a, b] ;
% Comb = [a, c] ;
% Comb = [b, c] ;
% -----------------------------------------------------------------
