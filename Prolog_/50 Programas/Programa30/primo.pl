% ===============================================
% Autor: Erick Corrales
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que determinar si un numero entero es primo

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% class Program
% {
%     static void Main(string[] args)
%     {
%         Console.Write("Introduce un numero: ");
%         if(int.TryParse(Console.ReadLine(), out int numero))
%             if (EsPrimo(numero))
%                 Console.WriteLine($"{numero} es un numero primo.");
%             else
%                 Console.WriteLine($"{numero} no es un numero primo.");
%         else
%             Console.WriteLine("Por favor ingrese un numero valido");
%     }

%     static bool EsPrimo(int numero)
%     {
%         if (numero <= 1)
%             return false;

%         for (int i = 2; i <= Math.Sqrt(numero); i++)
%             if (numero % i == 0)
%                 return false;
        
%         return true;
%     }
% }

% -----------------------------------------

% -------- Código en Prolog --------------------

% Predicado is_prime(N) determina si un numero entero es primo

% Verifica si un número entero dado es primo.
is_prime(2).
is_prime(3).
is_prime(P) :-
    P > 3,
    P mod 2 =\= 0,
    \+ has_factor(P, 3).

% Verifica si un número tiene factores.
has_factor(N, L) :- 
    N mod L =:= 0.
has_factor(N, L) :- 
    L * L < N,
    L2 is L + 2,
    has_factor(N, L2).

% -----------------------------------------------------------------
% Ejemplos de uso
% ?- is_prime(5).
% Output:
% true.
% -----------------------------------------------------------------
