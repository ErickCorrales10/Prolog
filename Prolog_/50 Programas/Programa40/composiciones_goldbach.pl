% ===============================================
% Autor: Erick Corrales
% Fecha: 26 de octubre de 2024
% Descripción: Programa en Prolog que encuentra las composiciones de 
%              Goldbach para todos los numeros pares dentro de un rango

% -------- Código en C# (comentado) ------------

% using System;
% using System.Collections.Generic;
%
% class Program
% {
%     static void Main()
%     {
%         int low = 4; // Cambia este valor según sea necesario
%         int high = 20; // Cambia este valor según sea necesario
%         GoldbachList(low, high);
%     }
%
%     static void GoldbachList(int low, int high)
%     {
%         var results = new List<(int N, int P1, int P2)>();
%
%         for (int n = low; n <= high; n += 2)
%         {
%             if (n > 2)
%             {
%                 var (p1, p2) = Goldbach(n);
%                 if (p1 <= p2)
%                 {
%                     results.Add((n, p1, p2));
%                 }
%             }
%         }
%
%         MostrarResultados(results);
%     }
%
%     static (int P1, int P2) Goldbach(int n)
%     {
%         var primes = PrimeList(2, n);
%         foreach (var p1 in primes)
%         {
%             int p2 = n - p1;
%             if (IsPrime(p2))
%             {
%                 return (p1, p2);
%             }
%         }
%         return (0, 0); // Si no se encuentra ninguna pareja
%     }
%
%     static List<int> PrimeList(int low, int high)
%     {
%         var primes = new List<int>();
%         for (int p = low; p <= high; p++)
%         {
%             if (IsPrime(p))
%             {
%                 primes.Add(p);
%             }
%         }
%         return primes;
%     }
%
%     static bool IsPrime(int n)
%     {
%         if (n < 2) return false;
%         if (n == 2 || n == 3) return true;
%         if (n % 2 == 0) return false;
%
%         return !HasFactor(n, 3);
%     }
%
%     static bool HasFactor(int n, int l)
%     {
%         if (l * l > n) return false;
%         if (n % l == 0) return true;
%         return HasFactor(n, l + 2);
%     }
%
%     static void MostrarResultados(List<(int N, int P1, int P2)> results)
%     {
%         foreach (var result in results)
%         {
%             Console.WriteLine("[{result.N}, {result.P1}, {result.P2}]");
%         }
%     }
% }
% -----------------------------------------

% -------- Código en Prolog --------------------

% Predicado goldbach_list(Low, High) que encuentra las composiciones de Goldbach
% para todos los numeros pares dentro de un rango

goldbach_list(Low, High) :-
    bagof([N, P1, P2], (between(Low, High, N), N mod 2 =:= 0, goldbach(N, [P1, P2]), P1 =< P2), L),
    mostrar_resultados(L).

goldbach(N, [P1, P2]) :-
    N > 2,
    N mod 2 =:= 0,
    prime_list(2, N, Primes),
    member(P1, Primes),
    P2 is N - P1,
    is_prime(P2).

prime_list(Low, High, Primes) :-
    findall(P, (between(Low, High, P), is_prime(P)), Primes).

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

mostrar_resultados(L) :-
    forall(member(X, L), (write(X), nl)).

% -----------------------------------------------------------------
% Ejemplos de uso
% ?- goldbach_list(4, 20, L).
% Output:
% L = [[4, 2, 2], 
%   [6, 3, 3], 
%   [8, 3, 5], 
%   [10, 5, 5], 
%   [12, 5, 7], 
%   [14, 7, 7], 
%   [16, 5, 11], 
%   [18, 7, 11], 
%   [20, 7, 13]].
% -----------------------------------------------------------------
