%------------------------------------------------------------------------------
% Módulo:       factorial
% Propósito:    Calcula el factorial de un número de forma recursiva.
% 
% Autor:        Erick Corrales
% Fecha:        12 de septiembre de 2024
% Versión:      1.0
%
% Descripción: 
% Aprender a usar la recursión para resolver problemas matemáticos, 
% calculando el factorial de un número.
%
% Dependencias:
% Ninguna.
%
% Ejemplo de Uso:
% 1. Compilar el módulo: 
%    c(factorial).
% 2. Llamar a la función:
%    factorial:main().
%
% Historial de Cambios:
% 12/09/2024 - 1.0 - Creación del módulo con función básica `main/0` y `factorial/1`.
%
%------------------------------------------------------------------------------
-module(factorial).
-export([main/0, factorial/1]).

main() ->
	io:format("El factorial de 5 es: ~p~n", [factorial(5)]).

% Definición de la funciób factorial con un caso base y un caso recursivo.

factorial(0) ->
	1; % Caso base (termina en punto y coma)

factorial(N) when N > 0 ->
	N * factorial(N - 1). % Caso recursivo
