% ===============================================
% Autor: Erick Corrales
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que extrae una porcion de una lista
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% class Program
% {
%     % Método para extraer un rango de la lista
%     static List<T> ExtraerRangoLista<T>(List<T> lista, int n, int m) => lista.GetRange(n - 1, m - n + 1);
%
%     static void Main(string[] args)
%     {
%         List<char> lista = new List<char>() {'a', 'b', 'c', 'd', 'e', 'f'};
%
%         % Imprimir la lista original
%         Console.WriteLine($"Lista original: {string.Join(", ", lista)}");
%
%         % Imprimir la lista modificada con el rango extraído
%         Console.WriteLine($"Lista modificada: {string.Join(", ", ExtraerRangoLista(lista, 3, 5))}");
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Predicado slice([H|T], I, K, R) que extrae una porcion de una lista, dado un rango

% Los índices I y K deben ser mayores que 0.
slice([H|_], 1, 1, [H]).
slice([H|T], 1, K, [H|R]) :- 
    K > 1,
    K1 is K - 1,
    slice(T, 1, K1, R).

slice([_|T], I, K, R) :- 
    I > 1,
    I1 is I - 1,
    K1 is K - 1,
    slice(T, I1, K1, R).

% -----------------------------------------------------------------
% Ejemplos de uso
% slice([a, b, c, d, e, f], 3, 5, R).
% Output:
% R = [c, d, e].
% -----------------------------------------------------------------
