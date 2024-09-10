-module(comprobar).
-export([main/0, esta_vacia/1]).

main() ->
	List = [1, 2, 3],
	Resultado = esta_vacia(List),
	io:format("La lista está vacía? ~p~n", [Resultado]).

% Verifica si una lista está vacía
esta_vacia(L) ->
	L == [].
