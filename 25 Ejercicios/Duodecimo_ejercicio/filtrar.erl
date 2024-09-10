-module(filtrar).
-export([main/0, filtrar_pares/1]).

main() ->
	List = [1, 15, 16, 28, 40, 90, 99],
	io:format("La lista ~p tiene los numeros pares ~p~n", [List, filtrar_pares(List)]).

% Filtrar los números pares de una lista
filtrar_pares(L) ->
	[X || X <- L, X rem 2 == 0].
