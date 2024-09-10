-module(convertir2).
-export([main/0, binario_entero/1]).

main() ->
	Bin = "1010",
	io:format("El numero binario ~p tiene como representacion en entero el valor ~p~n", [Bin, binario_entero(Bin)]).

binario_entero(Bin) ->
	list_to_integer(Bin, 2).
