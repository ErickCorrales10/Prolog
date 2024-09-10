-module(convertir).
-export([main/0, entero_binario/1]).

main() ->
	N = 5,
	Resultado = entero_binario(N),
	io:format("El numero ~p tiene como representacion binaria el valor ~p~n", [N, Resultado]).

% Convertir 
entero_binario(N) ->
	integer_to_list(N, 2).
