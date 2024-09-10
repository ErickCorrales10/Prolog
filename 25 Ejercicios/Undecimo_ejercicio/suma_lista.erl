-module(suma_lista).
-export([main/0, sumar_lista/1]).

main() ->
	List = [45, 150, 11, 10],
	Suma = sumar_lista(List),
	io:format("La suma de la lista ~p es ~p~n", [List, Suma]).

% Sumar los elementos de una lista recursivamente
sumar_lista([]) ->
	0;
sumar_lista([H|T]) ->
	H + sumar_lista(T).
