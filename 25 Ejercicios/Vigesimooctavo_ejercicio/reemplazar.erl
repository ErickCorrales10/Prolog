-module(reemplazar).
-export([main/0, replace/3]).

main() ->
    List = [a, b, c, d, e],
    io:format("Lista original: ~p~n", [List]),
    NewList = replace(List, b, x),
    io:format("Lista después de reemplazar 'b' por 'x': ~p~n", [NewList]).

replace([], _, _) ->
    [];
replace([Old | Rest], Old, New) ->
    [New | Rest];
replace([Head | Tail], Old, New) ->
    [Head | replace(Tail, Old, New)].
