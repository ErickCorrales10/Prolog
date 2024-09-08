-module(concatenar).
-export([main/0, concatenar/2]).

main() ->
	List1 = ["Erick", "Messi", "Katakuri"],
	List2 = ["Melissa", 30, "Robles"],
	List3 = concatenar(List1, List2),
	io:format("La lista #1: ~p~n", [List1]),
	io:format("La lista #2: ~p~n", [List2]),
	io:format("La lista #3: ~p~n", [List3]).

% Concatena dos listas en una sola
concatenar(L1, L2) ->
	L1 ++ L2.
