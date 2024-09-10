-module(ordenar).
-export([main/0, ordenar_lista/1]).

main() ->
	Lista = ["Erick", 0, 12, 1052, "Valencia"],
	io:format("La lista desordenada es: ~p~n~n", [Lista]),
	io:format("La lista ordenada es: ~p~n", [ordenar_lista(Lista)]).

% Ordena una lista de elementos
ordenar_lista(L) ->
	lists:sort(L).