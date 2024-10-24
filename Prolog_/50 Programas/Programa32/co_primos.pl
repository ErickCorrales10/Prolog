% ===============================================
% Autor: Erick Corrales
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que determina si dos numeros
%              positivos son coprimos

% -------- Código en C# (comentado) ------------
% class Program
% {
%     static int MCD(int num1, int num2)
%     {
%         if (num1%num2 == 0)
%             return num2;
%         else
%             return MCD(num2, num1%num2);
%     }
%     
%     static bool EsCoPrimo(int x, int y)
%     {
%         int resultado = MCD(x, y);
%         if (resultado == 1)
%             return true;
%         else
%             return false;
%     }
%     
%     static void IngresarNumeros(out int num1, out int num2)
%     {
%         Console.WriteLine("Ingrese dos números enteros positivos");
%         Console.Write("Primer número: ");
%         if (int.TryParse(Console.ReadLine(), out num1)){/* No hay acción a realizar en el if */}
%         else
%         {
%             Console.WriteLine("Entrada no válida");
%             Console.ReadKey();
%             Environment.Exit(0);
%         }
%         Console.Write("Segundo número: ");
%         if (int.TryParse(Console.ReadLine(), out num2));
%         else
%         {
%             Console.WriteLine("Entrada no válida");
%             Console.ReadKey();
%             Environment.Exit(0);
%         }
%     }
%     
%     static void Main(string[] args)
%     {
%         int num1, num2;
%         IngresarNumeros(out num1, out num2); % Se puede usar out para variables que no se inicializan y ref para variables inicializadas
%         if(EsCoPrimo(num1, num2))
%             Console.WriteLine($"Los números {num1} y {num2} son co-primos");
%         else
%             Console.WriteLine($"Los números {num1} y {num2} NO son co-primos");
%     }
% }
% -----------------------------------------

% -------- Código en Prolog --------------------

% Predicado coprime(X, Y) que determina si dos numeros son coprimos si su maximo
% comun divisor es 1

coprime(X, Y) :-
    gcd(X, Y, 1).

% Predicado gcd(X, Y, G) que calcula el maximo comun divisor de X y Y
gcd(X, 0, X) :-
    X > 0.
gcd(X, Y, G) :-
    Y > 0,
    R is X mod Y,
    gcd(Y, R, G).

% -----------------------------------------------------------------
% Ejemplos de uso
% ?- coprime(14, 15).
% Output:
% true
% -----------------------------------------------------------------
