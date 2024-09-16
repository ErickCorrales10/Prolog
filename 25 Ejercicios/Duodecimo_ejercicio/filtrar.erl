%------------------------------------------------------------------------------
% Módulo:       filtrar
% Propósito:	Filtra los números pares de una lista.
% 
% Autor:        Erick Corrales
% Fecha:        12 de septiembre de 2024
% Versión:      1.0
%
% Descripción: 
% Usar listas de comprensión para filtrar elementos específicos de una lista.
%
% Dependencias:
% Ninguna.
%
% Ejemplo de Uso:
% 1. Compilar el módulo: 
%    c(filtrar).
% 2. Llamar a la función:
%    filtrar:main().
%
% Historial de Cambios:
% 12/09/2024 - 1.0 - Creación del módulo con función básica `main/0` y `filtrar_pares/1`.
%
%------------------------------------------------------------------------------
-module(filtrar).
-export([main/0, filtrar_pares/1]).

main() ->
	List = [1, 15, 16, 28, 40, 90, 99],
	io:format("La lista ~p tiene los numeros pares ~p~n", [List, filtrar_pares(List)]).

% Filtrar los números pares de una lista
filtrar_pares(L) ->
	[X || X <- L, X rem 2 == 0].
