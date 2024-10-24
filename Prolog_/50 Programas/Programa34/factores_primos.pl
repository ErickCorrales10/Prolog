% ===============================================
% Autor: Erick Corrales
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que determina los factores
%              primos de un numero entero positivo

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class Program
% {
%     static void Main(string[] args)
%     {
%         int number = 100; % Cambia este número para probar otros
%         List<int> factors = new List<int>();
%         
%         PrimeFactors(number, factors);
%         
%         Console.WriteLine("Los factores primos de " + number + " son: " + string.Join(", ", factors));
%     }
%
%     static void PrimeFactors(int N, List<int> factors)
%     {
%         if (N <= 1) return;
%
%         % Comienza a buscar factores desde 2
%         PrimeFactors(N, 2, factors);
%     }
%
%     static void PrimeFactors(int N, int F, List<int> factors)
%     {
%         % Si N es divisible por F
%         if (N > 1 && N % F == 0)
%         {
%             factors.Add(F);
%             Console.WriteLine($"Dividiendo: {N} por {F}"); % Mensaje de depuración
%             PrimeFactors(N / F, F, factors); % Continuar con N // F
%         }
%         else if (N > 1 && F * F <= N)
%         {
%             % Buscar el siguiente factor solo si no es divisible
%             if (N % F != 0)
%             {
%                 Console.WriteLine($"Buscando siguiente factor para: {F}"); % Mensaje de depuración
%                 PrimeFactors(N, NextFactor(F), factors);
%             }
%         }
%         else if (N > 1 && F * F > N)
%         {
%             % Si N es mayor que 1 y F es mayor que la raíz cuadrada de N
%             factors.Add(N);
%         }
%     }
%
%     static int NextFactor(int F)
%     {
%         return F > 2 ? F + 2 : 3; % Para 2, retorna 3, de lo contrario, incrementa por 2
%     }
% }
% -----------------------------------------

% -------- Código en Prolog --------------------

% Predicado prime_factors(N, L) qe encuentra los factores primos de un numero entero positivo

prime_factors(N, L) :- 
    N > 1,
    prime_factors(N, 2, L).

prime_factors(1, []).

% Si N es divisible por F, se agrega F a la lista de factores y se continúa con N // F
prime_factors(N, F, [F|L]) :- 
    N > 1,
    0 is N mod F, 
    N1 is N // F, 
    prime_factors(N1, F, L).

% Si N no es divisible por F, buscar el siguiente factor
prime_factors(N, F, L) :- 
    N > 1,
    F * F =< N,
    0 \= N mod F,  % Solo buscar si no es divisible
    next_factor(F, F1), 
    prime_factors(N, F1, L).

% Si N es mayor que 1 y F es mayor que la raíz cuadrada de N, agregar N a la lista
prime_factors(N, F, [N]) :- 
    N > 1,
    F * F > N.

next_factor(2, 3).  
next_factor(F, F1) :- 
    F > 2,
    F1 is F + 2.

% -----------------------------------------------------------------
% Ejemplos de uso
% ?- prime_factors(28, L).
% Output:
% L = [2, 2, 7]
% -----------------------------------------------------------------
