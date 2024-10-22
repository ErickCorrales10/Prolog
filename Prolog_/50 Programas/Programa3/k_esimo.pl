% ===============================================
% Autor: Erick Corrales
% Fecha: 18 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              el k-esimo elemento de una lista.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%       private static IList<string> _lista = new List<string> {"Erick", "Messi", "Federer", "Ronaldinho"}; 
%
%       public static void Main(string[] args)
%       {
%           BuscarLista();
%           Console.Clear();
%       }
%
%       static void BuscarLista()
%       {
%           int posicion;
%
%           while(true)
%           {
%               Console.Clear();
%               Console.WriteLine("Valores en la lista: ");
%               foreach (var item in _lista)
%                   Console.WriteLine(item);
%
%               Console.Write($"Ingrese la posición  del elemento a buscar (número máximo: {_lista.Count}): ");
%               string ?entrada = Console.ReadLine();
%
%               // Intentar convertir la entrada a un número entero
%               if (int.TryParse(entrada, out posicion))
%               {
%                   // Verificar si la posición es válida
%                   if (posicion >= 0 && posicion < _lista.Count)
%                   {
%                       Console.WriteLine($"El elemento en la posición {posicion} es: {_lista[posicion]}");
%                       Console.ReadKey();
%                       break;
%                   }
%                   else
%                   {
%                       Console.WriteLine($"Por favor, ingrese una posición válida dentro del rango");
%                       Console.ReadKey();
%                   }
%               }
%               else
%               {
%                   Console.WriteLine($"Entrada no válida. Debe ingresar un número");
%                   Console.ReadKey();
%               }
%           }
%           
%       }
%   }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado element_at(X, [_|T], K) que determina el k-esimo 
% elemento X de una lista.

% Caso base: se busca el primer elemento de la lista
element_at(X, [X|_], 1).

% Caso recursivo: Se busca un elemento en una posición mayor que 1
element_at(X, [_|T], K) :-
    K > 1,
    K1 is K - 1,
    element_at(X, T, K1).

% Ejemplo de uso:
% ?- element_at(X, [a, b, c, d], 2).
% ----------------------------------------------