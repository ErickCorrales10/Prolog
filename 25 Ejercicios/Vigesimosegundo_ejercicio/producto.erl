-module(producto).
-export([main/0, producto_lista/1]).

main() ->
	Lista = [1, 45, 2, 8, 65, 2],
	io:format("La lista original: ~p~n~n", [Lista]),
	io:format("EL producto de todos los elementos de la lista: ~p~n", [producto_lista(Lista)]).

% Calcula el producto de todos los elementos de una lista
producto_lista([]) ->
	1;
producto_lista([H|T]) ->
	H * producto_lista(T).
