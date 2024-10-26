% ===============================================
% Autor: Erick Corrales
% Fecha: 26 de octubre de 2024
% Descripción: Programa en Prolog que genera el codigo Gray de N bits

% -------- Código en Python (comentado) ------------
% def gray(n):
%     if n == 1:
%         return ['0', '1']
%     else:
%         # Recursivamente generar el código de Gray para n-1
%         previous_gray = gray(n - 1)
%         
%         # Prefijar '0' a la lista anterior
%         with_zero = ['0' + code for code in previous_gray]
%         
%         # Prefijar '1' a la lista revertida de la anterior
%         with_one = ['1' + code for code in reversed(previous_gray)]
%         
%         # Combinar ambas listas
%         return with_zero + with_one
%
% # Ejemplo de uso
% n = 3  # Cambia este valor para generar códigos de Gray para diferentes longitudes
% gray_codes = gray(n)
% print(gray_codes)
% -------- Código en Prolog --------------------

% Predicado gray(N, C) que genera el codigo Gray de N bits
% en dos variables

gray(1, ['0', '1']).
gray(N, C) :-
    N > 1,
    N1 is N -1,
    gray(N1, C1),
    maplist(atom_concat('0'), C1, C0),
    reverse(C1, C1R),
    maplist(atom_concat('1'), C1R, C1G),
    append(C0, C1G, C).

% -----------------------------------------------------------------
% Ejemplos de uso
% ?- gray(3, C).
% Output:
% C = ['000', '001', '011', '010', '110', '111', '101', '100'].
% -----------------------------------------------------------------
