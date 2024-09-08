-module(reverso).
-export([main/0, reverso/1]).

main() ->
	List = [1, 25, 78, 80, 100],
	io:format("La lista original: ~p~n", [List]),
	ReversedList = reverso(List),
	io:format("La lista invertida: ~p~n", [ReversedList]).

% Revierte el orden de una lista
reverso(L) ->
	lists:reverse(L).
