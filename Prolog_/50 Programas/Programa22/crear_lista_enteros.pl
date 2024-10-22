% ===============================================
% Autor: Erick Corrales
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que crea una lista con todos los enteros dentro de 
%              un rango dado
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% class Program
% {
%     % Método para crear una lista de enteros en un rango dado
%     static List<int> CrearListaEnteros(int inicio, int fin) => Enumerable.Range(inicio, fin - inicio + 1).ToList();
%
%     static void Main(string[] args)
%     {
%         int inicio = -5; % Valor de inicio del rango
%         int fin = 5; % Valor final del rango
%
%         % Imprimir la lista de enteros desde el inicio hasta el fin
%         Console.WriteLine($"Lista de enteros desde el {inicio} hasta el {fin}: " +
%         string.Join(", ", CrearListaEnteros(inicio, fin))});
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Predicado range(I, K, []) que crea una lista con todos los enteros dentro de un rango dado

% Caso base: cuando el inicio y el final son iguales.
range(I, I, [I]).
% Caso recursivo: agrega el inicio a la lista y continúa con el siguiente número.
range(I, K, [I|R]) :- 
    I < K,
    I1 is I + 1,
    range(I1, K, R).

% -----------------------------------------------------------------
% Ejemplos de uso
% ?- range(1, 5, R).
% Output:
% R = [1, 2, 3, 4, 5].
% -----------------------------------------------------------------
