-module(ocurrencias).
-export([main/0, contar_ocurrencias/2]).

main() ->
	Lista = [1, 2, 10, 5, 1, 25, 1, 98],
	Elemento = 1,
	io:format("El elemento ~p aparece ~p veces en la lista~n", [Elemento, contar_ocurrencias(Elemento, Lista)]).

% Cuenta cuántas veces aparece un elemento en una lista
contar_ocurrencias(Elemento, Lista) ->
	length([X || X <- Lista, X == Elemento]).
