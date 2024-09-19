%------------------------------------------------------------------------------
% Módulo:       reemplazar
% Propósito:    Reemplazar un elemento en una lista
% 
% Autor:        Erick Corrales
% Fecha:        18 de septiembre de 2024
% Versión:      1.0
%
% Descripción: 
% Aprender a reemplazar elementos de una lista por nuevos.
%
% Dependencias:
% Ninguna.
%
% Ejemplo de Uso:
% 1. Compilar el módulo: 
%    c(reemplazar).
% 2. Llamar a la función:
%    reemplazar:main().
%
% Historial de Cambios:
% 12/09/2024 - 1.0 - Creación del módulo con función básica `main/0` y `replace/3`.
%
%------------------------------------------------------------------------------
-module(reemplazar).
-export([main/0, replace/3]).

main() ->
    List = [a, b, c, d, e],
    io:format("Lista original: ~p~n", [List]),
    NewList = replace(List, b, x),
    io:format("Lista después de reemplazar 'b' por 'x': ~p~n", [NewList]).

replace([], _, _) ->
    [];
replace([Old | Rest], Old, New) ->
    [New | Rest];
replace([Head | Tail], Old, New) ->
    [Head | replace(Tail, Old, New)].
