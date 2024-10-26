% ===============================================
% Autor: Erick Corrales
% Fecha: 26 de octubre de 2024
% Descripción: Programa en Prolog que genera una lista de numeros
%              primos en un rango dado

% -------- Código en C# (comentado) ------------
% class Program
% {
%     static bool EsPrimo(int num)
%     {
%         if (num <= 1)
%             return false;
%
%         for (int i = 2; i <= Math.Sqrt(num); i++)
%             if (num % i == 0)
%                 return false;
%         
%         return true;
%         
%     }
%
%     static void Main(string[] args)
%     {
%         int low = 10;
%         int high = 30;
%         List<int> lista = new List<int>();
%
%         for (int i = low; i <= high; i++)
%             if (EsPrimo(i))
%                 lista.Add(i);
%
%         Console.WriteLine("Números primos entre {0} y {1}:", low, high);
%         foreach (var numero in lista)
%             Console.Write("{0} ", numero);
%         Console.WriteLine();
%     }
% }
% -----------------------------------------

% -------- Código en Prolog --------------------

% Predicado prime_list(Low, High, Primes) que genera una lista de numeros
% primos en un rango dado

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

% -----------------------------------------------------------------
% Ejemplos de uso
% ?- prime_list(10, 30, Primes).
% Output:
% Primes = [11, 13, 17, 19, 23, 29].
% -----------------------------------------------------------------
