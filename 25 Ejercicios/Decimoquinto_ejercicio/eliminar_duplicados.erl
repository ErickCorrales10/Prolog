%------------------------------------------------------------------------------
% Módulo:       eliminar_duplicados
% Propósito:	Elimina los elementos duplicados de una lista
% 
% Autor:        Erick Corrales
% Fecha:        12 de septiembre de 2024
% Versión:      1.0
%
% Descripción: 
% Usar la función usort/1 para eliminar duplicados y ordenar una lista.
% 
% Dependencias
% Ninguna.
%
% Ejemplo de Uso:
% 1. Compilar el módulo: 
%    c(eliminar_duplicados).
% 2. Llamar a la función:
%    eliminar_duplicados:main().
%
% Historial de Cambios:
% 12/09/2024 - 1.0 - Creación del módulo con función básica `main/0` y `eliminar_duplicados_/1`.
%
%------------------------------------------------------------------------------
-module(eliminar_duplicados).
-export([main/0, eliminar_duplicados_/1]).

main() ->
	ListaDuplicados = ["Erick", "Erick", "Messi", "Melissa", 10],
	ListaSinDuplicados = eliminar_duplicados_(ListaDuplicados),
	io:format("La lista con duplicados es: ~p~n", [ListaDuplicados]),
	io:format("La lista sin duplicados: ~p~n", [ListaSinDuplicados]).

% Elimina los elementos duplicados de una lista
eliminar_duplicados_(L) ->
	lists:usort(L).
