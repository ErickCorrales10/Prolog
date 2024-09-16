%------------------------------------------------------------------------------
% Módulo:       ocurrencias
% Propósito:	Cuenta cuántas veces aparece un elemento en una lista.
% 
% Autor:        Erick Corrales
% Fecha:        12 de septiembre de 2024
% Versión:      1.0
%
% Descripción: 
% Contar cuántas veces aparece un elemento en una lista utilizando listas de comprensión.
% 
% Dependencias
% Ninguna.
%
% Ejemplo de Uso:
% 1. Compilar el módulo: 
%    c(ocurrencias).
% 2. Llamar a la función:
%    ocurrencias:main().
%
% Historial de Cambios:
% 12/09/2024 - 1.0 - Creación del módulo con función básica `main/0` y `contar_ocurrencias/2`.
%
%------------------------------------------------------------------------------
-module(ocurrencias).
-export([main/0, contar_ocurrencias/2]).

main() ->
	Lista = [1, 2, 10, 5, 1, 25, 1, 98],
	Elemento = 1,
	io:format("Los valores en la lista son: ~p~n", [Lista]),
	io:format("El elemento ~p aparece ~p veces en la lista~n", [Elemento, contar_ocurrencias(Elemento, Lista)]).

% Cuenta cuántas veces aparece un elemento en una lista
contar_ocurrencias(Elemento, Lista) ->
	length([X || X <- Lista, X == Elemento]).
