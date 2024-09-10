-module(mapear).
-export([main/0, mapear/2]).

main() ->
	Lista = [1, 2, 3, 4, 5],

	% Definir función a aplicar
	Doble = fun(X) ->
			X * 2
	end,

	% Aplicar función a la lista
	Lista_dobles = mapear(Doble, Lista),

	% Imprimir resultados
	io:format("Lista original: ~p~n", [Lista]),
	io:format("Lista con dobles: ~p~n", [Lista_dobles]).

% Aplica una función a cada elemento de la lista
mapear(Fun, L) ->
	[Fun(X) || X <- L].
