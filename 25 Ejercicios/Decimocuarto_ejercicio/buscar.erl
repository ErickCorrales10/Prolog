-module(buscar).
-export([main/0, buscar/2]).

main() ->
	Lista = ["Erick", 10, "Melissa", "Messi"],
	Elemento1 = "Roberto",
	Elemento2 = "Melissa",
	io:format("~p se ecuentra en la lista? ~p~n", [Elemento1, buscar(Elemento1, Lista)]),
	io:format("~p se ecuentra en la lista? ~p~n", [Elemento2, buscar(Elemento2, Lista)]).

% Devuelve true si el elemento está en la lista, false en caso contrario
buscar(Elemento, Lista) ->
	lists:member(Elemento, Lista).
