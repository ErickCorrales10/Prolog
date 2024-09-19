%------------------------------------------------------------------------------
% Módulo:       substring
% Propósito:    Ibtener la parte de un String
% 
% Autor:        Erick Corrales
% Fecha:        18 de septiembre de 2024
% Versión:      1.0
%
% Descripción: 
% Aprender a usar las funciones incluidas en Erlang para obtener fragmnetos de Strings
%
% Dependencias:
% Ninguna.
%
% Ejemplo de Uso:
% 1. Compilar el módulo: 
%    c(substring).
% 2. Llamar a la función:
%    substring:main().
%
% Historial de Cambios:
% 12/09/2024 - 1.0 - Creación del módulo con función básica `main/0` y `substring/3`.
%
%------------------------------------------------------------------------------
-module(substring).
-export([main/0]).

main() ->
  String = "Hello, World!",
  io:format("Se desea obtener por separado la palabra World de la frase Hello, World!~n"),
  SubString = substring(String, 9, 13),
  io:format("Y aqui se encuentra en una variable: ~p~n", [SubString]).

substring(String, StartIndex, EndIndex) ->
    AdjustedStart = StartIndex - 1, % Convertir a índice basado en cero
    Length = EndIndex - StartIndex + 1,
    Substring = lists:sublist(String, AdjustedStart, Length),
    Substring.
