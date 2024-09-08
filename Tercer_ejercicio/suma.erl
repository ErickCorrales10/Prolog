-module(suma).
-export([main/0, suma/2]).

main() ->
	io:format("La suma es: ~p~n", [suma(4, 5)]).

suma(X, Y) ->
	X + Y.