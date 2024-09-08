-module(capturar).
-export([main/0, capturar_numero/0]).

main()->
	capturar_numero().

capturar_numero()->
	io:format("Ingrese un numero: "),
	{ok, [Numero]} = io:fread("", "~d"),
	io:format("El numero ingresado es: ~p~n", [Numero]).