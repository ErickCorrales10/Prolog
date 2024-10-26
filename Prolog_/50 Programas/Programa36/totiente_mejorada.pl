% ===============================================
% Autor: Erick Corrales
% Fecha: 26 de octubre de 2024
% Descripción: Programa en Prolog que calcula la función totiente
%              Euler phi(m) mejorada

% -------- Código en C# (comentado) ------------
% public class TotientCalculator
% {
%     public static int TotientImproved(int n)
%     {
%         var factors = PrimeFactorsWithMultiplicity(n);
%         return TotientPhi(factors);
%     }
%
%     private static int TotientPhi(List<(int Prime, int Multiplicity)> factors)
%     {
%         int phi = 1;
%         foreach (var (prime, multiplicity) in factors)
%         {
%             phi *= (int)(Math.Pow(prime, multiplicity - 1) * (prime - 1));
%         }
%         return phi;
%     }
%
%     private static List<(int Prime, int Multiplicity)> PrimeFactorsWithMultiplicity(int n)
%     {
%         var factors = PrimeFactors(n);
%         return Encode(factors);
%     }
%
%     private static List<int> PrimeFactors(int n)
%     {
%         var factors = new List<int>();
%         for (int i = 2; i * i <= n; i++)
%         {
%             while (n % i == 0)
%             {
%                 factors.Add(i);
%                 n /= i;
%             }
%         }
%         if (n > 1)
%         {
%             factors.Add(n);
%         }
%         return factors;
%     }
%
%     private static List<(int, int)> Encode(List<int> factors)
%     {
%         var encoded = new List<(int, int)>();
%         foreach (var group in factors.GroupBy(f => f))
%         {
%             encoded.Add((group.Key, group.Count()));
%         }
%         return encoded;
%     }
% }
%
% class Program
% {
%     static void Main()
%     {
%         int n = 10; % Cambia este valor para probar con otros números
%         int phi = TotientCalculator.TotientImproved(n);
%         Console.WriteLine($"Phi({n}) = {phi}");
%     }
% }
% -----------------------------------------

% -------- Código en Prolog --------------------

% Predicado que calcula la función totiente usando los factores primos con 
% multiplicidad para mejorar la eficiencia

totient_improved(N, Phi) :-
    prime_factors_mult(N, F),
    totient_phi(F, Phi).

totient_phi([], 1).
totient_phi([(P, M)|T], Phi) :-
    totient_phi(T, Phi1),
    Phi is Phi1 * (P - 1) * P ** (M -1).

% Determina los factores primos con su multiplicidad.
prime_factors_mult(N, L) :- 
    prime_factors(N, F), 
    encode(F, L).

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

% Para manejar la codificación de la multiplicidad
encode([], []).
encode([H|T], [(H, Count)|EncodedTail]) :-
    count_occurrences(H, [H|T], Count),
    remove_occurrences(H, T, NewTail),
    encode(NewTail, EncodedTail).

count_occurrences(X, List, Count) :-
    include(=(X), List, Occurrences),
    length(Occurrences, Count).

remove_occurrences(_, [], []).
remove_occurrences(X, [X|T], R) :- remove_occurrences(X, T, R).
remove_occurrences(X, [Y|T], [Y|R]) :- X \= Y, remove_occurrences(X, T, R).

% -----------------------------------------------------------------
% Ejemplos de uso
% ?- totient_improved(10, Phi).
% Output:
% Phi = 4
% -----------------------------------------------------------------
