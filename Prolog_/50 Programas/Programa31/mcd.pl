% ===============================================
% Autor: Erick Corrales
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que determina el maximo
%              comun divisor de dos numeros positivos

% -------- Código en Python (comentado) ------------
% def mcd(numero1, numero2):
%     if numero1 % numero2 == 0:
%         return numero2
%     else:
%         return mcd(numero2, numero1%numero2)
%
% numero1 = int(input('Ingrese el primer número entero positivo: '))
% numero2 = int(input('Ingrese el segundo número entero positivo: '))
%
% print(f'\nEl máximo común divisor es: {mcd(numero1, numero2)}')
% -----------------------------------------

% -------- Código en Prolog --------------------

% Predicado gcd(X, Y, G) qeu calcula el maximo comun divisor de dos numeros positivos

gcd(X, 0, X) :-
    X > 0.
gcd(X, Y, G) :-
    Y > 0,
    R is X mod Y,
    gcd(Y, R, G).

% -----------------------------------------------------------------
% Ejemplos de uso
% ?- gcd(48, 18, G)
% Output:
% G = 6
% -----------------------------------------------------------------
