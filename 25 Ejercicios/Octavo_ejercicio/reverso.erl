%------------------------------------------------------------------------------
% Módulo:       reverso
% Propósito:    Revierte el orden de una lista.
% 
% Autor:        Erick Corrales
% Fecha:        12 de septiembre de 2024
% Versión:      1.0
%
% Descripción: 
% Usar funciones de listas de Erlang para invertir el orden de los elementos de una lista.
%
% Dependencias:
% Ninguna.
%
% Ejemplo de Uso:
% 1. Compilar el módulo: 
%    c(reverso).
% 2. Llamar a la función:
%    reverso:main().
%
% Historial de Cambios:
% 12/09/2024 - 1.0 - Creación del módulo con función básica `main/0` y `reverso/1`.
%
%------------------------------------------------------------------------------
-module(reverso).
-export([main/0, reverso/1]).

main() ->
	List = [1, 25, 78, 80, 100],
	io:format("La lista original: ~p~n", [List]),
	ReversedList = reverso(List),
	io:format("La lista invertida: ~p~n", [ReversedList]).

% Revierte el orden de una lista
reverso(L) ->
	lists:reverse(L).
