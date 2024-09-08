-module(fibonacci).
-export([main/0, fibonacci/1]).

main() ->
	io:format("El valor de fibonacci es: ~p~n", [fibonacci(5)]).

fibonacci(0) ->
	0;
fibonacci(1) ->
	1;
fibonacci(N) when N > 1 ->
	fibonacci(N - 1) + fibonacci(N - 2).
