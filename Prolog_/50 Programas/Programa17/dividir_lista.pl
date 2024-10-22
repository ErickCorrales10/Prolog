% ===============================================
% Autor: Erick Corrales
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que divide una lista en dos partes
% ===============================================

% -------- Código en Python (comentado) ------------
% def dividir_lista(lista, n):
%     % Usar slicing para dividir la lista en dos partes
%     return lista[:n], lista[n:] 

% lista = ['a', 'b', 'c', 'd', 'e', 'f', 'g']
% print(f"Lista original: {lista}")
% n = 3
% lista1, lista2 = dividir_lista(lista, n)
% print(f'Lista 1: {lista1}')
% print(f'Lista 2: {lista2}')
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Predicado split(L, N, [], L) que divide una lista en dos partes

% La longitud de la primera parte esta dad por el segundo argumento
split(L, 0, [], L).

split([H|T], N, [H|L1], L2) :-
    N > 0,
    N1 is N - 1,
    split(T, N1, L1, L2).

% -----------------------------------------------------------------
% Ejemplos de uso
% ?- split([a, b, c, d, e], 3, L1, L2).
% Output:
% L1 = [a, b, c],
% L2 = [d, e].
% -----------------------------------------------------------------
