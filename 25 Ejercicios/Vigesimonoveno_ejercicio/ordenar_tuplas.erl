%------------------------------------------------------------------------------
% Módulo:       ordenar_tuplas
% Propósito:    Ordenar tuplas
% 
% Autor:        Erick Corrales
% Fecha:        18 de septiembre de 2024
% Versión:      1.0
%
% Descripción: 
% Aprender a oordenar tuplas
%
% Dependencias:
% Ninguna.
%
% Ejemplo de Uso:
% 1. Compilar el módulo: 
%    c(ordenar_tuplas).
% 2. Llamar a la función:
%    ordenar_tuplas:main().
%
% Historial de Cambios:
% 12/09/2024 - 1.0 - Creación del módulo con función básica `main/0` y `sort/1`.
%
%------------------------------------------------------------------------------

-module(ordenar_tuplas).
-export([main/0, sort/1]).

main() ->
    List = [{a, 3}, {b, 1}, {c, 2}],
    io:format("Lista original: ~p~n", [List]),
    SortedList = sort(List),
    io:format("Lista ordenada por el segundo elemento: ~p~n", [SortedList]).

sort(List) ->
    lists:sort(fun({_, X1}, {_, X2}) -> X1 < X2 end, List).

