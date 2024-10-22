% ===============================================
% Autor: Erick Corrales
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que elimina cada n-esimo elemento
%              de una lista
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% class Program
% {
%     static List<T> EliminarNEsimo<T>(List<T> lista, int nesimo)
%     {
%         List<T> resultado = new List<T>();

%         % Iterar sobre la lista, desde el primer elemento hasta el último
%         for (int i = 1; i <= lista.Count; i++)
%             % Si el índice no es múltiplo de nesimo, agregar a la lista de resultados
%             if (i % nesimo != 0)
%                 resultado.Add(lista[i-1]);

%         return resultado; % Devolver la lista sin los elementos n-ésimos
%     }

%     static void Main(string[] args)
%     {
%         int nesimo = 3;
%         List<int> lista = new List<int> { 1, 2, 3, 4, 5, 6, 7, 8};

%         % Imprimir la lista original
%         Console.WriteLine($"La lista original es: {string.Join(", ", lista)}");

%         % Imprimir la lista sin los elementos n-ésimos
%         Console.WriteLine($"La lista sin el {nesimo}º elemento es: {string.Join(", ", EliminarNEsimo(lista, nesimo))}");
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Predicado drop(L, N, R) que elimina cada n-esimo elemento de una lista

% Utiliza un contador para determinar cuando eliminar un elemento
drop(L, N, R) :-
    drop(L, N, N, R).

% Caso base: cuando la lista esta vacia, el resultado es vacio
drop([], _, _, []).

% Si el contador llega a 1, omite el primer elemento y reinicia el contador
drop([_|T], 1, N, R) :-
    drop(T, N, N, R).

% Caso recursivo: disminuye el contador y conserva el elemento
drop([H|T], K, N, [H|R]) :-
    K > 1,
    K1 is K - 1,
    drop(T, K1, N, R).

% -----------------------------------------------------------------
% Ejemplos de uso
% ?- drop([a, b, c, d, e, f, g, h, i], 3, R).
% Output:
% R = [a, b, d, e, g, h].

% ?- drop([1, 2, 3, 4, 5, 6], 2, R).
% R = [1, 3, 5].
% -----------------------------------------------------------------
