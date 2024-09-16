%------------------------------------------------------------------------------
% Módulo:       celsius_fahrenheit
% Propósito:	Convierte grados Celsius a Fahrenheit.
% 
% Autor:        Erick Corrales
% Fecha:        12 de septiembre de 2024
% Versión:      1.0
%
% Descripción: 
% Realizar una conversión de unidades utilizando una función simple.
% 
% Dependencias
% Ninguna.
%
% Ejemplo de Uso:
% 1. Compilar el módulo: 
%    c(celsius_fahrenheit).
% 2. Llamar a la función:
%    celsius_fahrenheit:main().
%
% Historial de Cambios:
% 12/09/2024 - 1.0 - Creación del módulo con función básica `main/0` y `celsius_fahrenheit_/1`.
%
%------------------------------------------------------------------------------
-module(celsius_fahrenheit).
-export([main/0, celsius_fahrenheit_/1]).

main() ->
	C = 28,
	io:format("El valor ~p grados Celsius es ~p grados Fahrenheit~n", [C, celsius_fahrenheit_(C)]).

% Convierte grados Celsius a Fahrenheit
celsius_fahrenheit_(C) ->
	C * 9 / 5 + 32.


