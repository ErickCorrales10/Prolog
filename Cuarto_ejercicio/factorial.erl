-module(factorial).
-export([main/0, factorial/1]).

main() ->
	io:format("El factorial de 5 es: ~p~n", [factorial(5)]).

% Definición de la funciób factorial con un caso base y un caso recursivo.

factorial(0) ->
	1; % Caso base (termina en punto y coma)

factorial(N) when N > 0 ->
	N * factorial(N - 1). % Caso recursivo
