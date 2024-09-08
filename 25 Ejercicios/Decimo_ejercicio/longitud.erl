-module(longitud).
-export([main/0, longitud/1]).

main() ->
	List = ["Erick", "Corrales", "Quintero", 29],
	io:format("La lista: ~p tiene una longitud de ~p~n", [List, longitud(List)]).

% Calcula la longitud de una lista
longitud(L) ->
	length(L).
