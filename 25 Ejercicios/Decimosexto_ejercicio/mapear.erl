%------------------------------------------------------------------------------
% Módulo:       mapear
% Propósito:	Aplica una función a cada elemento de una lista.
% 
% Autor:        Erick Corrales
% Fecha:        12 de septiembre de 2024
% Versión:      1.0
%
% Descripción: 
% Aplicar una función a cada elemento de una lista, demostrando el uso de listas de comprensión.
% 
% Dependencias
% Ninguna.
%
% Ejemplo de Uso:
% 1. Compilar el módulo: 
%    c(mapear).
% 2. Llamar a la función:
%    mapear:main().
%
% Historial de Cambios:
% 12/09/2024 - 1.0 - Creación del módulo con función básica `main/0` y `mapear/2`.
%
%------------------------------------------------------------------------------
-module(mapear).
-export([main/0, mapear/2]).

main() ->
	Lista = [1, 2, 3, 4, 5],

	% Definir función a aplicar
	Doble = fun(X) ->
			X * 2
	end,

	% Aplicar función a la lista
	Lista_dobles = mapear(Doble, Lista),

	% Imprimir resultados
	io:format("Lista original: ~p~n", [Lista]),
	io:format("Lista con dobles: ~p~n", [Lista_dobles]).

% Aplica una función a cada elemento de la lista
mapear(Fun, L) ->
	[Fun(X) || X <- L].
