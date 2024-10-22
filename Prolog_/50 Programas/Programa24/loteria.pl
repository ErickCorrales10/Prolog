% ===============================================
% Autor: Erick Corrales
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que extrae n numeros aleatrios de un rango

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% class Program
% {
%     static void Main(string[] args)
%     {
%         List<int> numeros = new List<int>(); % Inicializar la lista de números aleatorios
%         int inicio = 1; % Valor de inicio del rango
%         int fin = 50; % Valor final del rango
%         int total = 3; % Número total de números aleatorios a generar
%         
%         % Generar números aleatorios mientras total sea mayor que 0
%         while (total > 0)
%         {
%             Random random = new Random(); % Crear una nueva instancia de Random
%             numeros.Add(random.Next(inicio, fin + 1)); % Agregar un número aleatorio a la lista
%             total--; % Decrementar el total
%         }
%
%         Console.WriteLine("Números aleatorios:"); % Imprimir la cabecera
%         foreach (var numero in numeros) % Iterar sobre la lista de números
%             Console.Write(numero + " "); % Imprimir cada número en la misma línea
%     }
% }
% -----------------------------------------

% -------- Código en Prolog --------------------

% Predicado lotto(N, M, L) que extrae n numeros aleatorios de un rango dado
% Utiliza la función range para generar la lista de números y luego selecciona aleatoriamente.
lotto(N, M, L) :- 
    range(1, M, R),
    rnd_select(R, N, L).

% Caso base: cuando el inicio y el final son iguales.
range(I, I, [I]).
% Caso recursivo: agrega el inicio a la lista y continúa con el siguiente número.
range(I, K, [I|R]) :- I < K, I1 is I + 1, range(I1, K, R).

% Extrae un número dado de elementos aleatorios de una lista.
% Utiliza un generador de números aleatorios y elimina los elementos seleccionados.
rnd_select(_, 0, []).
rnd_select(L, N, [X|R]) :- 
    length(L, Len),
    random(1, Len, I),
    element_at(X, L, I),
    delete(L, X, L1),
    N1 is N - 1,
    rnd_select(L1, N1, R).

% Extrae el elemento en la posición I de la lista L.
element_at(X, [X|_], 1). % Caso base: el primer elemento.
element_at(X, [_|T], I) :- 
    I > 1, 
    I1 is I - 1, 
    element_at(X, T, I1). % Llama recursivamente para obtener el siguiente elemento.
% -----------------------------------------------------------------
% Ejemplos de uso
% ?- lotto(3, 50, L).
% Output:
% L = [X, Y, Z]. % Donde X, Y, Z son números aleatorios entre 1 y 49.
% -----------------------------------------------------------------
