% ===============================================
% Autor: Erick Corrales
% Fecha: 18 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              el penúltimo elemento de una lista.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------

% class Program
%    {
%        public static void Main(string[] args)
%        {
%            Console.Clear();
%            List<char> lista = new List<char> { 'a', 'b', 'c', 'd'};
%            char penultimoElemento = MyPenultimate(lista);
%
%            Console.WriteLine($"El penúltimo elemento de la lista es: {penultimoElemento}");
%            Console.ReadKey();
%            Console.Clear();
%        }
%
%        static T MyPenultimate<T>(List<T> lista)
%        {
%            if(lista == null || lista.Count <= 1)
%                throw new ArgumentException("La lista debe de tener más de un elemento");
%           
%            return lista[lista.Count - 2];
%        }
%    }

% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado penultimate(X, [X, _]) que determina el penúltimo
% elemento X de la lista List.

% Caso base: el penúltimo elemento es cuando la lista solo tiene dos elementos.
penultimate(X, [X, _]).

% Caso recursivo: Se activa cuando la lista tiene mas de dos elementos
penultimate(X, [_|T]) :-
	penultimate(X, T).

% Ejemplo de uso:
% ?- penultimate(X, [a, b, c, d]).
% ----------------------------------------------