%------------------------------------------------------------------------------
% Módulo:       longitud
% Propósito:	Calcula la longitud de una lista.
% 
% Autor:        Erick Corrales
% Fecha:        12 de septiembre de 2024
% Versión:      1.0
%
% Descripción: 
% Calcular la longitud de una lista utilizando la función estándar length/1.
%
% Dependencias:
% Ninguna.
%
% Ejemplo de Uso:
% 1. Compilar el módulo: 
%    c(longitud).
% 2. Llamar a la función:
%    longitud:main().
%
% Historial de Cambios:
% 12/09/2024 - 1.0 - Creación del módulo con función básica `main/0` y `longitud/1`.
%
%------------------------------------------------------------------------------
-module(longitud).
-export([main/0, longitud/1]).

main() ->
	List = ["Erick", "Corrales", "Quintero", 29],
	io:format("La lista: ~p tiene una longitud de ~p~n", [List, longitud(List)]).

% Calcula la longitud de una lista
longitud(L) ->
	length(L).
