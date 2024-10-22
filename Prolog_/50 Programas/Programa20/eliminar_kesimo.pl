% ===============================================
% Autor: Erick Corrales
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que elimina el k-esimo elemento
%              de una lista
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% class Program
% {
%     % Método para eliminar el k-ésimo elemento de la lista
%     static List<T> EliminarKEsimoElemento<T>(List<T> lista, int k)
%     {
%         lista.RemoveAt(k - 1); % Eliminar el elemento en la posición k-1
%         return lista; % Devolver la lista modificada
%     }
%
%     static void Main(string[] args)
%     {
%         List<int> lista = new List<int> { 1, 2, 3, 4, 5};
%
%         % Imprimir la lista original
%         Console.WriteLine($"List original: {string.Join(", ", lista)}");
%
%         % Imprimir la lista con el k-ésimo elemento removido
%         Console.WriteLine($"Lista con el k-ésimo elemento removido: {string.Join(", ", EliminarKEsimoElemento(lista, 3))}");
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Predicado remove_at(X, [X|T], K, T) que elimina el k-esimo elemento de una lista

% El índice K debe ser mayor que 0.

% Caso base: si K es 1, eliminamos el primer elemento.
remove_at(X, [X|T], 1, T).
remove_at(X, [H|T], K, [H|R]) :- 
    K > 1,
    K1 is K - 1,
    remove_at(X, T, K1, R).  % Llama recursivamente para eliminar el elemento en la posición K.

% -----------------------------------------------------------------
% Ejemplos de uso
% ?- remove_at(X, [a, b, c, d], 1, R).
% Output:
% X = a,
% R = [b, c, d].
% -----------------------------------------------------------------
