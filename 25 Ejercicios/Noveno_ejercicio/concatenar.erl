%------------------------------------------------------------------------------
% Módulo:       concatenar
% Propósito:    Concatena dos listas en una sola.
% 
% Autor:        Erick Corrales
% Fecha:        12 de septiembre de 2024
% Versión:      1.0
%
% Descripción: 
% Aprender a unir dos listas usando el operador de concatenación.
%
% Dependencias:
% Ninguna.
%
% Ejemplo de Uso:
% 1. Compilar el módulo: 
%    c(concatenar).
% 2. Llamar a la función:
%    concatenar:main().
%
% Historial de Cambios:
% 12/09/2024 - 1.0 - Creación del módulo con función básica `main/0` y `concatenar/2`.
%
%------------------------------------------------------------------------------
-module(concatenar).
-export([main/0, concatenar/2]).

main() ->
	List1 = ["Erick", "Messi", "Katakuri"],
	List2 = ["Melissa", 30, "Robles"],
	List3 = concatenar(List1, List2),
	io:format("La lista #1: ~p~n", [List1]),
	io:format("La lista #2: ~p~n", [List2]),
	io:format("La lista #3: ~p~n", [List3]).

% Concatena dos listas en una sola
concatenar(L1, L2) ->
	L1 ++ L2.
