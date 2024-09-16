%------------------------------------------------------------------------------
% Módulo:       ordenar
% Propósito:	Ordena una lista de elementos.
% 
% Autor:        Erick Corrales
% Fecha:        12 de septiembre de 2024
% Versión:      1.0
%
% Descripción: 
% Ordenar los elementos de una lista utilizando la función lists:sort/1.
% 
% Dependencias
% Ninguna.
%
% Ejemplo de Uso:
% 1. Compilar el módulo: 
%    c(ordenar).
% 2. Llamar a la función:
%    ordenar:main().
%
% Historial de Cambios:
% 12/09/2024 - 1.0 - Creación del módulo con función básica `main/0` y `ordenar_lista/1`.
%
%------------------------------------------------------------------------------
-module(ordenar).
-export([main/0, ordenar_lista/1]).

main() ->
	Lista = ["Erick", 0, 12, 1052, "Valencia"],
	io:format("La lista desordenada es: ~p~n~n", [Lista]),
	io:format("La lista ordenada es: ~p~n", [ordenar_lista(Lista)]).

% Ordena una lista de elementos
ordenar_lista(L) ->
	lists:sort(L).