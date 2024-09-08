-module(maximo).
-export([main/0, max_/2]).

main() ->
	io:format("El mayor de los numeros es: ~p~n", [max_(15, 10)]).

% Devuelve el mayor de dos numeros
max_(X, Y) when X > Y ->
	X;
max_(_, Y) ->
	Y.
