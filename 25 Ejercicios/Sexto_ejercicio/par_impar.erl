-module(par_impar).
-export([main/0, par_o_impar/1]).

main() ->
	par_o_impar(10).

par_o_impar(N) when N rem 2 == 0 ->
	io:format("El numero ingresado es Par~n");
par_o_impar(_) ->
	io:format("El numero ingresado es Impar~n").
