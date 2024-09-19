%------------------------------------------------------------------------------
% Módulo:       remove_item
% Propósito:    Elimina un elemento de una lista.
% 
% Autor:        Erick Corrales
% Fecha:        18 de septiembre de 2024
% Versión:      1.0
%
% Descripción: 
% Aprender a utilizar las herramientas de erlang para eliminar elementos de listas.
%
% Dependencias:
% Ninguna.
%
% Ejemplo de Uso:
% 1. Compilar el módulo: 
%    c(remove_item).
% 2. Llamar a la función:
%    remove_item:main().
%
% Historial de Cambios:
% 12/09/2024 - 1.0 - Creación del módulo con función básica `main/0` y `remove_item/2`.
%
%------------------------------------------------------------------------------

-module(remove_item).
-export([main/0]).

main() ->
  Lista = [1, 2, 3, 4, 5],
  io:format("La lista es ~p~n", [Lista]),
  NuevaLista = remove_element(2, Lista),
  io:format("La nueva lista depues de eliminar el elemento en la posicion 2 es: ~p~n", [NuevaLista)).
  
remove_element(Index, Items) ->
    {Left, [_|Right]} = lists:split(Index-1, Items),
    Left ++ Right.
