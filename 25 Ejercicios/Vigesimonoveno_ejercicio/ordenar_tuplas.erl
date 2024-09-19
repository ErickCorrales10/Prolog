
-module(ordenar_tuplas).
-export([main/0, sort/1]).

main() ->
    List = [{a, 3}, {b, 1}, {c, 2}],
    io:format("Lista original: ~p~n", [List]),
    SortedList = sort_by_second(List),
    io:format("Lista ordenada por el segundo elemento: ~p~n", [SortedList]).

sort(List) ->
    lists:sort(fun({_, X1}, {_, X2}) -> X1 < X2 end, List).

