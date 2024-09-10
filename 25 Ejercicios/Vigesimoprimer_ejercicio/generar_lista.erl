-module(generar_lista).
-export([main/0, generar_lista_/1]).

main() ->
	N = 5,
	Lista = generar_lista_(N),
	io:format("La lista formada por ~p numeros es: ~p~n", [N, Lista]).

% Genera una lista de números del 1 a N
generar_lista_(N) ->
	lists:seq(1, N).
