-module(celsius_fahrenheit).
-export([main/0, celsius_fahrenheit_/1]).

main() ->
	C = 28,
	io:format("El valor ~p grados Celsius es ~p grados Fahrenheit~n", [C, celsius_fahrenheit_(C)]).

% Convierte grados Celsius a Fahrenheit
celsius_fahrenheit_(C) ->
	C * 9 / 5 + 32.


